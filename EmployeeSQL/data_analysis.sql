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

--4 List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
--same as manager but employees first > dept_emp > departments to use dept_no to get dept_name
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
inner join dept_emp
on e.emp_no = dept_emp.emp_no
inner join departments as d
on dept_emp.dept_no = d.dept_no;


--5 List first name, last name, and sex for employees whose 
--first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%';

--6 List all employees in the Sales department, including their 
--employee number, last name, first name, and department name.
--copy and paste from 4 just add where statement
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
inner join dept_emp
on e.emp_no = dept_emp.emp_no
inner join departments as d
on dept_emp.dept_no = d.dept_no
where d.dept_name = 'Sales';

--7  List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
--same thing just add OR statement since employees arent both sales AND development
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
inner join dept_emp
on e.emp_no = dept_emp.emp_no
inner join departments as d
on dept_emp.dept_no = d.dept_no
where d.dept_name = 'Sales' or d.dept_name = 'Development';

--8 List the frequency count of employee last names 
--(i.e., how many employees share each last name) in descending order.
--Count the employees last name then group by the last name to show chart as last_name = last_name and count is # of people with the last name
select last_name, count(last_name)
from employees
group by last_name
order by count(last_name) desc;