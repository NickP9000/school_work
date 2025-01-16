*Name: Nick Peters;

*#1: import step;
proc import datafile='/home/u63991901/Stat40-datasets/storm_data.csv' dbms=csv out=storm_damage;
run;

*#2: formatting;

*dropping summary;
data storm_damage;
	set storm_damage;
	drop Summary;
run;

*proc print to format the rest;
proc print data=storm_damage;
	format Date MMDDYY8. Cost DOLLAR20. Deaths COMMA10.
run;