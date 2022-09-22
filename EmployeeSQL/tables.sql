--create tables from data csv's

--drop tablesk if it was already made
drop table departments cascade
drop table dept_emp cascade
drop table dept_manager cascade
drop table employees cascade
drop table salaries cascade
drop table titles cascade


create table departments(

	dept_no varchar primary key not null,
	dept_name varchar not null

);

--

create table dept_emp(

	emp_no int not null,
	dept_no varchar not null references departments(dept_no),
	primary key(emp_no, dept_no)

);


--

create table dept_manager(

	dept_no varchar not null references departments(dept_no),
	emp_no int not null,
	primary key(dept_no, emp_no)

);

--

create table employees(

	emp_no int not null,
	emp_title_id varchar not null,
	birth_date date not null,
	first_name varchar not null,
	last_name varchar not null,
	sex varchar not null,
	hire_date date not null,
	constraint pk_employees primary key (emp_no)

);

--need to make foreign keys for dept_emp & managers to connect those tables with the emp_no
--and reference the employees table
--need to create unique constraints to match the keys as foreign keys

alter table dept_manager add constraint fk_dept_man_dept_no 
foreign key(dept_no) references departments(dept_no);
alter table dept_manager add constraint fk_dept_man_emp_no
foreign key(emp_no) references employees(emp_no);
alter table dept_emp add constraint fk_dept_emp_no
foreign key(emp_no) references employees(emp_no);
alter table dept_emp add constraint fk_dept_emp_dept_no
foreign key(dept_no) references departments(dept_no);

--

create table salaries(

	emp_no int not null,
	salary int not null
	
);

create table titles(

	title_id varchar not null,
	title varchar not null,
	constraint pk_titles primary key(title_id)

);

--add constraints/foreign keys again to connect salaries and titles to employee table
alter table employees add constraint fk_employees_title_id
foreign key(emp_title_id) references titles(title_id);
alter table salaries add constraint fk_salaries_emp_no
foreign key(emp_no) references employees(emp_no);

--import all data for each table
--schemas > tables > {table name} > import through path

--note to self, do not add constraints before importing lol

