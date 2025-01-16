/*proc import step*/
proc import datafile="/home/u63991901/Stat40-datasets/np_traffic.csv" dbms=csv out=traffic;
run;

proc print data=traffic;
run;

proc contents data=traffic;
run;