*31.;
data car_data;
	set SASHELP.CARS;
	if Weight < 3000 then Weight_Group = 0;
	if Weight >= 3000 then Weight_Group = 1;
	keep Make Model Weight Weight_Group;
run;

proc freq data = car_data;
	tables Weight_group / plot = freqplot;
run;

*32. if then statements;
data cars3;
	set SASHELP.CARS;
	if Weight < 3000 then Weight_Group = 0;
	if Weight >= 3000 and Weight < 3500 then Weight_Group = 1;
	/*Alternate way
	if 3000 <= Weight < 3500 then Weight_Group = 1;*/
	if Weight >= 3500 and Weight < 4000 then Weight_Group = 2;
	if Weight >= 4000 then Weight_Group = 3;
	keep Make Model Weight Weight_Group;
run;

proc freq data = cars3;
	tables Weight_group / plot = freqplot;
run;

*33. else if then statements;
data cars3;
	set SASHELP.CARS;
	if Weight < 3000 then Weight_Group = 0;
	else if Weight < 3500 then Weight_Group = 1;
	else if Weight < 4000 then Weight_Group = 2;
	else Weight_Group = 3;
	keep Make Model Weight Weight_Group;
run;

proc freq data = cars3;
	tables Weight_group / plot = freqplot;
run;

*34.; 
data cars3;
	set SASHELP.CARS;
	if MPG_City > 26 and MPG_Highway > 30 then Efficiency_Code = 1;
	else if MPG_City > 26 or MPG_Highway > 30 then Efficiency_Code = 2;
	else Efficiency_Code = 3;
	keep Make Model MPG_CITY MPG MPG_Highway Efficiency_Code;
run;

*35.;
data car_efficiency_categories;
	set SASHELP.CARS;
	if MPG_CITY > 30 then do;
		Efficiency = 1;
		Group = "High Efficiency";
		end;
	else if MPG_City > 25 then do;
		Efficiency = 2;
		Group = "Mid Efficiency";
		end;
	else do;
		Efficiency = 3;
		Group = "Low Efficiency";
		end;
	keep Make Model MPG_CITY Efficiency Group;
run;

/* SAS exercise 36 */
* creating and writing to multiple tables;
data High_Efficiency Mid_Efficiency Low_Efficiency;
	set SASHELP.CARS;
	if MPG_City > 30 then do;
		Efficiency = 1;
		Group = "High Efficiency";
		output High_Efficiency;
	end;
	else if MPG_City > 25 then do;
		Efficiency = 2;
		Group = "Mid Efficiency";
		output Mid_Efficiency;
	end;
	else do;
		Efficiency = 3;
		Group = "Low Efficiency";
		output Low_Efficiency;
	end;
	keep Make Model MPG_City Group Efficiency;
run;