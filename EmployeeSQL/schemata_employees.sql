-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/EzvXN6

-- Ensure database is set to read dates as month,date,year
-- https://dba.stackexchange.com/questions/19679/how-to-set-postgresql-database-to-see-date-as-mdy-permanently
-- !!!! Alter database name as required !!!!
ALTER DATABASE employees_1980_1990 SET datestyle TO ISO, MDY;

-- Create tables if they do not exist
CREATE TABLE if not exists Departments (
    dept_no varchar(4)   NOT NULL,
    dept_name varchar(20)   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE if not exists Dept_Emp (
    emp_no int   NOT NULL,
    dept_no varchar(4)   NOT NULL
);

CREATE TABLE if not exists Dept_Manager (
    dept_no varchar(4)   NOT NULL,
    emp_no int   NOT NULL
);

CREATE TABLE if not exists Employees (
    emp_no int   NOT NULL,
    emp_title_id varchar(5)   NOT NULL,
    birth_date date   NOT NULL,
    first_name varchar(30)   NOT NULL,
    last_name varchar(30)   NOT NULL,
    sex varchar(1)   NOT NULL,
    hire_date date   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE if not exists Salaries (
    emp_no int   NOT NULL,
    salary int   NOT NULL
);

CREATE TABLE if not exists Titles (
    title_id varchar(5)   NOT NULL,
    title varchar(20)   NOT NULL,
    CONSTRAINT pk_Titles PRIMARY KEY (
        title_id
     )
);

-- Add foreign key constraints
ALTER TABLE Dept_Emp ADD CONSTRAINT fk_Dept_Emp_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Dept_Emp ADD CONSTRAINT fk_Dept_Emp_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Employees ADD CONSTRAINT fk_Employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES Titles (title_id);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);