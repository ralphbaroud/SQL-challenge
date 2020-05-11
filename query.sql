--Dropping tables in case they already exist
Drop table if exists Departments;
Drop table if exists Department_Employees;
Drop table if exists Department_Manager;
Drop table if exists Employees;
Drop table if exists Salaries;
Drop table if exists Titles;

--Creating required tables
Create table "Departments"
(
	"Department_Number" varchar not null,
	"Department_Name" varchar not null,
constraint "PrimaryKey_Departments" primary key ("Department_Number")
);
---------------------------------------------
Create table "Department_Employees"
(
	"Employee_Number" int not null,
	"Department_Number" varchar not null
);
---------------------------------------------
Create table "Department_Manager"
(
	"Department_Number" varchar not null,
	"Employee_Number" int not null
);
---------------------------------------------
Create table "Employees"
(
	"Employee_Number" int not null,
	"Employee_Title" varchar not null,
	"Birth_Date" date not null,
	"First_Name" varchar not null,
	"Last_Name" varchar not null,
	"Gender" varchar not null,
	"Hire_Date" date not null,
	constraint "PrimaryKey_Employees" primary key ("Employee_Number")
);
---------------------------------------------
Create table "Salaries"
(
	"Employee_Number" int not null,
	"Salary" int not null
);
---------------------------------------------
Create table "Titles"
(
	"Employee_Title" varchar not null,
	"Title" varchar not null
);
---------------------------------------------
--Perform import operations and check that the data has been imported succesfully
Select * FROM "Department_Employees"
Select * FROM "Department_Manager"
Select * FROM "Departments"
Select * FROM "Employees"
Select * FROM "Salaries"
Select * FROM "Titles"
---------------------------------------------
--Setting up relationships between the tables
---------------------------------------------
Alter table "Department_Employees" 
Add constraint "FK0" 
foreign key ("Employee_Number")
references "Employees" ("Employee_Number")
;
---------------------------------------------
Alter table "Department_Employees" 
Add constraint "FK1" 
foreign key ("Department_Number")
references "Departments" ("Department_Number")
;
---------------------------------------------
Alter table "Department_Manager" 
Add constraint "FK3" 
foreign key ("Department_Number")
references "Departments" ("Department_Number")
;
---------------------------------------------
Alter table "Department_Manager" 
Add constraint "FK4" 
foreign key ("Employee_Number")
references "Employees" ("Employee_Number")
;
---------------------------------------------
Alter table "Salaries" 
Add constraint "FK5" 
foreign key ("Employee_Number")
references "Employees" ("Employee_Number")
;
---------------------------------------------
--Sorting based on README file
---------------------------------------------
Select Employee_Number, Last_Name, First_Name, Gender, Salary
from Employees as Employee_Number
join Salaries as "Salary
on Employees.Employee_Number = Salaries.Employee_Number
;
---------------------------------------------
Select "First_Name", "Last_Name", "Hire_Date" From "Employees"
where "Hire_Date" Between '1986-01-01' AND '1987-01-01'
;
---------------------------------------------
Select Departments.Department_Number, Departments.Department_Name,Department_Manager.Employee_Number, Employees.Last_Name,
Employees.First_Name
from Departments
join Department_Manager
on departments.Department_Number = Department_Manager.Department_Number
Join Employees
on Department_Manager.Employee_Number = Employees.Employee_Number
;
---------------------------------------------
Select Department_Employees.Employee_Number, Employees.Last_Name, Employees.First_Name, Departments.Department_Name
From Department_Employees
Join Employees
ON Department_Employees.Employee_Number = Employees.Employee_Number
Join Departments
on Department_Employees.Department_Number = Departments.Department_Number
;
---------------------------------------------
Select First_Name, Last_Name
from "Employees
where First_Name = "Hercules"
and Last_Name LIKE 'B%'
;
---------------------------------------------
select Department_Employees.Employee_Number, Employees.Last_Name, Employees.First_Name, Departments.Department_Name
from Department_Employees
Join Employees
on Department_Employees.Employee_Number = Employees.Employee_Number
join Departments
on Department_Employees.Department_Number = Departments.Department_Number
Where Department.Department_Name = "Sales"
;
---------------------------------------------
select Department_Employees.Employee_Number, Employees.Last_Name, Employees.First_Name, Departments.Department_Name
From Department_Employees
Join Employees
On Department_Employees.Employee_Number = Employees.Employee_Number
Join Departments
ON Department_Employees.Department_Number = Departments.Department_Number
Where Departments.Department_Name = "Sales"
;
---------------------------------------------
Select Last_Name
Count(Last_Name) as "Frequency"
FROM Employees
Group by Last_Name
Order by Count(Last_Name) DESC
;
---------------------------------------------
