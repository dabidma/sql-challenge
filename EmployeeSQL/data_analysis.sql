--Data Analysis--
--1 List the following details of each employee: employee number, last name, first name, sex, and salary.
select emp_no, last_name, first_name, sex
from employees;
--get everything from salaries table
select * from salaries;
--join the two with an inner join
select emp.emp_no, emp.last_name, emp.first_name, emp.sex, salaries.salary
from employees as emp
inner join salaries on
emp.emp_no = salaries.emp_no;

--2 List first name, last name, and hire date for employees who were hired in 1986.
select hire_date from employees;

select first_name, last_name, hire_date
from employees
where hire_date >= '1986-01-01' and hire_date <= '1986-12-31';

--3 List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
--join first manager on emp_no > 2nd employee > 3rd departments on dept_no for dept_name
select dept_no, emp_no from dept_manager;
select dept_name from departments;
select last_name, first_name from employees;

select m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
from dept_manager as m
inner join employees as e
on m.emp_no = e.emp_no
join departments as d
on m.dept_no = d.dept_no;

--4 
