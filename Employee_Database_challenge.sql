SELECT  employees.emp_no, 
		employees.first_name, 
		employees.last_name,
		titles.title,
		titles.from_date,
		titles.to_date
INTO retirement_titles
FROM employees
INNER JOIN titles
ON employees.emp_no = titles.emp_no;


SELECT * FROM unique_titles;
DROP TABLE retirement_titles CASCADE;

CREATE TABLE employees (
		emp_no VARCHAR NOT NULL,
		birth_date DATE NOT NULL,
		first_name VARCHAR NOT NULL,
		last_name VARCHAR NOT NULL,
		gender VARCHAR NOT NULL,
		hire_date DATE NOT NULL,
		PRIMARY KEY (emp_no)
);

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

SELECT COUNT(uniqueemp_no), unique_titles.title
INTO retiring_titles
FROM unique_titles
GROUP BY title;

SELECT * FROM retiring_titles;
DROP TABLE unique_titles CASCADE;