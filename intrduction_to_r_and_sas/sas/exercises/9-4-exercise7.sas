/*import data*/
proc import datafile="/home/u63991901/Stat40-datasets/storm_data.csv" dbms=csv out=storm_damage;
run;

/*proc print step*/
proc print data=storm_damage;
	format DATE mmddyy10.;
run;

/*proc contents step
gives metadata on the dataset*/
proc contents data=storm_damage;
run;
 
/*proc means step
statistics on numeric data*/
proc means data=storm_damage;
run;