* This demonstrates some sql functions ;
* creating macro variable using into ;
proc sql;
    select monotonic() as Obs, name, age 
    into :name1 - :name19, :age1 - :age19
    from sashelp.class;
quit;



* using monotonic() function ;
* This issues a warning message in the log ; 
* WARNING: Statement terminated early due to OUTOBS=12 option. ;
* select the first 12 observation with outobs option ;
proc sql outobs=12;
	select * from sashelp.class;
quit;

proc sql;
	select monotonic() as Obs, * from sashelp.class;
quit;

* select the first 12 observation with monotonic function ;
* No warning message here !! ;
proc sql;
	select * 
	from sashelp.class
	where monotonic() <=  12;
quit;


* This select range of observation ;
proc sql;
	select * 
	from sashelp.class
	where monotonic() between 9 and 15;
quit;



* generate data set ;
data demo(drop = i);
	do i = 1 to 90;
		Age = int(ranuni(89) * 100);
		Age2 = ceil(ranuni(456) * 100);
		Weight = floor(ranuni(789) * 1000);
		if Age < 16 or Age > 90 then call missing(Age);
		if Age2 < 16 or Age2 > 90 then call missing(Age2);
		if Weight < 80 or Weight > 220 then call missing(Weight);
		output;
	end;
run;


* Using coalesce function ;
proc sql;
	select monotonic() as Obs, *, coalesce(Age, Age2, ceil(avg(Age))) as newAge,
		coalesce(weight, floor(avg(weight))) as newWt
	from demo;
quit;

