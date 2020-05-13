---------------------------------------------
--Dropping tables in case they already exist
---------------------------------------------
drop table if exists departments;
drop table if exists dept_emp;
drop table if exists dept_manager;
drop table if exists employees;
drop table if exists salaries;
drop table if exists titles;
---------------------------------------------
--Creating required tables
---------------------------------------------
create table "departments" 
(
	"dept_no" varchar not null,
	"dept_name" varchar not null,
	constraint "PK_departments" primary key ("dept_no")
);
---------------------------------------------
create table "dept_emp"
(
	"emp_no" int not null,
	"dept_no" varchar not null,
	constraint "PK_dept_emp" primary key ("emp_no","dept_no")
);
---------------------------------------------
create table "dept_manager"
(
	"dept_no" varchar not null,
	"emp_no" int not null,
	constraint "PK_dept_manager" primary key ("dept_no","emp_no")
);
---------------------------------------------
create table "employees"
(
	"emp_no" int not null,
	"emp_title" varchar not null,
	"birth_date" date not null,
	"first_name" varchar not null,
	"last_name" varchar not null,
	"sex" varchar not null,
	"hire_date" date not null,
	constraint "PK_employees" primary key ("emp_no")
);
---------------------------------------------
create table "salaries"
(
	"emp_no" int not null,
	"salary" int not null,
	constraint "PK_salaries" primary key ("emp_no")
);
---------------------------------------------
create table "titles"
(
	"title_id" varchar not null,
	"title" varchar not null,
	constraint "PK_titles" primary key ("title_id")
);
---------------------------------------------
--Altering Tables
---------------------------------------------
alter table "dept_emp"
add constraint "FK_dept_emp_emp_no" foreign key ("emp_no")
references "employees" ("emp_no")
;
---------------------------------------------
alter table "dept_emp"
add constraint "FK_dept_emp_dept_no" foreign key ("dept_no")
references "departments" ("dept_no")
;
---------------------------------------------
alter table "dept_manager"
add constraint "FK_dept_emp_dept_no" foreign key ("dept_no")
references "departments" ("dept_no")
;
---------------------------------------------
alter table "dept_manager"
add constraint "FK_dept_manager_dept_no" foreign key ("emp_no")
references "employees" ("emp_no")
;
---------------------------------------------
alter table "employees"
add constraint "FK_employees_emp_title" foreign key ("emp_title")
references "titles" ("title_id")
;
---------------------------------------------
alter table "salaries"
add constraint "FK_salaries_emp_no" foreign key ("emp_no")
references "employees" ("emp_no")
;
---------------------------------------------
---Selecting all tables after performing import operations
---------------------------------------------
select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from titles
---------------------------------------------
--Sorting the data based on requirements
---------------------------------------------
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
join salaries
on employees.emp_no = salaries.emp_no
;
---------------------------------------------
select first_name, last_name, hire_date
from employees
where hire_date
between "1986-01-01" and "1987-01-01"
;
---------------------------------------------
select departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
from employees
join dept_manager
on employees.emp_no = dept_manager.emp_no
join departments
on departments.dept_no = dept_manager.dept_no
;
-----------------------------------
select employees.dept_name, employees.last_name, employees.first_name, departments.dept_name
from employees
join dept_emp
on employees.emp_no = dept_emp.emp_no
join departments
on departments.dept_no = dept_emp.dept_no
;
-----------------------------------
select first_name, last_name
from employees
where first_name = "Hercules" and last_name like 'B%';
-----------------------------------
select departments.dept_name, employees.first_name, employees.last_name, dept_emp.emp_no
from dept_emp	
join employees
on dept_emp.emp_no = employees.emp_no
join departments
on dept_emp.dept_no = departments.dept_no
where departments.dept_name = "Sales"
;
-----------------------------------
select departments.dept_name, employees.first_name, employees.last_name, dept_emp.emp_no
from dept_emp
join employees
on dept_emp.emp_no = employees.emp_no
join departments
on dept_emp.dept_no = departments.dept_no
where departments.dept_name = "Sales" or departments.dept_name = "Development"
;
-----------------------------------
select last_name,
count (last_name) from employees
group by last_name
order by count(last_name) desc
;