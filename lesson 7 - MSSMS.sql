use saleorder
select * from INFORMATION_SCHEMA.TABLES

select * from customer 

select * from sale

select * from employee

select * from inventory 

select top 5 * from customer 

select customerid,customerlastname,customersuburb from customer
order by customerid desc

select customerid,customerlastname,customersuburb from customer
where customerlastname = 'Shiro'

select customerid,customerlastname,customersuburb from customer
where customerlastname LIKE 'Shir_'

select customerid,customerlastname,customersuburb from customer
where customerlastname like '_h%'

select customerid,customerlastname,customersuburb,customerphonenumber from customer
where customerphonenumber like '%03'

--CHECKING FOR NULL VALUES
select * from customer 
where customeraddress is null 

select * from customer 
where customersuburb is null 

select * from customer 
where customercity is null 

select * from customer 
where customerpostcode is null 

select * from customer 
where customerphonenumber is null  


select COUNT(*) from customer 
where customerpostcode is null
or  customerphonenumber is null
or customercity is null
or customersuburb is null
or customeraddress is null
or customerfirstname is null
or customerlastname is null



INSERT INTO dbo.sale (SaleID, CustomerID, InventoryID, EmployeeID, SaleDate, SaleQuantity, SaleUnitPrice)
VALUES (1, 1, 1, 111, '2023-05-30', 10, 9.99);

select * from sale

INSERT INTO dbo.sale (SaleID, CustomerID, InventoryID, EmployeeID, SaleDate, SaleQuantity, SaleUnitPrice)
VALUES (2, 2, 2, 112, '2023-05-30', 5, 6);

INSERT INTO dbo.sale (SaleID, CustomerID, InventoryID, EmployeeID, SaleDate, SaleQuantity, SaleUnitPrice)
VALUES (3, 3, 3, 113, '2023-06-01', 20, 30);

select * from sale

INSERT INTO dbo.sale (SaleID, CustomerID, InventoryID, EmployeeID, SaleDate, SaleQuantity, SaleUnitPrice)
VALUES (4, 4, 4, 114, '2023-06-02', 3, 15);

INSERT INTO dbo.sale (SaleID, CustomerID, InventoryID, EmployeeID, SaleDate, SaleQuantity, SaleUnitPrice)
VALUES (5, 5, 4, 115, '2023-06-02', 10, 16);

INSERT INTO dbo.sale (SaleID, CustomerID, InventoryID, EmployeeID, SaleDate, SaleQuantity, SaleUnitPrice)
VALUES (6, 6, 6, 115, '2023-06-02', 5, 26);

INSERT INTO dbo.sale (SaleID, CustomerID, InventoryID, EmployeeID, SaleDate, SaleQuantity, SaleUnitPrice)
VALUES (7, 3, 2, 111, '2023-06-03', 5, 10);

INSERT INTO dbo.sale (SaleID, CustomerID, InventoryID, EmployeeID, SaleDate, SaleQuantity, SaleUnitPrice)
VALUES (8, 10, 6, 112, '2023-06-03', 20, 100);

INSERT INTO dbo.sale (SaleID, CustomerID, InventoryID, EmployeeID, SaleDate, SaleQuantity, SaleUnitPrice)
VALUES (9, 8, 7, 117, '2023-06-03', 30, 1100);


INSERT INTO dbo.sale (SaleID, CustomerID, InventoryID, EmployeeID, SaleDate, SaleQuantity, SaleUnitPrice)
VALUES (10, 4, 5, 116, '2023-06-04', 6, 17);

select * from sale

SELECT SUM(
    (CASE WHEN customerpostcode IS NULL THEN 1 ELSE 0 END) + 
    (CASE WHEN customerphonenumber IS NULL THEN 1 ELSE 0 END) + 
    (CASE WHEN customercity IS NULL THEN 1 ELSE 0 END) + 
    (CASE WHEN customersuburb IS NULL THEN 1 ELSE 0 END) + 
    (CASE WHEN customeraddress IS NULL THEN 1 ELSE 0 END) +
    (CASE WHEN customerfirstname IS NULL THEN 1 ELSE 0 END) +
    (CASE WHEN customerlastname IS NULL THEN 1 ELSE 0 END)
) AS TotalNullValues
FROM customer;


SELECT
    (SELECT COUNT(*) FROM customer WHERE CustomerFirstName IS NULL) +
    (SELECT COUNT(*) FROM customer WHERE CustomerLastName IS NULL) +
    (SELECT COUNT(*) FROM customer WHERE CustomerAddress IS NULL) +
    (SELECT COUNT(*) FROM customer WHERE CustomerSuburb IS NULL) +
    (SELECT COUNT(*) FROM customer WHERE CustomerCity IS NULL) +
    (SELECT COUNT(*) FROM customer WHERE CustomerPostCode IS NULL) +
    (SELECT COUNT(*) FROM customer WHERE CustomerPhoneNumber IS NULL) AS TotalNulls


    SELECT 
    SUM(
        CASE WHEN customerphonenumber IS NULL THEN 1 ELSE 0 END +
        CASE WHEN customerpostcode IS NULL THEN 1 ELSE 0 END +
        CASE WHEN customeraddress IS NULL THEN 1 ELSE 0 end +
         CASE WHEN customercity IS NULL THEN 1 ELSE 0 end +
          CASE WHEN customerfirstname IS NULL THEN 1 ELSE 0 end +
           CASE WHEN customersuburb IS NULL THEN 1 ELSE 0 end +
            CASE when customerlastname IS NULL THEN 1 ELSE 0 end 
        -- add more columns as needed
    ) AS total_nulls
FROM customer;