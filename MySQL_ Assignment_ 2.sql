USE employee;
SELECT DISTINCT salary FROM employees;
SELECT
age AS Employee_Age,
salary AS Employee_Salary
FROM employees;
-- 3. Employees earning more than 50000
-- and hired before 2016-01-01
SELECT *
FROM employees
WHERE salary > 50000
AND hire_date < '2016-01-01';
  -- 4. Find employees with a missing designation
SELECT *
FROM employees
WHERE designation IS NULL;
UPDATE employees
SET designation = 'Data Scientist'
WHERE employee_id = 5004;
SELECT employee_id, employee_name, designation
FROM employees
WHERE employee_id = 5004;
SELECT*
FROM employees
ORDER BY department_id ASC, salary DESC;
-- 8. First 5 employees hired in 2018
SELECT *
FROM employees
WHERE hire_date >= '2018-01-01'
AND hire_date < '2019-01-01'
ORDER BY hire_date ASC
LIMIT 5;
-- 9. Total salary in Finance department
SELECT SUM(e.salary) AS Total_Finance_Salary
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_name = 'Finance';
SELECT MIN(age) AS Minimum_Employee_Age 
FROM employees;
-- 11. Maximum salary at each location
SELECT l.location,
MAX(e.salary) AS Maximum_Salary
FROM employees e
JOIN location l
ON e.location_id = l.location_id
GROUP BY l.location;
-- 12. Average salary for Analyst designations
SELECT designation,
AVG(salary) AS Average_Salary
FROM employees
WHERE designation LIKE '%Analyst%'
GROUP BY designation;
SELECT d.department_name,
COUNT(e.employee_id) AS Total_Employees
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(e.employee_id) < 3;
SELECT l.location,
AVG(e.age) AS Average_Female_Age
FROM location l
JOIN employees e
ON l.location_id = e.location_id
WHERE e.gender = 'F'
GROUP BY l.location_id, l.location
HAVING AVG(e.age) < 30;
SELECT e.employee_name,
e.designation,
d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;
SELECT d.department_name,
COUNT(e.employee_id) AS Total_Employees
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;
 