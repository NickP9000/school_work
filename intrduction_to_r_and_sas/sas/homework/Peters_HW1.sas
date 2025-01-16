/*Name: Nick Peters*/

*#1;
/*import step*/
proc import datafile="/home/u63991901/Stat40-datasets/auction.csv" dbms=csv out=auction_data;
run;

*#2;
proc contents data=auction_data;
run;

*#4;
proc means data=auction_data max;
	var openbid;
	title Maximum Opening Bid;
run;

*#5;
proc means data=auction_data min;
	var bid;
	title Minimum Winning Bid;
run;

*#6;
proc means data=auction_data stddev;
	var openbid;
	title Standard Deviation of openbid;
run;