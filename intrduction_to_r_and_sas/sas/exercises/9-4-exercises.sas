*5.;
/*data step*/
data heart_data;
	set SASHELP.HEART;
	height_cm = height*2.54;
	weight_kg = weight*0.4535;
run;

title "Heart Statistics";

/*proc step*/
proc means data = heart_data n min max median stddev;
	var height_cm weight_kg;
run;

*6.;
proc print data = SASHELP.CITIDAY;
	*format DATE; /*no formatting -- display as an integer, starts from 1960*/
	format DATE mmddyy10.;
	*format DATE date9.;
	var DATE SNYDJCM;
run;

*7.;
