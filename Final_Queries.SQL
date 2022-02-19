-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/LA18Te
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "departments" (
    "dept_no" varchar   NOT NULL,
    "department_name" varchar   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);


);
Drop Table dept_emp
CREATE TABLE "dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar   NOT NULL);


Drop table dept_manager;
CREATE TABLE "dept_manager" (
    "dept_no" varchar   NOT NULL,
    "emp_no" int   NOT NULL
);

CREATE TABLE "employee" (
    "emp_no" int   NOT NULL,
    "emp_title_id" varchar   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "sex" varchar   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employee" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "titles" (
    "title_id" varchar   NOT NULL,
    "title" varchar   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);
# not working 
ALTER TABLE "departments" ADD CONSTRAINT "fk_departments_dept_no" FOREIGN KEY("dept_no")
REFERENCES "dept_emp" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employee" ("emp_no");

#not working 
ALTER TABLE "employee" ADD CONSTRAINT "fk_employee_emp_no" FOREIGN KEY("emp_no")
REFERENCES "dept_emp" ("emp_no"); 

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employee" ("emp_no");
# not working 
ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_title_id" FOREIGN KEY("title_id")
REFERENCES "employee" ("emp_title_id");



Select * from dept_manager;
-- Question 1
SELECT employee.emp_no,employee.first_name, employee.last_name, employee.sex, salaries.salary from salaries
INNER JOIN employee ON
employee.emp_no=salaries.emp_no;
--Question 2
Select first_name, last_name, hire_date from employee where hire_date between '1986-1-1' AND '1986-12-31';
--Question 3
Select d.department_name ,dm.dept_no, dm.emp_no, e.First_name, e.last_name, dm.dept_no 
From dept_manager as dm
INNER JOIN employee as e
ON dm.emp_no = e.emp_no
INNER JOIN departments as d
ON d.dept_no=dm.dept_no;


--Question 4 

Select e.emp_no, e.first_name, e.last_name, d.department_name from employee as e
INNER JOIN dept_emp as de
ON e.emp_no=de.emp_no
INNER JOIN departments as d
ON de.dept_no = d.dept_no;

--Question 5 

Select first_name, last_name, sex from employee where first_name= 'Hercules' and last_name like 'B%';

-- Question 6
Select e.first_name,e.last_name, e.emp_no, d.department_name from employee as e 

INNER JOIN dept_emp as de
ON e.emp_no=de.emp_no

INNER JOIN  departments as d 
ON de.dept_no = d.dept_no
where d.department_name='Sales'
Order by e.emp_no;


--Question 7

Select e.first_name, e.last_name, e.emp_no, d.department_name from employee as e 

INNER JOIN dept_emp as de
ON e.emp_no=de.emp_no

INNER JOIN  departments as d 
ON de.dept_no = d.dept_no
where d.department_name IN ('Sales','Development')

Order by e.emp_no;


--Question 8


Select last_name, COUNT(last_name) from employee Group by last_name ORDER BY last_name DESC;



