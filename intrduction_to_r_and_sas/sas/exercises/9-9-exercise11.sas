proc print data=SASHELP.CITIDAY;
	var DATE;
	format DATE WEEKDATE.;
run;