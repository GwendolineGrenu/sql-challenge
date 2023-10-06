-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "departments" (
    "Dept_no" varchar   NOT NULL,
    "Dept_name" string   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "Dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "Emp_no" int   NOT NULL,
    "Dept_no" varchar   NOT NULL
);

CREATE TABLE "dept_manager" (
    "Dept_no" varchar   NOT NULL,
    "Emp_no" int   NOT NULL
);

CREATE TABLE "employees" (
    "Emp_no" int   NOT NULL,
    "Emp_title_id" varchar   NOT NULL,
    "Birth_date" date   NOT NULL,
    "First_name" string   NOT NULL,
    "Last_name" string   NOT NULL,
    "Sex" string   NOT NULL,
    "Hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "Emp_no"
     )
);

CREATE TABLE "salaries" (
    "Emp_no" int   NOT NULL,
    "Salary" int   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "Emp_no"
     )
);

CREATE TABLE "titles" (
    "Title_id" varchar   NOT NULL,
    "Title" string   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "Title_id"
     )
);

ALTER TABLE "departments" ADD CONSTRAINT "fk_departments_Dept_no" FOREIGN KEY("Dept_no")
REFERENCES "dept_manager" ("Dept_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_Emp_no" FOREIGN KEY("Emp_no")
REFERENCES "employees" ("Emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_Dept_no" FOREIGN KEY("Dept_no")
REFERENCES "departments" ("Dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_Dept_no" FOREIGN KEY("Dept_no")
REFERENCES "dept_emp" ("Dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_Emp_no" FOREIGN KEY("Emp_no")
REFERENCES "employees" ("Emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_Emp_no" FOREIGN KEY("Emp_no")
REFERENCES "salaries" ("Emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_Title_id" FOREIGN KEY("Title_id")
REFERENCES "employees" ("Emp_title_id");

