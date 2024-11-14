select* from information_schema.tables

select* from customer 

select* from sale

select* from employee

select* from inventory

-- Count Function()
select count(*) from customer
where customerlastname like 's%'

-- SUM FUNCTION()

--for dbeaver try the following:
-- the JOIN condition is very important to ensure that we only focus on employees who actually made  a sale
SELECT sale.EmployeeID, EmployeeFirstName, EmployeeLastName,
       COUNT(*) AS "Number of orders",
       SUM(SaleQuantity) AS "Total Quantity"
FROM sale
JOIN employee ON sale.EmployeeID = employee.EmployeeID
GROUP BY sale.EmployeeID, EmployeeFirstName, EmployeeLastName;

--count month
--for dbeaver:
--performance of the months
SELECT EXTRACT(MONTH FROM saledate) AS "Month",
       COUNT(*) AS "Number of sales",
       SUM(salequantity * saleunitprice) AS "Total Amount"
FROM sale
GROUP BY EXTRACT(MONTH FROM saledate);

--MAX
SELECT MAX(sale.SaleQuantity)
FROM sale

SELECT MAX(sale.SaleQuantity) as "saleQuantity"
FROM sale

--MIN
SELECT MIN(sale.SaleQuantity) as "minimum sale quantity"
FROM sale

--AVERAGE
SELECT AVG(sale.SaleQuantity)
FROM sale


--decimal(10,2) means 10 characters and 2 decimal places
CREATE TABLE Orders (
  OrderID INT,
  CustomerID INT,
  OrderDate DATE,
  TotalAmount DECIMAL(10, 2)
);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
  (1, 1, '2022-01-01', 100.00),
  (2, 2, '2022-01-02', 200.00),
  (3, 1, '2022-01-03', 150.00),
  (4, 3, '2022-01-04', 50.00),
  (5, 2, '2022-01-05', 75.00),
  (6, 1, '2022-01-06', 125.00),
  (7, 3, '2022-01-07', 100.00),
  (8, 2, '2022-01-08', 225.00),
  (9, 1, '2022-01-09', 175.00),
  (10, 3, '2022-01-10', 75.00);

 select * from Orders
 
 --you can never have "where" clause after groupby
--therefore, having is a cousing to "where" that can can work after groupby
 --"where" usually comes immediately after "from tablename"
 SELECT CustomerID, SUM(TotalAmount) AS TotalSpent
FROM Orders
GROUP BY CustomerID
HAVING SUM(TotalAmount) > 300;


CREATE TABLE Employees (
  EmployeeID INT,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Salary DECIMAL(10, 2),
  Department VARCHAR(50)
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Salary, Department)
VALUES
  (1, 'John', 'Doe', 50000.00, 'Sales'),
  (2, 'Jane', 'Doe', 60000.00, 'Marketing'),
  (3, 'Bob', 'Smith', 70000.00, 'Sales'),
  (4, 'Sally', 'Jones', 80000.00, 'Marketing'),
  (5, 'Tom', 'Williams', 90000.00, 'Sales');
 
 select * from employees
 
 --now onto the case statement
 SELECT EmployeeID, FirstName, LastName, Salary,
  CASE
    WHEN Salary < 60000 THEN 'Low'
    WHEN Salary >= 60000 AND Salary < 80000 THEN 'Medium'
    ELSE 'High'
  END AS SalaryRange,
  Department
FROM Employees;


--CASE statement for filling missing values
CREATE TABLE Sales (
  SaleID INT PRIMARY KEY,
  ProductName VARCHAR(50),
  SaleDate DATE,
  SaleAmount DECIMAL(10, 2)
);

INSERT INTO Sales (SaleID, ProductName, SaleDate, SaleAmount) VALUES
  (1, 'Product A', '2022-01-01', 100.00),
  (2, 'Product B', '2022-01-02', 200.00),
  (3, 'Product C', '2022-01-03', NULL),
  (4, 'Product D', '2022-01-04', 400.00),
  (5, 'Product E', '2022-01-05', NULL),
  (6, 'Product F', '2022-01-06', NULL),
  (7, 'Product G', '2022-01-07', 700.00),
  (8, 'Product H', '2022-01-08', 800.00),
  (9, 'Product I', '2022-01-09', NULL),
  (10, 'Product J', '2022-01-10', 1000.00);
 
 
Select * from sales


-- the case statement now
--filling missing values with a zero
--you can fill missing values using 0s, the average, neighbors, and even a model (linear)
SELECT ProductName, CASE
    WHEN SaleAmount IS NULL THEN 0
    ELSE SaleAmount
END AS SalesAmount
FROM Sales


--we are only doing an average of values that are not null
--the denominator when getting mean
--denominator is bigger when you consider rpows that have null
--so we exclude these
UPDATE Sales
SET SaleAmount = (
    CASE
        WHEN SaleAmount IS NULL THEN (
            SELECT AVG(SaleAmount)
            FROM Sales
            WHERE SaleAmount IS NOT NULL
        )
        ELSE SaleAmount
    END
);

Select * from sales