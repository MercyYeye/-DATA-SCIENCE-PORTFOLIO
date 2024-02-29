-- qst 1create a report that shows the categoryname and description from the categories table sorted by categoryname
select categoryname, description from categories
order by categoryname;

-- qst 2 create a report that shows the contactName, companyName, contactTitle and phone number from the customers table sorted by phone

select contactname, companyname, contactTitle, phone number from customers 
order by phone; 

-- qst 3 create a report that shows the capitalized FIRSTNAME and capitalized LASTNAME renamed as FIRST NAME;
 -- and LASTNAME respectively and hiredate from the employess table sorted from the newest to the oldest employee
 
select upper(firstname), upper(lastname), HireDate from employees order by HireDate desc;


-- qst 4 create a report that shows the top 10 orderid,orderdate,shippeddate, customerid,freight from the orders table  by freight in descending order  

select orderid, orderdate, shippeddate, customerid, freight
from orders
order by freight desc
limit 10;
-- question 5.	Create a report that shows all the CustomerID in lowercase letter and renamed as ID from the customers table. 
select lower(customerid) as id
from customers;
-- qst 6 Create a report that shows the CompanyName, Fax, Phone, Country, HomePage from the suppliers table sorted by 
--  the Country in descending order then by CompanyName in ascending order.
SELECT CompanyName, Fax, Phone, Country, HomePage
FROM suppliers
ORDER BY Country DESC, CompanyName ASC;


-- qst 7 create a report that shows the company, fax, phone, country, homepage from the supplier table sorted  by the country in descending order 
-- then by companyname, in ascending order

select companyname, fax, phone, country, homepage from suppliers
order by Country desc, CompanyName asc;

-- qst 8 create a report that shows companyname , contactname of all customers from 'Buenos Aires' only
select companyname, contactname
from customers
where CompanyName like "Buenos Aires";


-- qst 9 create a report showing productname, unitprice,quantityperunit of products that are out of stock

select productname, unitprice, quantityperunit, UnitsInStock
from products
where UnitsInStock <1;

-- qst 10 create a report showing all the contactactname, address, city of al customers not from Germany, Mexico, spain
select contactname, address, city, country
from customers 
where Country NOT in ("Germany", "Mexico", "Spain");

-- qst 11 create a report showing orderdate, shippeddate, customerid, freight of all the ordersplaced on 21 May 1996
select orderdate, shippeddate, customerid, freight
from orders
where orderdate = '1996-05-21';

-- qst 13 create report firstname,lastname,country from the employees not from cities  from united states
select firstname, lastname, country,city
from employees
where country not in ("USA");

-- qst 14 create a report that shows the EmployeeId, orderid,customerid,requireddate,shippeddate,
-- from all orders shipped later than the required date

select employeeid, orderid, customerid,requireddate,shippeddate
from orders
where  ShippedDate > RequiredDate;

-- qst 15 create a report that shows the city, companyname,contactname of customers from cities starting with A or	B  begin
select city, companyname, contactname
from customers
where city like "b%" or "a%";

select CITY
FROM customers
WHERE CITY LIKE "b%";

-- qst 16 create a report showing all the even numbers of orderid from the orders table

select orderid
from orders
where mod(orderid, 2) = 0;

-- qst 17 create a report that shows all the orders where the freight cost more than $500

select *
from orders 
where Freight > 500;

-- qst 18 create a report that shows the productname , unitinstock, unitonorder,reorderlevel of all product that are up for recorder
select productname, UnitsInStock, UnitsInStock, reorderlevel
from products
where ReorderLevel > 0;

select companyname, contactname 
from customers
where fax is null;

-- qst 19 create that shows firstname,lastname of all employees that do not report to anybody
select firstname,lastname 
from employees
where ReportsTo is null;

-- qst 20 create a report  showing all the odd numbers of orderid from the orders table
select orderid
from orders
where mod(orderid,2) <>0;

-- qst 21 create a report that shows the companyname, contactname, fax of all customers that do not have fax number and sorted by contactname
select companyname, contactname, fax
from customers 
where fax is null
order by contactname desc;

-- qst 22 create a report that shows the companyname, number of all customers from cities that has letter L in te name sorted by contactname.
select companyname, phone, city
from customers
where city like "L%"
order by contactname desc;

--  qst 23 create a report that shows the firstname, lastname birthdate of employees born in the 1950
select firstname, lastname, birthdate
from employees 
where birthdate >= '1950-01-01';

-- qst24 create a report that shows firstname, lastname, the year of birthdate as birth year from the employees table 

select firstname, lastname, birthdate as birthyear
from employees;

-- qst 25 create a report showing orderid, total number of ordeid as numberoforders from the orderdetailstable 
-- grouped byorderid and sorted by numberoforders in desc order 
select orderid, count(orderid) as numberoforders
from `order details`
group by orderid
order by count(orderid) desc;

-- create a report 

select *
from suppliers;

-- qst 26 create a report that shows the supplierid, productname,companyname from all .....
-- product supplied by exotic liquids, specialty biscuits,ltd.,  escargot nouveaux sorted by the supplierid


select supplierid, productname, companyname
from products as p
inner join suppliers as s on s.supplierID = p.supplierid
where s.companyname in ('exotic liquids', 'escargots nouveaux' , 'specialty biscuits, ltd.') 
order by s.supplierID;

-- qst 27 create a report that shows the shippostalcode, orderid,orderdate,requireddte,shippeddate,shipaddress
-- of all orders with shippostalcode beginning with '98124'
select shippostalcode, orderid, orderdate, requireddate, shippeddate, shipaddress
from orders
where   ShipPostalCode = '98124';

-- qst 28 create a report that shows the contactname, contacttitle,companyname of customers that has no ;'sales' in their contacttile
select contactname, contacttitle, companyname
from customers 
where ContactTitle not like "%sales%";

-- qst 29 create a report that shows lastname, firstname, city of employes in cities other 'seattle'

select lastname, firstname, city
from employees
where city not like "seattle";

-- qst 30 create a report that shows companyname, contacttitle,city, country of all customers in any city in mexico or
--  other cities in spain other than madrid

select companyname, contacttitle, city, country
from customers
where city not like "%madrid%";

-- qst 31 create a report that shows contactname of all customer that do not have letter A as the second alphabet in their contactname
select contactname
from customers
 where contactname not like "%_A%";

-- qst 32 create a report that shows the average unitprice

select round(avg(unitprice)) as averageprice, sum(unitsinstock) as totalstock, max(unitsonorder) as maxorder
from products;

-- Qst 33 create a report that shows the , supplierid, companyname, categoryname, productname,and unitprice
--  from the products table suppliers and categories table

select s.supplierid, s.companyname,c.categoryname,p.productname,p.unitprice
from products as p
inner join suppliers as s on s.SupplierID = p.SupplierID
inner join categories as c on c.CategoryID = p.CategoryID;

-- 34 create a report that shows the customerid,sum of freight, 
-- from the orderstable with sum of freight greater 200, grouped by customerid
select customerid, sum(freight)
from orders 
group by customerid
having sum(freight) >200;

-- qst 35 create a report that shows the orderid, contactname,unitprice,quantity, discount 
 -- from the order details, orders and customers table  with discount given on every purchase.
 
    
 select o.OrderID, c.contactname, od.unitprice, od.unitprice, od.discount
 from orderdetails as od
 inner join orders as o on o.OrderID = od.OrderID
 inner join customers as c on c.CustomerID = o.CustomerID
 where Discount > 0;
 
 -- qst 36 create a report that shows Employeesid, the lastname and firstname as employee and the lastname and firstname
 -- of who they report to as manager from the employees table sorted by employee
 select e.employeeid, 
 concat(e.firstname, ' ', e.lastname) as employee,
 concat (m.firstname, ' ', m.lastname) as manager
 from employees as e
 left join employees m on m.employeeid = e.reportsto;
 
 -- qst 37 create a report that shows the average ,minimum and maximum unitprice of all products as 
 -- averageprice, minimumprice and maximumprice respectively.
 select avg(unitprice) as averageprice, min(unitprice) as minimumprice, max(unitprice) as maximumprice
 from products;
 
 -- qst 38 create a view named customerinfo that shows customerid, companyname,contactname, contacttitle,address,city,country,phone
 -- phone, orderdate,requireddate,shippeddate from the customers aand orders table 
 
 create view customerinfo as
 select c.customerid, c.companyname, c. ContactName, c.contacttitle, c.address, c.city, c.country,c.phone, o.orderdate, o.requireddate,o.shippeddate
 from customers as c
 inner join orders as o on c.CustomerID = o.CustomerID;
 
 -- qst 39, change the name view you created from from customerinfo to customer details.alter
 
 rename table customerinfo to customerdetails;
 
 SELECT * FROM northwind.products;

-- Qst 40 create a view productdetails that shows the productid, companyname,productname,categoryname,description, quantity perunit
  -- unitprice,unitsinstock,unitsonorder,reorderlevel, discontinue from the suppliers, products and categories table
  SELECT
    p.ProductID,
    s.CompanyName,
    p.ProductName,
    c.CategoryName,
    p.QuantityPerUnit,
    p.UnitPrice,
    p.UnitsInStock,
    p.UnitsOnOrder,
    p.ReorderLevel,
    p.Discontinued
    from products P 
     JOIN Suppliers s ON p.SupplierID = s.SupplierID
     JOIN
    Categories c ON p.CategoryID = c.CategoryID;








