-- question 1
SELECT 101 AS OrderID, "John Doe" AS CustomerName, "Laptop" AS Product
UNION ALL
SELECT 101, "John Doe", "Mouse"
UNION ALL
SELECT 102, "Jane Smith", "Tablet"
UNION ALL
SELECT 102, "Jane Smith", "Keyboard"
UNION ALL
SELECT 102, "Jane Smith", "Mouse"
UNION ALL
SELECT 103, "Emily Clark", "Phone";


-- qustion 2
CREATE TABLE OrderDetails (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    Quantity INT
);

INSERT INTO OrderDetails (OrderID, CustomerName, Product, Quantity) VALUES
(101, "John Doe", "Laptop", 2),
(101, "John Doe", "Mouse", 1),
(102, "Jane Smith", "Tablet", 3),
(102, "Jane Smith", "Keyboard", 1),
(102, "Jane Smith", "Mouse", 2),
(103, "Emily Clark", "Phone", 1);

CREATE TABLE orders (
OrderID INT PRIMARY KEY NOT NULL,
CustomerName VARCHAR (50) NOT NULL);
INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
INSERT INTO OrderItems (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;