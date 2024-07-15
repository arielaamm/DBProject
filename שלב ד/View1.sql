CREATE VIEW customers_view AS
SELECT customerid, name, contactnumber, email, address, industrytype, accountmanagerid
FROM CUSTOMERS;

CREATE VIEW air_order_view AS
SELECT orderid, orderdate, deliverydate, status, totalamount, customerid
FROM AIR_ORDER;

-- Query 1: הצגת לקוחות שהזמינו בסכום מעל 1000
SELECT c.customerid, c.name AS customer_name, o.orderid, o.totalamount
FROM customers_view c
JOIN air_order_view o ON c.customerid = o.customerid
WHERE o.totalamount > 1000;
