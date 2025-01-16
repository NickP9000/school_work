*43;
proc import datafile="/home/u63991901/my_shared_file_links/u61987215/IMDBMoviesExercise.csv" dbms=csv out=movie_data replace;
	length Title $139 Genre $9 Description $253 Actors $76 Year 8 Runtime 8 Rating 8;
run;

proc sgplot data=movie_data;
	histogram Rating;
	where Genre = "Action";
	title "Distribution of Action Movie Ratings";
run;

proc sgplot data=movie_data;
	histogram Rating / showbins;
	where Genre = "Action";
	title "Distribution of Action Movie Ratings";
run;

proc sgplot data=movie_data;
	histogram Rating / nbins=100 showbins;
	where Genre = "Action";
	title "Distribution of Action Movie Ratings";
run;

*proc sgpanel;
title "Distribution of MPG by Make";
data my_cars;
	set sashelp.cars;
	where make in ('Honda','Toyota','Ford','Lexus');
run;
	
proc sgpanel data = my_cars;
	panelby make;
	histogram MSRP;
	density MSRP;
run;

*boxplot;
proc sgplot data=sashelp.iris;
	vbox petalLength / category = species;
run;

proc sgplot data=sashelp.iris;
	hbox petalLength / category = species;
run;

*series plot;
proc sgplot data = sashelp.airline;
	series x = Date y = Air;
run;

*44;
proc sgplot data=sashelp.cars;
	scatter x=MPG_City y=MPG_Highway;
	title "MPG_City vs MPG_Highway";
run;

proc sgplot data=sashelp.cars;
	scatter x=MPG_City y=MPG_Highway;
	reg x=MPG_City y=MPG_Highway;
	title "MPG_City vs MPG_Highway";
run;

proc sgplot data=sashelp.cars;
	scatter x=MSRP y=MPG_Highway;
	title "MSRP vs MPG_Highway";
run;

proc sgplot data=sashelp.cars;
	scatter x=MSRP y=MPG_Highway;
	reg x=MSRP y=MPG_Highway;
	title "MSRP vs MPG_Highway";
run;