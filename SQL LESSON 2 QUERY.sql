create database sample2 --creating our database

--shifting into our created database
use sample2

--creating a table called customer
create table customer
(
customerid int identity(1,1) primary key,
customernumber int not null unique check (customernumber>0),
lastname varchar(30) not null,
firstname varchar(30) not null,
areacode int default 71000,
address varchar(50),
country varchar(50) default 'Malaysia'
)

--displaying our customer table
select * from customer