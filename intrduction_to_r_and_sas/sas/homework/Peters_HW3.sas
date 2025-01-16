*Name: Nick Peters;

*1. import step;
proc import datafile="/home/u63991901/Stat40-datasets/employees.csv" dbms=csv out=employees;
run;

proc import datafile="/home/u63991901/Stat40-datasets/orders.csv" dbms=csv out=orders;
run;

*2. merge step;
*sort first;
proc sort data=employees;
	by EmployeeID;
	
proc sort data=orders;
	by EmployeeID;
	
*then merge;
data employee_order_merge;
	merge employees orders;
	by EmployeeID;
run;

*3. 1997 dataset;
data employee_order97;
	set employee_order_merge;
	where YEAR(OrderDate) = 1997 and ShippedDate > RequiredDate;
	keep EmployeeID LastName FirstName Title CustomerID ShipCountry Freight;
run;

*4. 1998 dataset;
data employee_order98;
	set employee_order_merge;
	where YEAR(OrderDate) = 1998 and ShippedDate > RequiredDate;
	keep EmployeeID LastName FirstName Title CustomerID ShipCountry Freight;
run;

*5. combining the 1997 and 1998 late datasets;	
data late_order_97_98;
	set employee_order97 employee_order98;
	by EmployeeID;
run;

*6. proc means step;
proc means data=late_order_97_98 sum;
	var Freight;
	class LastName;
run;

proc means data=late_order_97_98 sum;
	var Freight;
	class Title;
run;