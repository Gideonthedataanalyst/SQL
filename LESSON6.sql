SELECT * FROM INFORMATION_SCHEMA.TABLES

DROP TABLE sale



DROP TABLE inventory

--CREATING INVENTORY TABLE

create table dbo.inventory (
InventoryID tinyint NOT null primary key,
InventoryName varchar(50) NOT null,
InventoryDescription varchar(255) null,
);

-- ADDING VALUES INTO INVENTORY TABLE 

 insert into inventory values
(001,'SoftDrinks','cocacola'),
(002,'springwater','dasani'),
(003,'fermentedmilk','Tuzo'),
(004,'freshwater','springs'),
(005,'GreatGin','Gilbeys'),
(006,'smoothWhiskey','JohnieWalker'),
(007,'Beer','Tusker'),
(008,'FreshMilk','Ilara'),
(009,'ChilledBeer','Guinness'),
(010,'GreatTea','Ketepa')

SELECT * FROM inventory

create table dbo.sale (
SaleID tinyint not null primary key,
CustomerID int not null references customer(CustomerID),
InventoryID tinyint not null references Inventory(InventoryID),
EmployeeID tinyint not null references Employee(EmployeeID),
SaleDate date not null,
SaleQuantity int not null,
SaleUnitPrice smallmoney not null)


SELECT * FROM sale


--CREATING EMPLOYEE TABLE

create table dbo.employee (
EmployeeID tinyint NOT null primary key,
EmployeeFirstName varchar(50) NOT null,
EmployeeLastName varchar(50) NOT null,
EmployeeExtension char(4) null,
);


SELECT * FROM employee

SELECT * FROM customer

INSERT INTO dbo.sale (SaleID, CustomerID, InventoryID, EmployeeID, SaleDate, SaleQuantity, SaleUnitPrice)
VALUES (1, 1, 1, 111, '2023-05-30', 10, 9.99);

INSERT INTO dbo.sale (SaleID, CustomerID, InventoryID, EmployeeID, SaleDate, SaleQuantity, SaleUnitPrice)
VALUES (2, 2, 2, 112, '2023-05-30', 5, 6);
INSERT INTO dbo.sale (SaleID, CustomerID, InventoryID, EmployeeID, SaleDate, SaleQuantity, SaleUnitPrice)
VALUES (3, 3, 3, 113, '2023-06-01', 20, 30);


INSERT INTO dbo.sale (SaleID, CustomerID, InventoryID, EmployeeID, SaleDate, SaleQuantity, SaleUnitPrice)
VALUES (4, 4, 4, 114, '2023-06-02', 3, 15);

INSERT INTO dbo.sale (SaleID, CustomerID, InventoryID, EmployeeID, SaleDate, SaleQuantity, SaleUnitPrice)
VALUES (5, 5, 4, 115, '2023-06-02', 10, 16);

INSERT INTO dbo.sale (SaleID, CustomerID, InventoryID, EmployeeID, SaleDate, SaleQuantity, SaleUnitPrice)
VALUES (6, 6, 6, 115, '2023-06-02', 5, 26);

INSERT INTO dbo.sale (SaleID, CustomerID, InventoryID, EmployeeID, SaleDate, SaleQuantity, SaleUnitPrice)
VALUES (7, 7, 2, 111, '2023-06-03', 5, 10);

INSERT INTO dbo.sale (SaleID, CustomerID, InventoryID, EmployeeID, SaleDate, SaleQuantity, SaleUnitPrice)
VALUES (8, 8, 6, 112, '2023-06-03', 20, 100);

INSERT INTO dbo.sale (SaleID, CustomerID, InventoryID, EmployeeID, SaleDate, SaleQuantity, SaleUnitPrice)
VALUES (9, 9, 7, 117, '2023-06-03', 30, 1100);
INSERT INTO dbo.sale (SaleID, CustomerID, InventoryID, EmployeeID, SaleDate, SaleQuantity, SaleUnitPrice)
VALUES (10, 10, 5, 116, '2023-06-04', 6, 17);

SELECT * FROM sale



--selecting a few columns from our table
select customerid from sale 

select saleid,saledate,salequantity,saleunitprice from sale 


-- displaying top rows
select * from customer 

select top 40 percent* from customer


-- VIEWING SPECIFIC COLUMNS OF THE CUSTOMER TABLE IN DESCENDING ORDER

SELECT CustomerLastName,CustomerFirstName  FROM customer 
ORDER BY CustomerLastName DESC


--VIEWING SPECIFIC COLUMNS OF THE CUSTOMER TABLE IN ASCENDING ORDER

SELECT CustomerLastName,CustomerFirstName  FROM customer 
ORDER BY CustomerLastName


-- ORDER BY FOR DISTINCT COLUMN VALUES

SELECT DISTINCT CustomerLastName FROM customer 
ORDER BY CustomerLastName

select * from customer -- (underscore sign) _ is only specific for one character only
-- (percent sign) % represents zero, one, or multiple characters
select * from customer
where customerlastname like '_h%'

select * from customer
where customerlastname like '_hi%'

select * from customer
where customerlastname='Shiro'


--searching multiple items
select * from customer
where customerlastname in ('Chacha', 'Sham', 'Paul')


-- search multiple items
select * from customer

where customerlastname > 'Chacha' or customerlastname<'Omondi'



--where customerlastname is not equal to Shiro

select * from customer
where customerlastname <> 'Shiro'


