
-- ==========================================================
-- SQL SERVER PRACTICE
-- TOPIC: NULL FUNCTIONS
-- Functions: ISNULL, COALESCE, NULLIF
-- ==========================================================


-- TABLE CREATION

CREATE TABLE EmployeeDetails (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    manager_id INT
);

INSERT INTO EmployeeDetails
    (employee_id, employee_name, department, salary, bonus, manager_id)
VALUES
(1, 'Raj', 'IT', 50000, 5000, 101),
(2, 'Pavan', 'HR', 40000, NULL, 102),
(3, 'Kiran', 'IT', NULL, 3000, 101),
(4, 'Priya', NULL, 60000, NULL, NULL),
(5, 'Anil', 'Finance', 45000, 2000, 103),
(6, 'Ravi', 'HR', NULL, NULL, NULL),
(7, 'Divya', 'Finance', 55000, 4000, 103),
(8, 'Suresh', NULL, 35000, NULL, 102);


-- EXERCISE 1:
-- Replace NULL bonus values with 0 using ISNULL.
-- Return employee_id, employee_name, bonus, and updated_bonus.

-- SOLUTION:

SELECT
    employee_id,
    employee_name,
    bonus,
    ISNULL(bonus, 0) AS updated_bonus
FROM EmployeeDetails;


-- EXERCISE 2:
-- Replace NULL department values with 'Not Assigned'
-- using ISNULL.

-- SOLUTION:

SELECT
    employee_id,
    employee_name,
    ISNULL(department, 'Not Assigned') AS department
FROM EmployeeDetails;


-- EXERCISE 3:
-- Replace NULL salary values with 0 using COALESCE.

-- SOLUTION:

SELECT
    employee_id,
    employee_name,
    salary,
    COALESCE(salary, 0) AS updated_salary
FROM EmployeeDetails;


-- EXERCISE 4:
-- Display the first available value from salary, bonus, and 0.
-- Use COALESCE to return the first non-NULL value.

-- SOLUTION:

SELECT
    employee_id,
    employee_name,
    salary,
    bonus,
    COALESCE(salary, bonus, 0) AS available_amount
FROM EmployeeDetails;


-- EXERCISE 5:
-- Replace NULL manager_id values with -1 using ISNULL.

-- SOLUTION:

SELECT
    employee_id,
    employee_name,
    manager_id,
    ISNULL(manager_id, -1) AS updated_manager_id
FROM EmployeeDetails;


-- EXERCISE 6:
-- Find employees whose salary is NULL.

-- SOLUTION:

SELECT
    employee_id,
    employee_name,
    salary
FROM EmployeeDetails
WHERE salary IS NULL;


-- EXERCISE 7:
-- Find employees whose salary is NOT NULL.

-- SOLUTION:

SELECT
    employee_id,
    employee_name,
    salary
FROM EmployeeDetails
WHERE salary IS NOT NULL;


-- EXERCISE 8:
-- Count the total number of employees,
-- the number of employees with a salary,
-- and the number of employees without a salary.

-- SOLUTION:

SELECT
    COUNT(*) AS total_employees,
    COUNT(salary) AS employees_with_salary,
    COUNT(*) - COUNT(salary) AS employees_without_salary
FROM EmployeeDetails;


-- EXERCISE 9:
-- Calculate total compensation as salary + bonus.
-- Replace NULL salary and bonus values with 0.

-- SOLUTION:

SELECT
    employee_id,
    employee_name,
    ISNULL(salary, 0) AS salary,
    ISNULL(bonus, 0) AS bonus,
    ISNULL(salary, 0) + ISNULL(bonus, 0) AS total_compensation
FROM EmployeeDetails;


-- EXERCISE 10:
-- Display the department if available.
-- Otherwise, display 'Unknown Department'.
-- Use COALESCE.

-- SOLUTION:

SELECT
    employee_id,
    employee_name,
    COALESCE(department, 'Unknown Department') AS department
FROM EmployeeDetails;


-- EXERCISE 11:
-- Use NULLIF to return NULL when salary is 0.
-- Otherwise, return the original salary.

-- SOLUTION:

SELECT
    employee_id,
    employee_name,
    salary,
    NULLIF(salary, 0) AS salary_without_zero
FROM EmployeeDetails;


-- EXERCISE 12:
-- Calculate bonus percentage of salary.
-- Return NULL if salary is 0 to avoid division by zero.

-- SOLUTION:

SELECT
    employee_id,
    employee_name,
    salary,
    bonus,
    (bonus / NULLIF(salary, 0)) * 100 AS bonus_percentage
FROM EmployeeDetails;


-- EXERCISE 13:
-- Display department using COALESCE.
-- If department is NULL, use manager_id as text.
-- If both are NULL, return 'Not Available'.

-- SOLUTION:

SELECT
    employee_id,
    employee_name,
    COALESCE(
        department,
        CAST(manager_id AS VARCHAR(10)),
        'Not Available'
    ) AS department_or_manager
FROM EmployeeDetails;


-- EXERCISE 14:
-- Count the number of employees in each department.
-- Include employees whose department is NULL under 'Not Assigned'.

-- SOLUTION:

SELECT
    ISNULL(department, 'Not Assigned') AS department,
    COUNT(*) AS employee_count
FROM EmployeeDetails
GROUP BY ISNULL(department, 'Not Assigned');


-- EXERCISE 15:
-- Display salary, bonus, and total compensation.
-- Use COALESCE to handle NULL values.

-- SOLUTION:

SELECT
    employee_id,
    employee_name,
    salary,
    bonus,
    COALESCE(salary, 0) + COALESCE(bonus, 0) AS total_compensation
FROM EmployeeDetails;
