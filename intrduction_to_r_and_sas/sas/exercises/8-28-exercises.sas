*1.;
/*data step*/
data temperature;

	F = 76;
	C = (F-32)*5/9;
	
/*proc step*/
proc print data = temperature;
run;

*2.;
/*data step*/
data nums;
	average = (1+4+5+7+3+4+6+2)/8;

/*proc step*/
proc print data = nums;
run;

*3.;
proc means data=SASHELP.HEART;
	VAR Height Weight Diastolic Systolic;
run;

/*
1. proc means is run on all columns
2. 19.9834015
3. Variance and median can be determined by putting var and median in the <options> section
*/

*1;
proc means data=SASHELP.HEART;
run;

*2;
proc means data=SASHELP.HEART STD;
	Var MRW;
run;

*3;
proc means data=SASHELP.HEART VAR MEDIAN;
	VAR Height Weight Diastolic Systolic;
run;