--DATE FUNCTIONSFROMATING AND CASTING
SELECT 
ORDERID,
CUSTOMERNAME,
ORDERDATETIME,
DATEPART(QUARTER,ORDERDATETIME) AS QUARTER_RESULTS,
YEAR(ORDERDATETIME),
COUNT(*)
FROM DateExtractionPractice
GROUP BY DATEPART(QUARTER,ORDERDATETIME)
ORDER BY YEAR ASC

CREATE TABLE date_practice (
    id INT PRIMARY KEY,
    raw_date_time DATETIME
);

INSERT INTO date_practice (id, raw_date_time) VALUES
(1, '2025-01-01 12:34:56'),
(2, '2025-02-14 09:15:30'),
(3, '2025-03-31 18:45:10'),
(4, '2025-04-10 07:20:05'),
(5, '2025-05-25 13:10:40'),
(6, '2025-06-18 22:55:15'),
(7, '2025-07-04 08:30:00'),
(8, '2025-08-15 16:25:35'),
(9, '2025-09-21 11:40:20'),
(10, '2025-10-31 23:59:59'),
(11, '2025-11-11 14:05:45'),
(12, '2025-12-25 06:15:25'),
(13, '2024-01-20 10:10:10'),
(14, '2024-04-05 15:30:45'),
(15, '2024-07-19 19:20:30'),
(16, '2024-10-08 01:05:50'),
(17, '2026-02-28 12:00:00'),
(18, '2026-05-12 17:45:25'),
(19, '2026-08-30 21:10:15'),
(20, '2026-11-22 04:35:40');

--Excersice 1 question :write a SELECT query that extracts these fields from raw_date_time:
--Day name | Short day | Short month | Quarter | Year | Time with AM/PM
--SOLUTION:
SELECT
id,
FORMAT(raw_date_time, 'dddd ddd MMM ')+'Q'+ DATENAME(QUARTER,raw_date_time)+ ' ' + FORMAT(raw_date_time,'yyyy hh:mm:ss tt')  as new_format
from date_practice

--EX.2-Show the full weekday name, month name, and year for every date.
--solution:
SELECT
    id,
    FORMAT(raw_date_time, 'dddd') AS full_weekday_name,
    FORMAT(raw_date_time, 'MMMM') AS full_month_name,
    FORMAT(raw_date_time, 'yyyy') AS full_year
FROM date_practice;

--EX:3-Extract the day number, month number, and year as separate columns.
--SOLUTION:
 SELECT
 ID,
 DATEPART(DAY,RAW_DATE_TIME) AS DAY_NUMBER,
  DATEPART(MONTH,RAW_DATE_TIME) AS MONTH_NUMBER,
  DATEPART(YEAR,RAW_DATE_TIME) AS YEAR_NUMBER
 FROM date_practice;

--EXE:4-Display each date in this format:
--01-Jan-2025
--Solution:
SELECT
ID,
FORMAT(raw_date_time,'dd-MMM-yyyy') AS NEW_Format
FROM date_practice;

--EX:4-Next exercise: display each date like this:
--Wednesday, January 01, 2025
--Solution

 SELECT
 ID,
 FORMAT(raw_date_time,'dddd, MMMM dd, yyyy') AS new_format 
 FROM date_practice;

/*EX:5-Show the quarter for every date in this format:
Q1
Q2
Q3
Q4
Return these columns:
id | raw_date_time | quarter*/
--SOLUTION:
SELECT
  ID,
  raw_date_time,
  'Q' + DATENAME(QUARTER,raw_date_time) AS  quarter
  FROM date_practice;

/*EX-6
Show only the records where the year is 2025.
Return:
id | raw_date_time
SOution-*/

    SELECT
    ID,
    raw_date_time
    FROM date_practice
    WHERE YEAR(raw_date_time)=2025;

/*Exercise 7: Show only the records that belong to Quarter 1.
Return:
id | raw_date_time | quarter
SOLUTION-*/


    SELECT
    ID,
    raw_date_time,
    DATEPART(QUARTER,raw_date_time) AS quarter
    FROM date_practice
    WHERE DATEPART(QUARTER,raw_date_time) =1;

/*Exercise 8: Show only the records where raw_date_time falls on a Saturday or Sunday.
Return:
id | raw_date_time | weekday_name
Solution*/

  SELECT
  ID,
  raw_date_time,
  DATENAME(WEEKDAY,raw_date_time) AS Weekday_Name
  FROM date_practice
  WHERE DATENAME(WEEKDAY,raw_date_time) = 'Saturday' or DATENAME(WEEKDAY,raw_date_time)= 'Sunday';  

/* Exercise 9: Calculate the number of days between each raw_date_time and today.
Return:
id | raw_date_time | days_from_today*/


SELECT
ID,
raw_date_time,
DATEDIFF(DAY,raw_date_time,GETDATE()) AS day_from_today
FROM date_practice

/*Exercise 10: Add 30 days to every raw_date_time.
Return:
id | raw_date_time | date_after_30_days
SOLUTION: */

SELECT
id,
raw_date_time,
DATEADD(DAY,30,raw_date_time) AS date_after_30_days
FROM date_practice

/*Exercise 11: For every raw_date_time, show the first day and last day of its month.
Return:
id | raw_date_time | first_day_of_month | last_day_of_month

SOLUTION- */

SELECT
    id,
    raw_date_time,
    CAST(DATETRUNC(MONTH, raw_date_time) AS DATE) AS first_day_of_month,
    EOMONTH(raw_date_time) AS last_day_of_month
FROM dbo.date_practice;

/*Exercise 15: Sort the records by month name in alphabetical order.
Return:
id | raw_date_time | month_name
After that, write a second query that sorts the records in calendar-month order: January through December.
SOLTIONS FOR BOTH-*/

--ALPHABETICAL ORDER
SELECT 
id,
raw_date_time,
DATENAME(MONTH,raw_date_time) AS month_name
FROM date_practice
ORDER BY month_name ASC

--Calendar month order

SELECT 
id,
raw_date_time,
MONTH(raw_date_time) AS month_number,
DATENAME(MONTH,raw_date_time) AS month_name
FROM date_practice
ORDER BY month_number ASC;

  
