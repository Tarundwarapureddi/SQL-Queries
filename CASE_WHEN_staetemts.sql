
-- CASE WHEN EXERCISES

-- TABLE CREATION

CREATE TABLE EmployeeStatus (
    employee_id INT,
    employee_name VARCHAR(50),
    status VARCHAR(20)
);

INSERT INTO EmployeeStatus
    (employee_id, employee_name, status)
VALUES
(1, 'Raj', 'Active'),
(2, 'Pavan', 'Inactive'),
(3, 'Kiran', 'Active'),
(4, 'Priya', 'Inactive'),
(5, 'Anil', 'Pending'),
(6, 'Ravi', 'Active'),
(7, 'Suresh', 'On Leave'),
(8, 'Divya', NULL);


-- EXERCISE 1:
-- Convert Active to 1 and Inactive to 0.
-- For other values, return NULL.
-- Return employee_id, employee_name, status, and new_entry.

-- SOLUTION:

SELECT
    employee_id,
    employee_name,
    status,
    CASE
        WHEN status = 'Active' THEN 1
        WHEN status = 'Inactive' THEN 0
        ELSE NULL
    END AS new_entry
FROM EmployeeStatus;


-- EXERCISE 2:
-- Display Active employees as 'Currently Working'
-- and Inactive employees as 'Not Working'.
-- For other values, return 'Unknown'.

-- SOLUTION:

SELECT
    employee_id,
    employee_name,
    status,
    CASE
        WHEN status = 'Active' THEN 'Currently Working'
        WHEN status = 'Inactive' THEN 'Not Working'
        ELSE 'Unknown'
    END AS employment_status
FROM EmployeeStatus;


-- EXERCISE 3:
-- Create a new column that displays 1 for Active employees
-- and 0 for all other statuses.

-- SOLUTION:

SELECT
    employee_id,
    employee_name,
    status,
    CASE
        WHEN status = 'Active' THEN 1
        ELSE 0
    END AS active_flag
FROM EmployeeStatus;


-- EXERCISE 4:
-- Display 'Active', 'Inactive', or 'Other'
-- based on the employee's status.

-- SOLUTION:

SELECT
    employee_id,
    employee_name,
    status,
    CASE
        WHEN status = 'Active' THEN 'Active'
        WHEN status = 'Inactive' THEN 'Inactive'
        ELSE 'Other'
    END AS status_category
FROM EmployeeStatus;


-- EXERCISE 5:
-- Display 1 for Active, 0 for Inactive,
-- 2 for On Leave, and -1 for all other values.

-- SOLUTION:

SELECT
    employee_id,
    employee_name,
    status,
    CASE
        WHEN status = 'Active' THEN 1
        WHEN status = 'Inactive' THEN 0
        WHEN status = 'On Leave' THEN 2
        ELSE -1
    END AS status_code
FROM EmployeeStatus;


-- EXERCISE 6:
-- Display employee names and a message:
-- 'Welcome back' for Active employees,
-- 'Please contact HR' for Inactive employees,
-- 'Status needs review' for all others.

-- SOLUTION:

SELECT
    employee_id,
    employee_name,
    status,
    CASE
        WHEN status = 'Active' THEN 'Welcome back'
        WHEN status = 'Inactive' THEN 'Please contact HR'
        ELSE 'Status needs review'
    END AS employee_message
FROM EmployeeStatus;


-- EXERCISE 7:
-- Return only Active employees using CASE WHEN
-- inside the WHERE clause.

-- SOLUTION:

SELECT
    employee_id,
    employee_name,
    status
FROM EmployeeStatus
WHERE
    CASE
        WHEN status = 'Active' THEN 1
        ELSE 0
    END = 1;


-- EXERCISE 8:
-- Count how many employees are Active and Inactive.
-- Return the counts as separate columns.

-- SOLUTION:

SELECT
    COUNT(CASE WHEN status = 'Active' THEN 1 END) AS active_count,
    COUNT(CASE WHEN status = 'Inactive' THEN 1 END) AS inactive_count
FROM EmployeeStatus;


-- EXERCISE 9:
-- Create a flag that returns 1 when status is NULL
-- and 0 when status is not NULL.

-- SOLUTION:

SELECT
    employee_id,
    employee_name,
    status,
    CASE
        WHEN status IS NULL THEN 1
        ELSE 0
    END AS null_status_flag
FROM EmployeeStatus;


-- EXERCISE 10:
-- Categorize employees into:
-- 'Working' for Active,
-- 'Not Working' for Inactive,
-- 'Needs Review' for all other statuses.

-- SOLUTION:

SELECT
    employee_id,
    employee_name,
    status,
    CASE
        WHEN status = 'Active' THEN 'Working'
        WHEN status = 'Inactive' THEN 'Not Working'
        ELSE 'Needs Review'
    END AS employee_category
FROM EmployeeStatus;
