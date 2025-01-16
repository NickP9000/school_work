*Name: Nick Peters;
*1. import step;
proc import datafile="/home/u63991901/Stat40-datasets/IMDBMoviesRevenueExercise.csv" dbms=csv out=IMDB;
run;

*2. data step;
data Movie_Revenue;
	set IMDB;
	if Revenue < 20 then Category = "Flop";
	else if Revenue < 100 then Category = "Minor Success";
	else if Revenue < 200 then Category = "Blockbuster";
	else Category = "Super Hit";
run;

*3.;
proc freq data = Movie_Revenue;
	tables Category / plot = freqplot;
run;

*a closer look into the data reveals missing values;
proc print data=Movie_Revenue;
run;

*4. Fixing the issues;
data Movie_Revenue2;
	set IMDB;
	length Category $ 15; *fixes the display issue with this column;
	if missing(Revenue) then delete; *deletes rows where Revenue is null;
	if Revenue < 20 then Category = "Flop";
	else if Revenue < 100 then Category = "Minor Success";
	else if Revenue < 200 then Category = "Blockbuster";
	else Category = "Super Hit";
run;

proc freq data = Movie_Revenue2;
	tables Category / plot = freqplot;
run;