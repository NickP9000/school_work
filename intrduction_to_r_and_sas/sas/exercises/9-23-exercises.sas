/*DO LOOP*/
data compound;
	Rate = 0.0375;
	Total = 100;
	do Year = 1 to 3;
		Interest = Total * Rate;
		Total = Total + Interest;
		output;
	end;
run;

proc print data=compound;
run;

/*DO WHILE
executes the check at the beginning (before the first loop can actually run)*/
data compound;
	Rate = 0.0375;
	Total = 100;
	do while (Total <=200) ;
		Interest = Total * Rate;
		Total = Total + Interest;
		output;
	end;
run;

/*DO exercise*/
data squares;
	Numbers = 1;
	do while (Numbers <= 10);
		Square = Numbers * Numbers;
		output;
		Numbers = Numbers + 1;
	end;
run;
	
*37.;
proc import datafile="/home/u63991901/my_shared_file_links/u61987215/IMDBMoviesExercise.csv" dbms=csv out=movie_data replace;
	length Title $139 Genre $9 Description $20 Actors $76 Year 8 Runtime 8 Rating 8;
run;

proc means data=movie_data;
	var Runtime Rating;
run;

proc means data=movie_data;
	var Runtime Rating;
	class Year;
run;

proc means data=movie_data;
	var Runtime;
	class Year;
run;

proc means data=movie_data;
	var Runtime;
	class Year Genre;
run;

proc means data=movie_data mean;
	var Runtime;
	class Year Genre;
run;

/*WAYS*/
proc means data=movie_data mean;
	var Runtime;
	class Year Genre;
	ways 0;
run;

proc means data=movie_data mean;
	var Runtime;
	class Year Genre;
	ways 1;
run;

proc means data=movie_data mean;
	var Runtime;
	class Year Genre;
	ways 2;
run;

proc means data=movie_data mean;
	var Runtime;
	class Year Genre;
	ways 0 1 2;
run;

*38.;
