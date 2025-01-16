*24 creating a dataset;
data my_pets;
	input Name $ Species $ Weight Rating;
	datalines;
		Callie Cat 12.3 6
		Greta Cat 11.1 7
		Oscar Cat 13.5 3
		Rainbo Fish 0.34 9
		;
run;

*25 delimiter, now we can use , to separate columns in the dataline section;
data more_pets;
	input Name $ Species $ Weight Rating;
	infile datalines dlm = ',';
	datalines;
		Lucy,Cat,12.3,4
		Miles,Cat,15.1,9
		Motor,Cat,13.5,9.5
		Goldie,Fish,0.34,2
		;
run;

*26 by adding dsd, we can add missing data by adding an extra , to resent that which is missing;
data even_more_pets;
	input Name $ Species $ Weight Rating;
	infile datalines dsd dlm = ',';
	datalines;
		Fido,Dog,22.3,4
		Barky,Dog,,9
		Ralph,Dog,84.5,
		Sam,Fish,0.34,6
		;
run;

*27 length is not correct, names get cut off since we do not adjust this;
data chess_players;
	*length ID 8 Name $ 15 Rating 8; *the fix;
	input ID Name $ Rating;
	infile datalines dsd dlm=',';
	datalines;
		1,Bobby Fischer,2881
		2,Garry Kasparov,2870
		3,Watson,2879
		;
run;

*28 combining data sets (a.k.a. adding more rows);
data combined_pets;
	set my_pets more_pets even_more_pets;
run;

/* SAS exercises  29 */
/* SAS does NOT require the datasets to have the same format to combine */

data chess_players;
	length ID 8 Name $ 15 Rating 8;
	input ID Name $ Rating;
	infile datalines dsd dlm = ',';
	datalines;
	1,Bobby Fischer,2881
	2,Garry Kasparov,2870
	3,Watson,2879
	;
run;

data basketball_players;
	length ID 8 Name $ 15 Height 8;
	input ID Name $ Height;
	infile datalines dsd dlm = ',';
	datalines;
	6,Yao Ming,2.29
	7,Michael Jordan,1.99
	8,Larry Bird,2.06
	;
run;

/* SAS exercise 30 */
/* Merging Data */

data olympians;
	length ID 8 Name $ 15;
	input ID Name $;
	infile datalines dsd dlm = ',';
	datalines;
	1,Michael Phelps
	2,Jesse Owens
	4,Usain Bolt
	3,Carl Lewis
	;
run;

data gold_medals;
	input ID Medals;
	infile datalines dsd dlm = ',';
	datalines;
	1,23
	2,4
	3,9
	4,8
	;
run;

proc sort data=olympians;
	by ID;
run;

proc sort data=goldmedals;
	by ID;
run;

data olympian_gold_medals;
	merge olympians gold_medals;
	by ID;
run;