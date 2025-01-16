*Name: Nick Peters;
proc print data=sashelp.cars;
run;
*1. data step;
data my_cars;
	set sashelp.cars;
	where Make in ("Honda","Toyota","Ford","Lexus") and Cylinders LT 10;
run;

*2. vertical bar chart;
proc sgplot data=my_cars;
	vbar Make / group=Cylinders;
	title "Distribution of Cars by Make and Cylinders";
	xaxis label="Make";
	yaxis label="Number of Cars Manufactured";
run;

*3. clustered bar chart;
proc sgplot data=my_cars;
	vbar Make / group=Cylinders groupdisplay=cluster;
	title "Distribution of Cars by Make and Cylinders";
	xaxis label="Make";
	yaxis label="Number of Cars Manufactured";
run;

*4. histogram;
proc sgplot data=my_cars;
	histogram MPG_Highway;
	density MPG_Highway;
	title "Histogram of Cars by Make and MPG on Highways";
run;
