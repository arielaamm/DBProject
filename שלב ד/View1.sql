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

-- Query 2: הצגת הזמנות שבוצעו בין תאריכים מסוימים
SELECT o.orderid, o.orderdate, o.deliverydate, o.status, o.totalamount, c.customerid, c.name AS customer_name
FROM air_order_view o
JOIN customers_view c ON o.customerid = c.customerid
WHERE o.orderdate BETWEEN '2024-01-01' AND '2024-06-30';
