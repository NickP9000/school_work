*39. using proc sgplot for vertical and horizontal bar charts;
proc import datafile="/home/u63991901/my_shared_file_links/u61987215/IMDBMoviesExercise.csv" dbms=csv out=movie_data replace;
	length Title $139 Genre $9 Description $20 Actors $76 Year 8 Runtime 8 Rating 8;
run;

*vertical bar chart;
proc sgplot data=movie_data;
	vbar genre;
	title "Distribution of Movies by Genre";
run;

*horizontal bar chart;
proc sgplot data=movie_data;
	hbar genre;
	title "Distribution of Movies by Genre";
run;

*40;
proc sgplot data=movie_data;
	vbar genre / group=year;
	title "Distribution of Movies by Genre and Year";
run;

*cluster chart;
proc sgplot data=movies_2014_to_2016;
	vbar genre / group=year groupdisplay=cluster;
	title "Distribution of Movies by Genre and Year";
	xaxis label="The Genres";
	yaxis label="Number of Movies";
run;

*41;
*one way is to make a filtered dataset;
data movies_2014_to_2016;
	set movie_data;
	where genre in ("Action","Comedy","Drama") and year>=2014 and year<=2016;
run;

proc sgplot data=movies_2014_to_2016;
	vbar genre / group=year;
	title "Distribution of Movies and Genre by Year";
	xaxis label="The Genres";
	yaxis label="Number of Movies";
run;

*we can do filtering within proc sgplot by adding the where statement from movies_2014_to_2016;
proc sgplot data=movie_data;
	vbar genre / group=year groupdisplay=cluster;
	title "Distribution of Movies and Genre by Year";
	xaxis label="The Genres";
	yaxis label="Number of Movies";
	where genre in ("Action","Comedy","Drama") and year>=2014 and year<=2016;
run;

*42.;
proc sgplot data=sashelp.cars;
	histogram MPG_City;
	density MPG_City;
	title "Histogram of MPG_City";
run;
