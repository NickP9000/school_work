/*Intro to data steps*/

data class_data;
	set SASHELP.class;
run;

proc print data = class_data;
	
run;

*exercise 16 using logical operators;
data class_data;
	set SASHELP.class;
	where Age >= 13;
run;


*17 using AND to combine logical operators;
data class_data;
	set SASHELP.class;
	where Age >= 13 and Sex = 'M';
run;

*18 using KEEP;
data class_data;
	set SASHELP.CLASS;
	keep Name Age;
	where Age >= 13;
run;

*19 using DROP;
data class_data;
	set SASHELP.CLASS;
	drop Sex Height Weight;
	where Age >= 13;
run;

*20 using expressions to create new columns;
data class_data;
	set SASHELP.CLASS;
	weight_kg = Weight * 0.453592;
	height_m = Height * 0.0254;
run;

*21;
data my_stocks;
	set sashelp.stocks;
	Difference = Close - Open;
run;

*22;
proc sort data=SASHELP.CLASS out=sorted_class;
	by descending Age;
run;