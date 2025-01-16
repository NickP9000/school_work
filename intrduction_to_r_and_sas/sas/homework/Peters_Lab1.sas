/*Name: Nick Peters*/


/*data step*/
data fish;
	set SASHELP.FISH;
run;
	
*#1;
proc print data=fish;
run;

*#2;
proc means data=fish;
run;

*#3;
proc means data=fish;
	var Height Weight Width;
run;

*#4;
/*Without any VAR line, it will do
statistics on all numeric variables.
This is seen by the output of #2*/

*#5;
proc means data=fish stddev;
	var Length1;
run;

*#6;
proc means data=fish range;
	var Width;
run;