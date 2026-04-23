-- Database Creation:

DROP DATABASE IF EXISTS E_Commerce_Order_Management_System;
CREATE DATABASE E_Commerce_Order_Management_System;
USE E_Commerce_Order_Management_System;

-- Category Table (must be created before Product due to FK reference)
CREATE TABLE Category (
    Category_id INT PRIMARY KEY AUTO_INCREMENT,
    Category_name VARCHAR(255) NOT NULL
);

-- Product Table
CREATE TABLE Product (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Category_id INT,
    Price DECIMAL(10, 2) NOT NULL,
    Stock_Quantity INT NOT NULL,
    Added_Date DATE NOT NULL,

    FOREIGN KEY (Category_id) REFERENCES Category(Category_id)
);

-- Customer Table
CREATE TABLE Customer (
    Customer_id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Phone_Number VARCHAR(20),
    Address VARCHAR(100),                    -- FIX: Added missing comma
    Registration_Date DATE NOT NULL
);

-- Orders Table
CREATE TABLE Orders (
    Order_id INT PRIMARY KEY AUTO_INCREMENT,
    Customer_id INT,
    Order_Date DATE NOT NULL,
    Total_Amount DECIMAL(10, 2) NOT NULL,
    Status VARCHAR(50) NOT NULL             -- FIX: Removed trailing comma
);

-- Order_Items Table
CREATE TABLE Order_Items (
    Order_Item_id INT PRIMARY KEY AUTO_INCREMENT,
    Order_id INT,
    Product_id INT,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,

    FOREIGN KEY (Order_id) REFERENCES Orders(Order_id),
    FOREIGN KEY (Product_id) REFERENCES Product(ProductID)
);

-- Payment Table
CREATE TABLE Payment (
    Payment_id INT PRIMARY KEY AUTO_INCREMENT,
    Order_id INT,
    Payment_Date DATE NOT NULL,
    Payment_Method VARCHAR(50) NOT NULL,
    Payment_Status VARCHAR(50) NOT NULL,
    FOREIGN KEY (Order_id) REFERENCES Orders(Order_id)
);

-- Shipping Table
CREATE TABLE Shipping (
    Shipping_id INT PRIMARY KEY AUTO_INCREMENT,
    Order_id INT,
    Shipping_Date DATE NOT NULL,
    Delivery_Date DATE,
    Shipping_Status VARCHAR(50) NOT NULL,
    FOREIGN KEY (Order_id) REFERENCES Orders(Order_id)
);


-- Sample Data Insertion (20 Dummy Records per major table):

-- Category Data
INSERT INTO Category (Category_name) VALUES
('Electronics'),
('Clothing'),
('Books'),
('Home & Kitchen'),
('Sports');

-- Product Data (20 rows)
INSERT INTO Product (Name, Category_id, Price, Stock_Quantity, Added_Date) VALUES
('Laptop',          1,  75000.00, 50, '2024-01-01'),
('Smartphone',      1,  45000.00, 80, '2024-01-05'),
('Headphones',      1,   5000.00,120, '2024-01-10'),
('Smart Watch',     1,  15000.00, 60, '2024-01-15'),
('Bluetooth Speaker',1,  3500.00, 90, '2024-01-20'),
('T-Shirt',         2,    799.00,200, '2024-02-01'),
('Jeans',           2,   1999.00,150, '2024-02-05'),
('Jacket',          2,   3499.00, 70, '2024-02-10'),
('Sneakers',        2,   2999.00,100, '2024-02-15'),
('Formal Shirt',    2,   1299.00,130, '2024-02-20'),
('Python Programming',3,  599.00,300, '2024-03-01'),
('Data Structures', 3,   499.00, 250, '2024-03-05'),
('Clean Code',      3,   699.00, 180, '2024-03-10'),
('Blender',         4,   4500.00, 40, '2024-03-15'),
('Coffee Maker',    4,   3200.00, 55, '2024-03-20'),
('Yoga Mat',        5,    899.00,110, '2024-04-01'),
('Cricket Bat',     5,   2500.00, 75, '2024-04-05'),
('Football',        5,    999.00, 95, '2024-04-10'),
('Cycling Helmet',  5,   1800.00, 45, '2024-04-15'),
('Dumbbells Set',   5,   3999.00, 30, '2024-04-20');

-- Customer Data (20 rows)
INSERT INTO Customer (Name, Email, Phone_Number, Address, Registration_Date) VALUES
('John Doe',        'john.doe@example.com',       '9876543210', '123 Main St, Mumbai',       '2022-01-15'),
('Jane Smith',      'jane.smith@example.com',      '9123456780', '456 Park Ave, Delhi',       '2022-03-20'),
('Raj Patel',       'raj.patel@example.com',       '9988776655', '789 Lake Rd, Ahmedabad',    '2022-05-10'),
('Priya Sharma',    'priya.sharma@example.com',    '9871234560', '12 Rose Lane, Pune',        '2022-07-25'),
('Amit Verma',      'amit.verma@example.com',      '9654321870', '34 Blue St, Bangalore',     '2022-09-05'),
('Neha Gupta',      'neha.gupta@example.com',      '9741258630', '56 Green Ave, Chennai',     '2022-11-18'),
('Kiran Mehta',     'kiran.mehta@example.com',     '9632147850', '78 Hill Rd, Hyderabad',     '2023-01-22'),
('Sonal Joshi',     'sonal.joshi@example.com',     '9512347896', '90 Sand Blvd, Jaipur',      '2023-03-14'),
('Vikram Singh',    'vikram.singh@example.com',    '9401236987', '11 River St, Lucknow',      '2023-05-30'),
('Pooja Nair',      'pooja.nair@example.com',      '9312458760', '22 Sea View, Kochi',        '2023-07-08'),
('Arjun Reddy',     'arjun.reddy@example.com',     '9210347856', '33 Tech Park, Bangalore',   '2023-08-19'),
('Meera Iyer',      'meera.iyer@example.com',      '9109236745', '44 Garden Rd, Coimbatore',  '2023-09-27'),
('Ravi Kumar',      'ravi.kumar@example.com',      '9008125634', '55 Fort Lane, Kolkata',     '2023-11-03'),
('Sunita Yadav',    'sunita.yadav@example.com',    '8907014523', '66 Market St, Varanasi',    '2024-01-12'),
('Deepak Shah',     'deepak.shah@example.com',     '8806903412', '77 Commerce Rd, Surat',     '2024-02-20'),
('Kavita Pillai',   'kavita.pillai@example.com',   '8705892301', '88 Palm Ave, Trivandrum',   '2024-03-05'),
('Manish Tiwari',   'manish.tiwari@example.com',   '8604781290', '99 Tech Hub, Indore',       '2024-04-10'),
('Ananya Das',      'ananya.das@example.com',      '8503670189', '101 Lake View, Bhopal',     '2024-05-18'),
('Rohit Bansal',    'rohit.bansal@example.com',    '8402569078', '102 City Centre, Nagpur',   '2024-06-25'),
('Shreya Bhatt',    'shreya.bhatt@example.com',    '8301458967', '103 Metro Way, Vadodara',   '2024-07-30');

-- Orders Data (20 rows)
INSERT INTO Orders (Customer_id, Order_Date, Total_Amount, Status) VALUES
(1,  '2024-01-10',  75000.00, 'Delivered'),
(2,  '2024-01-15',  45000.00, 'Delivered'),
(3,  '2024-02-01',   5799.00, 'Shipped'),
(4,  '2024-02-10',  16999.00, 'Pending'),
(5,  '2024-02-20',   7000.00, 'Delivered'),
(6,  '2024-03-01',  22000.00, 'Canceled'),
(7,  '2024-03-10',   3998.00, 'Delivered'),
(8,  '2024-03-20',  51000.00, 'Shipped'),
(9,  '2024-04-01',   2998.00, 'Pending'),
(10, '2024-04-10',   8999.00, 'Delivered'),
(1,  '2024-04-15',  15000.00, 'Delivered'),
(2,  '2024-05-01',   4500.00, 'Shipped'),
(3,  '2024-05-10',   1998.00, 'Delivered'),
(4,  '2024-05-20',  75600.00, 'Delivered'),
(5,  '2024-06-01',   3200.00, 'Canceled'),
(6,  '2024-06-10',   9800.00, 'Delivered'),
(7,  '2024-06-20',  45899.00, 'Pending'),
(8,  '2024-07-01',   5997.00, 'Shipped'),
(9,  '2024-07-10',  14999.00, 'Delivered'),
(10, '2024-07-20',   3999.00, 'Delivered');

-- Order_Items Data (20 rows)
INSERT INTO Order_Items (Order_id, Product_id, Quantity, Price) VALUES
(1,  1,  1, 75000.00),
(2,  2,  1, 45000.00),
(3,  3,  1,  5000.00),
(4,  4,  1, 15000.00),
(5,  5,  2,  7000.00),
(6,  6,  3,  2397.00),
(7,  7,  2,  3998.00),
(8,  8,  1, 51000.00),
(9,  9,  1,  2999.00),
(10, 10, 2,  2598.00),
(11, 11, 3,  1797.00),
(12, 12, 2,  1198.00),
(13, 13, 2,  1398.00),
(14, 1,  1, 75000.00),
(15, 14, 1,  4500.00),
(16, 15, 2,  6400.00),
(17, 2,  1, 45000.00),
(18, 16, 3,  2697.00),
(19, 17, 2,  5000.00),
(20, 20, 1,  3999.00);

-- Payment Data (20 rows)
INSERT INTO Payment (Order_id, Payment_Date, Payment_Method, Payment_Status) VALUES
(1,  '2024-01-10', 'Credit Card',   'Paid'),
(2,  '2024-01-15', 'UPI',           'Paid'),
(3,  '2024-02-01', 'Debit Card',    'Paid'),
(4,  '2024-02-10', 'Net Banking',   'Pending'),
(5,  '2024-02-20', 'UPI',           'Paid'),
(6,  '2024-03-01', 'Credit Card',   'Refunded'),
(7,  '2024-03-10', 'Cash on Delivery','Paid'),
(8,  '2024-03-20', 'UPI',           'Paid'),
(9,  '2024-04-01', 'Debit Card',    'Pending'),
(10, '2024-04-10', 'Credit Card',   'Paid'),
(11, '2024-04-15', 'UPI',           'Paid'),
(12, '2024-05-01', 'Net Banking',   'Paid'),
(13, '2024-05-10', 'Cash on Delivery','Paid'),
(14, '2024-05-20', 'Credit Card',   'Paid'),
(15, '2024-06-01', 'UPI',           'Refunded'),
(16, '2024-06-10', 'Debit Card',    'Paid'),
(17, '2024-06-20', 'Credit Card',   'Pending'),
(18, '2024-07-01', 'UPI',           'Paid'),
(19, '2024-07-10', 'Net Banking',   'Paid'),
(20, '2024-07-20', 'Cash on Delivery','Paid');

-- Shipping Data (20 rows)
INSERT INTO Shipping (Order_id, Shipping_Date, Delivery_Date, Shipping_Status) VALUES
(1,  '2024-01-11', '2024-01-14', 'Delivered'),
(2,  '2024-01-16', '2024-01-19', 'Delivered'),
(3,  '2024-02-02', '2024-02-06', 'In Transit'),
(4,  '2024-02-11', NULL,         'Pending'),
(5,  '2024-02-21', '2024-02-25', 'Delivered'),
(6,  '2024-03-02', NULL,         'Canceled'),
(7,  '2024-03-11', '2024-03-14', 'Delivered'),
(8,  '2024-03-21', '2024-03-25', 'Delivered'),
(9,  '2024-04-02', NULL,         'Pending'),
(10, '2024-04-11', '2024-04-14', 'Delivered'),
(11, '2024-04-16', '2024-04-19', 'Delivered'),
(12, '2024-05-02', '2024-05-06', 'In Transit'),
(13, '2024-05-11', '2024-05-14', 'Delivered'),
(14, '2024-05-21', '2024-05-25', 'Delivered'),
(15, '2024-06-02', NULL,         'Canceled'),
(16, '2024-06-11', '2024-06-15', 'Delivered'),
(17, '2024-06-21', NULL,         'Pending'),
(18, '2024-07-02', '2024-07-06', 'Delivered'),
(19, '2024-07-11', '2024-07-15', 'Delivered'),
(20, '2024-07-21', '2024-07-24', 'Delivered');


-- Tasks and Functionalities:

-- 1. Implement CRUD Operations

-- Insert a new product, customer, order into the database.
INSERT INTO Product (Name, Category_id, Price, Stock_Quantity, Added_Date) VALUES
('Tablet', 1, 25000.00, 40, '2024-08-01');            -- FIX: Correct table name & added Category_id

INSERT INTO Customer (Name, Email, Phone_Number, Address, Registration_Date) VALUES
('Alice Brown', 'alice.brown@example.com', '9000011112', '321 Elm St', '2024-08-01');

INSERT INTO Orders (Customer_id, Order_Date, Total_Amount, Status) VALUES
(1, '2024-08-01', 25000.00, 'Pending');

-- Update the stock quantity when an order is placed.
UPDATE Product SET Stock_Quantity = Stock_Quantity - 1 WHERE ProductID = 1;

-- Delete orders that were canceled more than 30 days ago.
DELETE FROM Orders WHERE Status = 'Canceled' AND Order_Date < DATE_SUB(CURDATE(), INTERVAL 30 DAY);


-- 2. Use SQL Clauses (HAVING, WHERE, LIMIT)

-- Find all orders placed in last 6 months.
SELECT * FROM Orders WHERE Order_Date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

-- Get the top 5 highest-priced products.
SELECT * FROM Product ORDER BY Price DESC LIMIT 5;

-- Find customers who have placed more than 3 orders.
SELECT Customer_id, COUNT(Order_id) AS Order_Count FROM Orders GROUP BY Customer_id HAVING Order_Count > 3;


-- 3. Apply SQL Operations (AND, OR, NOT)

-- Get all orders where status is Pending and payment status is Paid.   -- FIX: join Payment table
SELECT o.* FROM Orders o
JOIN Payment p ON o.Order_id = p.Order_id
WHERE o.Status = 'Pending' AND p.Payment_Status = 'Paid';

-- Find all products that are NOT out of stock.
SELECT * FROM Product WHERE Stock_Quantity > 0;

-- Retrieve customers who registered after 2022 or made a purchase > 10000.
SELECT * FROM Customer WHERE Registration_Date > '2022-01-01'
OR Customer_id IN (SELECT Customer_id FROM Orders WHERE Total_Amount > 10000);


-- 4. Sorting and Grouping (ORDER BY, GROUP BY)

-- List all products sorted by price in descending order.
SELECT * FROM Product ORDER BY Price DESC;                -- FIX: Removed extra closing parenthesis

-- Display the number of orders placed by each customer.
SELECT Customer_id, COUNT(Order_id) AS Order_Count FROM Orders GROUP BY Customer_id;


-- 5. Use Aggregate Functions (COUNT, SUM, AVG...)

-- Find the total revenue generated by the store.
SELECT SUM(Total_Amount) AS Total_Revenue FROM Orders;

-- Identify the most purchased product.
SELECT Product_id, SUM(Quantity) AS Total_Quantity FROM Order_Items
GROUP BY Product_id ORDER BY Total_Quantity DESC LIMIT 1;

-- Calculate the average order value.
SELECT AVG(Total_Amount) AS Average_Order_Value FROM Orders;


-- 6. Establish Primary and Foreign Key Relationships

-- Ensure orders are linked to customers.
ALTER TABLE Orders
ADD CONSTRAINT fk_customer
FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id);

-- Establish a relationship between payments and orders.
ALTER TABLE Payment
ADD CONSTRAINT fk_order_payment
FOREIGN KEY (Order_id) REFERENCES Orders(Order_id);


-- 7. Joins

-- Retrieve a list of products along with their category names using INNER JOIN.
SELECT p.Name, c.Category_name FROM Product p
INNER JOIN Category c ON p.Category_id = c.Category_id;

-- Get all orders with customer details using LEFT JOIN.
SELECT o.Order_id, o.Order_Date, c.Name, c.Email FROM Orders o
LEFT JOIN Customer c ON o.Customer_id = c.Customer_id;

-- Find orders that haven't been shipped using RIGHT JOIN.
SELECT o.Order_id, s.Shipping_Status FROM Orders o
RIGHT JOIN Shipping s ON o.Order_id = s.Order_id
WHERE s.Shipping_Status IS NULL;

-- Show customers who have never placed an order (FULL OUTER JOIN via UNION).  -- FIX: MySQL doesn't support FULL OUTER JOIN
SELECT c.Name, o.Order_id FROM Customer c
LEFT JOIN Orders o ON c.Customer_id = o.Customer_id
WHERE o.Order_id IS NULL
UNION
SELECT c.Name, o.Order_id FROM Customer c
RIGHT JOIN Orders o ON c.Customer_id = o.Customer_id
WHERE c.Customer_id IS NULL;


-- 8. Use Subqueries

-- Find orders placed by customers who registered after 2022.
SELECT * FROM Orders WHERE Customer_id IN (
    SELECT Customer_id FROM Customer WHERE Registration_Date > '2022-01-01'
);

-- Identify customers who have spent the most.
SELECT Customer_id, SUM(Total_Amount) AS Total_Spent FROM Orders
GROUP BY Customer_id ORDER BY Total_Spent DESC LIMIT 1;

-- Get products that have never been ordered.
SELECT * FROM Product WHERE ProductID NOT IN (SELECT Product_id FROM Order_Items);


-- 9. Date and Time Functions

-- Extract the month from Order_Date to count orders per month.
SELECT MONTH(Order_Date) AS Order_Month, COUNT(Order_id) AS Order_Count
FROM Orders GROUP BY Order_Month;

-- Calculate delivery time by finding the difference between Shipping_Date and Delivery_Date.   -- FIX: Corrected spelling "Delhivery"
SELECT Order_id, DATEDIFF(Delivery_Date, Shipping_Date) AS Delivery_Time FROM Shipping;

-- Format Order_Date as DD-MM-YYYY.
SELECT Order_id, DATE_FORMAT(Order_Date, '%d-%m-%Y') AS Formatted_Order_Date FROM Orders;


-- 10. String Functions

-- Convert all product names to uppercase.
SELECT Name, UPPER(Name) AS Uppercase_Name FROM Product;

-- Trim whitespace from customer names.
SELECT Name, TRIM(Name) AS Trimmed_Name FROM Customer;

-- Replace missing email values with 'No Email Provided'.
SELECT Name, IFNULL(Email, 'No Email Provided') AS Email FROM Customer;


-- 11. Implement Window Functions

-- Rank customers based on total spending.
SELECT Customer_id, SUM(Total_Amount) AS Total_Spent,
RANK() OVER (ORDER BY SUM(Total_Amount) DESC) AS Spending_Rank
FROM Orders GROUP BY Customer_id;

-- Show the cumulative total revenue per month.
SELECT MONTH(Order_Date) AS Order_Month,
SUM(Total_Amount) AS Monthly_Revenue,
SUM(SUM(Total_Amount)) OVER (ORDER BY MONTH(Order_Date)) AS Cumulative_Revenue
FROM Orders GROUP BY Order_Month;

-- Display the running total of orders placed.
SELECT Order_Date, COUNT(Order_id) AS Daily_Orders,
SUM(COUNT(Order_id)) OVER (ORDER BY Order_Date) AS Running_Total_Orders
FROM Orders GROUP BY Order_Date;


-- 12. SQL CASE Statements

-- Assign a loyalty_status to customers:
-- if total spending > 50000 then 'Gold'
-- if total spending between 20000 and 50000 then 'Silver'
-- else 'Bronze'
SELECT Customer_id, SUM(Total_Amount) AS Total_Spent,
CASE
    WHEN SUM(Total_Amount) > 50000  THEN 'Gold'
    WHEN SUM(Total_Amount) BETWEEN 20000 AND 50000 THEN 'Silver'
    ELSE 'Bronze'
END AS Loyalty_Status
FROM Orders GROUP BY Customer_id;

-- Categorize products:
-- if sold quantity > 500 then 'Best Seller'
-- if sold quantity between 200 and 500 then 'Popular'
-- else 'Regular'
SELECT Product_id, SUM(Quantity) AS Total_Sold,
CASE
    WHEN SUM(Quantity) > 500 THEN 'Best Seller'
    WHEN SUM(Quantity) BETWEEN 200 AND 500 THEN 'Popular'
    ELSE 'Regular'
END AS Product_Category
FROM Order_Items GROUP BY Product_id;

-- End.