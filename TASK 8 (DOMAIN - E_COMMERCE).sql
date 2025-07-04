USE internship_task

CREATE TABLE E_COMMERCE_TASK_8 (
   Product_ID INT PRIMARY KEY AUTO_INCREMENT,
   Product_Name VARCHAR(100),
   Category VARCHAR(100),
   Price DECIMAL(10,2),
   Stock INT,
   Description TEXT,
   Added_date DATE,
   is_available BOOLEAN DEFAULT TRUE,
   Supplier_Name Varchar(100)
)

INSERT INTO e_commerce_task_8 (Product_Name, Category, Price, Stock, Description, Added_date, is_available, Supplier_Name)
VALUES 
('Wireless Mouse', 'Electronics', 599.00, 40, 'Smooth performance with USB receiver.', '2025-01-10', TRUE, 'TechZone Pvt Ltd'),

('Cotton T-Shirt', 'Apparel', 399.00, 100, '100% cotton, available in 5 colors.', '2025-02-05', TRUE, 'ClothMart'),

('Electric Kettle', 'Home Appliances', 1299.00, 15, '1.5L, auto shut-off feature.', '2025-01-20', TRUE, 'KitchenWorld'),

('Bluetooth Speaker', 'Electronics', 1799.00, 0, NULL, '2025-02-18', FALSE, 'SoundMaster'),

('Yoga Mat', 'Fitness', 749.00, 25, 'Anti-slip surface with extra padding.', '2025-01-30', TRUE, NULL),

('Office Chair', 'Furniture', 4999.00, 5, 'Ergonomic chair with lumbar support.', '2024-12-15', TRUE, 'ErgoFurniture Ltd'),

('Mobile Charger', 'Accessories', 299.00, 50, NULL, '2025-03-05', TRUE, 'ChargeIT'),

('Laptop Stand', 'Accessories', 999.00, 20, 'Aluminium body, foldable design.', '2025-02-25', TRUE, 'ProGear'),

('Notebook Set', 'Stationery', 199.00, 200, 'Pack of 5 notebooks, A5 size.', '2025-01-05', TRUE, 'PaperPlus'),

('LED Table Lamp', 'Home Decor', 1599.00, 10, 'Touch sensor with 3 brightness levels.', '2024-11-28', TRUE, 'LightHouse Pvt Ltd');

ALTER TABLE e_commerce_task_8
CHANGE Stock Quantity INT;

-- Use CREATE PROCEDURE Use parameters and conditional logic

DELIMITER //

CREATE PROCEDURE Insert_Product_Details(
   IN pname VARCHAR(100),
   IN category VARCHAR(100),
   IN price DECIMAL(10,2),
   IN qty INT,
   IN description TEXT,
   IN addedDate DATE,
   IN available BOOLEAN,
   IN supplier Varchar(100)
)

BEGIN
   INSERT INTO e_commerce_task_8 (Product_Name, Category, Price, Quantity, Description, Added_date, is_available, Supplier_Name)
   VALUES (pname, category, price, qty, description, addedDate, available, supplier);
END //

DELIMITER ;

DROP PROCEDURE Insert_Product_Details -- I DROP the PROCEDURE because i give wrong column name in the PROCEDURE and i make new PROCEDURE and use previous procedure name with the right column name 

Call Insert_Product_Details ('Power Bank', 'Electronics', 1499.00, 30, '10000mAh with fast charging', '2025-07-05', TRUE, 'BatteryHouse');

Call Insert_Product_Details ('Redtape Sneaker', 'FootWear', 9999.00, 30, 'Comfortable', '2025-07-05', TRUE, 'Redtape');

SELECT * FROM e_commerce_task_8

-- CREATE FUNCTION

DELIMITER //

CREATE FUNCTION Total_Stock_Value(Price DECIMAL(10,2), Quantity INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
   RETURN Price * Quantity;
END //

DELIMITER ;

SELECT Product_Name, Total_Stock_Value(Price, Quantity) AS Total_Value
FROM e_commerce_task_8;

SELECT Product_Name, Category, Total_Stock_Value(Price, Quantity) AS Total_Value
FROM e_commerce_task_8
WHERE Category = 'Accessories';





