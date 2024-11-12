select * from INFORMATION_SCHEMA.tables

select * from customer 

select * from sale

select * from employee

select * from inventory 

select * from customer 


--select top 5 * from customer 
select * from customer
limit 5

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


SELECT customerid, customerphonenumber, customersuburb, customerlastname 
FROM customer 
WHERE customerphonenumber LIKE '%35%' 
   OR customerphonenumber LIKE '%03%' 
   OR customerphonenumber LIKE '%77%';

select customerid,customerlastname,customersuburb,customerphonenumber from customer
where customerphonenumber in ('0733768903'  ,'0112589635 ','0734562577')
  
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

--COUNTING THE NUMBER OF NULL VALUES
select COUNT(*) from customer 
where customerpostcode is null

select COUNT(*) from customer 
where customerphonenumber is null

select COUNT(*) from customer 
where customercity is null

select COUNT(*) from customer 
where customersuburb is null

select COUNT(*) from customer 
where customeraddress is null

select COUNT(*) from customer 
where customerfirstname is null

select COUNT(*) from customer 
where customerlastname is null

select COUNT(*) from customer 
where customerpostcode is null
or  customerphonenumber is null
or customercity is null
or customersuburb is null
or customeraddress is null
or customerfirstname is null
or customerlastname is null

SELECT SUM(NULLIF(ISNULL(customerpostcode, 1), 0) + 
           NULLIF(ISNULL(customerphonenumber, 1), 0) + 
           NULLIF(ISNULL(customercity, 1), 0) + 
           NULLIF(ISNULL(customersuburb , 1), 0) + 
           NULLIF(ISNULL(customeraddress , 1), 0) + 
           NULLIF(ISNULL(customerfirstname , 1), 0) +  
           NULLIF(ISNULL(customerlastname , 1), 0)) AS TotalNullValues
FROM customer;

SELECT COUNT(*) AS TotalNullValues
FROM customer
UNPIVOT (
  value FOR col IN (customerpostcode, customerphonenumber, customercity, customersuburb, customeraddress, customerfirstname, customerlastname) -- add all columns here
) AS unpvt
WHERE value IS NULL;

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

select * from customer

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

