/*My First SAS Program*/

/*PROC PRINT outputs all rows and columns in the table*/
proc print data=SASHELP.CARS;
run;

/*PROC MEANS outputs statistics on numeric variable*/
proc means data=SASHELP.CARS;
	var MSRP Weight MPG_CITY MPG_HIGHWAY;
run;

/*PROC FREQ outputs statistics on frequencies of values*/
proc freq data=SASHELP.CARS;
	tables Type / PLOT=FREQPLOT;
run;