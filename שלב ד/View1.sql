-- Create view for original wing perspective
CREATE VIEW OriginalWingView AS
SELECT 
    c.customerid, 
    c.name, 
    o.orderid, 
    o.orderdate, 
    o.deliverydate, 
    o.status, 
    p.productid, 
    p.name AS product_name, 
    p.category
FROM 
    CUSTOMERS c
JOIN 
    AIR_ORDER o ON c.customerid = o.customerid
JOIN 
    PART_OF po ON o.orderid = po.orderid
JOIN 
    PRODUCT p ON po.productid = p.productid;

-- Query 1: Retrieve all orders for a specific customer
SELECT * FROM OriginalWingView WHERE customerid = 1;

-- Query 2: Retrieve all products ordered by a specific customer
SELECT DISTINCT productid, product_name, category 
FROM OriginalWingView 
WHERE customerid = 1;

-- Query 3: Retrieve all orders with a specific status
SELECT * FROM OriginalWingView WHERE status = 'Shipped';

-- Query 4: Retrieve all customers who ordered a specific product
SELECT DISTINCT customerid, name 
FROM OriginalWingView 
WHERE productid = 1;
