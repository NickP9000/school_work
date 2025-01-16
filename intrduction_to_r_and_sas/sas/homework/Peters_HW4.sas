*Name: Nick Peters;

/*Using the SASHELP.CARS data set, create a clustered bar graph of type ‘Sedan’ and ‘Truck’ grouped by cylinders. 
Add title as “Distribution of Cars by Type and Number of Cylinders”, x-axis label as “Cylinders”, and y-axis label as Number of Cars. 
Additionally, Create a histogram for the weight variable with a normal density curve.*/

*give a bit more familiarity to the dataset;
proc print data=sashelp.cars;
run;

*scatter plot;
proc sgplot data=sashelp.cars;
	title "Distrbution of Cars by Type and Number of Cylinders";
	xaxis label="Cylinders";
	yaxis label="Number of Cars";
	where Type in ('Sedan','Truck');
	vbar Type / group=Cylinders groupdisplay=cluster;
run;

*histogram;	
proc sgplot data=sashelp.cars;
	title "Distribution of Sedan and Truck Weights";
	histogram Weight;
	density Weight;
	where Type in ('Sedan','Truck');
run;

	