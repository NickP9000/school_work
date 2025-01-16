/*
1. ods graphics on;
2. proc feq as usual but add plots = freqplot;
3. ods graphics off;
*/

ods graphics on;
proc freq data=SASHELP.CARS;
	tables Type / plots=freqplot;
run;
ods graphics off;