IF OBJECT_ID(N'dbo.DateExtractionPractice', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.DateExtractionPractice (
        OrderID INT PRIMARY KEY,
        CustomerName NVARCHAR(50) NOT NULL,
        OrderDateTime DATETIME2(0) NOT NULL
    );

    INSERT INTO dbo.DateExtractionPractice
        (OrderID, CustomerName, OrderDateTime)
    VALUES
        (1,  'Maya',   '2024-01-15T09:30:00'),
        (2,  'Liam',   '2024-02-29T12:05:09'),
        (3,  'Noah',   '2024-03-31T23:50:00'),
        (4,  'Ava',    '2024-04-01T00:15:00'),
        (5,  'Sophia', '2024-06-15T08:00:00'),
        (6,  'Ethan',  '2024-07-04T14:20:35'),
        (7,  'Olivia', '2024-09-30T17:45:00'),
        (8,  'Arjun',  '2024-12-31T23:45:00'),
        (9,  'Riya',   '2025-01-01T00:30:00'),
        (10, 'Noah',   '2025-05-10T05:06:07');
END;

SELECT *
FROM dbo.DateExtractionPractice;

--###The query is use to create the TABLE TO WORK ON Date function exercises

--#Exercise 1: From DateExtractionPractice, show each order’s ID, date only, year, month number, and month name. Use CAST, YEAR, MONTH, and DATENAME.

ANS-
SELECT
orderid,
CAST(OrderDateTime AS DATE)AS DATE,
YEAR(OrderDateTime)AS YEAR,
MONTH(ORDERDATETIME)AS MONTH
FROM DateExtractionPractice

--Exercise 2: Find all orders placed in the first quarter of 2024. Use YEAR() and DATEPART(QUARTER, ...) to filter the rows.

SELECT 
ORDERID,
ORDERDATETIME,
DATEPART(QUARTER,OrderDateTime) AS QUARTER_RESULTS
FROM DateExtractionPractice
WHERE DATEPART(QUARTER,OrderDateTime)=1 AND YEAR(ORDERDATETIME)=2024;

--**Exercise 3:** For each order, show its ID and order date, then use `DATETRUNC` to display the start of its month, quarter, and year.
SELECT 
ORDERID,
ORDERDATETIME,
CAST(DATETRUNC(MONTH,ORDERDATETIME)AS DATE) AS START_OF_MONTH,
CAST(DATETRUNC(QUARTER,ORDERDATETIME) AS DATE) AS START_OF_QUARTER,
CAST(DATETRUNC(YEAR,ORDERDATETIME)AS DATE) AS START_OF_YEAR
FROM DateExtractionPractice

--**Exercise 4:** Find all orders placed on the last calendar day of their month. Use `EOMONTH` and remember that `OrderDateTime` includes a time.

SELECT 
ORDERID,
ORDERDATETIME,
EOMONTH(ORDERDATETIME) AS END_MONTH_SALES
FROM DateExtractionPractice
WHERE CAST(ORDERDATETIME AS DATE)=EOMONTH(ORDERDATETIME);

--**Exercise 5:** List each order’s ID, customer name, and date/time. Sort the results from newest to oldest using `ORDER BY ... DESC`.

SELECT
ORDERID,
CUSTOMERNAME,
ORDERDATETIME
FROM DateExtractionPractice
ORDER BY ORDERDATETIME DESC
