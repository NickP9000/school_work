*Name: Nick Peters;

*#1: import step;
proc import datafile='/home/u63991901/Stat40-datasets/auction.csv' 
	dbms=csv out=auction_data;
run;

*#2: formatting the date variable;
proc print data=auction_data;
	format date date7.;
run;

*#3 & 4: data step;
data auction_data_profit;
	set auction_data;
	drop date bidtime bidderrate auction_type;
	profit = bid - openbid;
run;

*#5: sort step;
proc sort data=auction_data_profit out=sorted_auction_data;
	by descending profit;
run;