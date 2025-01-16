proc print data = SASHELP.CITIDAY;
	*format DATE; /*no formatting -- display as an integer, starts from 1960*/
	format DATE mmddyy10.;
	*format DATE date9.;
	var DATE SNYDJCM;
run;