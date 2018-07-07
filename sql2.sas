libname home "C:\Users\Jose\Documents\SasClinical\sql2";


* Create table with variable names and attributes;
proc sql;
    create table sqlTable1 (name char(10), age num, gender char);
quit;


* fill table with with values;
proc sql;
    insert into sqlTable1
        values('Mary', 56, 'F')
        values('John', 67, 'M')
        values('Anna', 43, 'F')
        ;
quit;


* Using set statement to insert values;
* Here, the order don't matter;
proc sql;
    insert into sqlTable1
        set name='Kelly', age=51, gender='M'
        set gender='F', name='Jane', age=39
        ;
quit;


* Print using select statement;
proc sql;
    select * from sqlTable1;
quit;

proc sql;
    select name, gender from sqlTable1;
quit;


* sorting the data;
proc sql;
    create table sqlTable2 as 
        select * from sqlTable1
        order by gender desc, age ;
quit;


* sort by position of variable;
proc sql;
    create table sqlTable3 as   
        select * from sashelp.class
        order by 2, age desc;
quit;