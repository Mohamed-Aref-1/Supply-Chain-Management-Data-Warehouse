CREATE TABLE Shipments (
    ShipmentID INT PRIMARY KEY,
    ProductID INT,
    SupplierID INT,
    WarehouseID INT,
    OrderID INT,
    TimeID INT,
    Quantity INT,
    ShipmentDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(WarehouseID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (TimeID) REFERENCES Time(TimeID)
);


--
INSERT INTO Products (ProductID, ProductName, Category, Price) VALUES
(1, 'Product A', 'Category 1', 10.00),
(2, 'Product B', 'Category 2', 20.00);

INSERT INTO Suppliers (SupplierID, SupplierName, ContactName, ContactEmail) VALUES
(1, 'Supplier A', 'Contact A', 'contactA@supplier.com'),
(2, 'Supplier B', 'Contact B', 'contactB@supplier.com');

INSERT INTO Warehouses (WarehouseID, WarehouseName, Location) VALUES
(1, 'Warehouse A', 'Location A'),
(2, 'Warehouse B', 'Location B');

INSERT INTO Orders (OrderID, OrderDate, CustomerID) VALUES
(1, '2024-01-01', 101),
(2, '2024-02-01', 102);

INSERT INTO Time (TimeID, Date, Year, Quarter, Month, Day) VALUES
(1, '2024-01-01', 2024, 1, 1, 1),
(2, '2024-02-01', 2024, 1, 2, 1);

-- Insert Sample Data into Fact Table
INSERT INTO Shipments (ShipmentID, ProductID, SupplierID, WarehouseID, OrderID, TimeID, Quantity, ShipmentDate) VALUES
(1, 1, 1, 1, 1, 1, 100, '2024-01-01'),
(2, 2, 2, 2, 2, 2, 200, '2024-02-01');


--
-- Insert additional sample data into Products
INSERT INTO Products (ProductID, ProductName, Category, Price) VALUES
(3, 'Product C', 'Category 1', 15.00),
(4, 'Product D', 'Category 3', 25.00),
(5, 'Product E', 'Category 2', 30.00),
(6, 'Product F', 'Category 4', 35.00),
(7, 'Product G', 'Category 1', 40.00),
(8, 'Product H', 'Category 3', 45.00),
(9, 'Product I', 'Category 2', 50.00),
(10, 'Product J', 'Category 4', 55.00);

-- Insert additional sample data into Suppliers
INSERT INTO Suppliers (SupplierID, SupplierName, ContactName, ContactEmail) VALUES
(3, 'Supplier C', 'Contact C', 'contactC@supplier.com'),
(4, 'Supplier D', 'Contact D', 'contactD@supplier.com'),
(5, 'Supplier E', 'Contact E', 'contactE@supplier.com'),
(6, 'Supplier F', 'Contact F', 'contactF@supplier.com'),
(7, 'Supplier G', 'Contact G', 'contactG@supplier.com'),
(8, 'Supplier H', 'Contact H', 'contactH@supplier.com'),
(9, 'Supplier I', 'Contact I', 'contactI@supplier.com'),
(10, 'Supplier J', 'Contact J', 'contactJ@supplier.com');

-- Insert additional sample data into Warehouses
INSERT INTO Warehouses (WarehouseID, WarehouseName, Location) VALUES
(3, 'Warehouse C', 'Location C'),
(4, 'Warehouse D', 'Location D'),
(5, 'Warehouse E', 'Location E'),
(6, 'Warehouse F', 'Location F'),
(7, 'Warehouse G', 'Location G'),
(8, 'Warehouse H', 'Location H'),
(9, 'Warehouse I', 'Location I'),
(10, 'Warehouse J', 'Location J');

-- Insert additional sample data into Orders
INSERT INTO Orders (OrderID, OrderDate, CustomerID) VALUES
(3, '2024-03-01', 103),
(4, '2024-04-01', 104),
(5, '2024-05-01', 105),
(6, '2024-06-01', 106),
(7, '2024-07-01', 107),
(8, '2024-08-01', 108),
(9, '2024-09-01', 109),
(10, '2024-10-01', 110);

-- Insert additional sample data into Time
INSERT INTO Time (TimeID, Date, Year, Quarter, Month, Day) VALUES
(3, '2024-03-01', 2024, 1, 3, 1),
(4, '2024-04-01', 2024, 2, 4, 1),
(5, '2024-05-01', 2024, 2, 5, 1),
(6, '2024-06-01', 2024, 2, 6, 1),
(7, '2024-07-01', 2024, 3, 7, 1),
(8, '2024-08-01', 2024, 3, 8, 1),
(9, '2024-09-01', 2024, 3, 9, 1),
(10, '2024-10-01', 2024, 4, 10, 1);

-- Insert additional sample data into Fact Table (Shipments)
INSERT INTO Shipments (ShipmentID, ProductID, SupplierID, WarehouseID, OrderID, TimeID, Quantity, ShipmentDate) VALUES
(3, 3, 3, 3, 3, 3, 150, '2024-03-01'),
(4, 4, 4, 4, 4, 4, 250, '2024-04-01'),
(5, 5, 5, 5, 5, 5, 350, '2024-05-01'),
(6, 6, 6, 6, 6, 6, 450, '2024-06-01'),
(7, 7, 7, 7, 7, 7, 550, '2024-07-01'),
(8, 8, 8, 8, 8, 8, 650, '2024-08-01'),
(9, 9, 9, 9, 9, 9, 750, '2024-09-01'),
(10, 10, 10, 10, 10, 10, 850, '2024-10-01');

/*•	Write a query to find the total quantity shipped for each product category.*/
/*✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔*/
select * from products 
order by Category
select * from Shipments
-- test 
select p.category , sum(s.quantity)
from Shipments s inner join products p
on s.ProductID = p.ProductID
group by p.category


/*•	Identify warehouses with the most efficient shipping processes based on average shipping times.*/
/*✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔*/
select * from Warehouses
select * from Shipments
select * from time
ALTER TABLE Shipments ADD ShippingTime INT;
UPDATE Shipments
SET ShippingTime = DATEDIFF(day, o.OrderDate, s.ShipmentDate)
FROM Shipments s
JOIN Orders o ON s.OrderID = o.OrderID;

SELECT
    w.WarehouseID,
    w.WarehouseName,
    AVG(s.ShippingTime) AS AvgShippingTime
FROM
    Shipments s
JOIN
    Warehouses w ON s.WarehouseID = w.WarehouseID
GROUP BY
    w.WarehouseID, w.WarehouseName
ORDER BY
    AvgShippingTime ASC;
------------------------------
-- • Calculate the total value of shipments for each supplier.
/*✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔*/
select * from Shipments
select * from Suppliers
select * from products
select s.SupplierName , sum(p.Price * sh.Quantity) as 'Value' from Suppliers s
inner join Shipments sh
on sh.SupplierID =  s.SupplierID
inner join 
products p
on p.ProductID = sh.ProductID 
group by s.SupplierName
order by Value desc 


--•	Retrieve the top 5 products with the highest total shipment quantities.
/*✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔*/
WITH ProductShipmentQuantities AS (
    SELECT
        p.ProductID,
        p.ProductName,
        SUM(s.Quantity) AS TotalQuantity
    FROM
        Shipments s
    JOIN
        Products p ON s.ProductID = p.ProductID
    GROUP BY
        p.ProductID, p.ProductName
),
RankedProducts AS (
    SELECT
        psq.ProductID,
        psq.ProductName,
        psq.TotalQuantity,
        ROW_NUMBER() OVER (ORDER BY psq.TotalQuantity DESC) AS Ranking
    FROM
        ProductShipmentQuantities psq
)
SELECT
    rp.ProductID,
    rp.ProductName,
    rp.TotalQuantity
FROM
    RankedProducts rp
WHERE
    rp.Ranking <= 5
ORDER BY
    rp.Ranking;


/*	Create a report that shows the distribution of shipment values for each product category.*/
SELECT
			p.Category,
			sum(s.Quantity * p.Price) AS TotalShipmentValue,
			count(s.ShipmentID) AS NumberOfShipments,
			avg(s.Quantity * p.Price) AS AverageShipmentValue,
			min(s.Quantity * p.Price) AS MinShipmentValue,
			max(s.Quantity * p.Price) AS MaxShipmentValue
from
    Shipments s
JOIN
    Products p ON s.ProductID = p.ProductID
group BY
    p.Category
order BY
    p.Category;


/*
•	Implement a stored procedure to update shipment records, 
allowing adjustments based on factors like shipping delays.*/
/*✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔*/

-- def the proc 
CREATE PROCEDURE UpdateShipmentRecord
    @ShipmentID INT,
    @NewShipmentDate DATE,
    @NewQuantity INT = NULL,
    @NewSupplierID INT = NULL
AS
BEGIN
    -- Update the ShipmentDate
    UPDATE Shipments
    SET
        ShipmentDate = @NewShipmentDate,
        Quantity = ISNULL(@NewQuantity, Quantity),    
        SupplierID = ISNULL(@NewSupplierID, SupplierID)
    WHERE
        ShipmentID = @ShipmentID;

    -- if the recored does not exist
    IF @@ROWCOUNT = 0
    BEGIN
        RAISERROR ('Shipment with ID %d does not exist.', 16, 1, @ShipmentID);
    END
END;

-- test 
EXEC UpdateShipmentRecord
    @ShipmentID = 1,
    @NewShipmentDate = '2024-07-5',
    @NewQuantity = 150,
    @NewSupplierID = 3;

select * from Shipments

/*•	Design a view that provides a consolidated summary of shipment and product performance, 
including total quantities, average shipping times, and shipment patterns.*/
/*✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔*/

select * from Shipments
select * from Orders
alter VIEW ShipmentProductSummary AS
WITH ShipmentDetailsCTE AS (
    SELECT
        s.ShipmentID,
        s.ProductID,
        p.ProductName,
        p.Category,
        s.Quantity,
        s.ShipmentDate,
        o.OrderDate,
        DATEDIFF(day, o.OrderDate, s.ShipmentDate) AS ShippingTime
    FROM
        Shipments s
    JOIN
        Products p ON s.ProductID = p.ProductID
    JOIN
        Orders o ON s.OrderID = o.OrderID
),
Summary AS (
    SELECT
        ProductID,
        ProductName,
        Category,
        SUM(Quantity) AS TotalQuantity,
        AVG(ShippingTime) AS AvgShippingTime,
        COUNT(SHIPMENTID) AS NumberOfShipments,
        MIN(ShippingTime) AS MinShippingTime,
        MAX(ShippingTime) AS MaxShippingTime
    FROM
        ShipmentDetailsCTE
    GROUP BY
        ProductID, ProductName, Category
)
SELECT
    ProductID,
    ProductName,
    Category,
    TotalQuantity,
    AvgShippingTime,
    NumberOfShipments,
    MinShippingTime, 
	MaxShippingTime
FROM
    Summary;

-- test 
SELECT * FROM ShipmentProductSummary;
select * from time 


/*•	Identify suppliers with a significant increase 
or decrease in shipment values compared to the previous year.*/
/*✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ */
-- Insert sample data for the year 2023
INSERT INTO Shipments (ShipmentID, ProductID, SupplierID, WarehouseID, OrderID, TimeID, Quantity, ShipmentDate) VALUES
(11, 1, 1, 1, 1, 1, 100, '2023-01-01'),
(12, 2, 2, 2, 2, 2, 200, '2023-02-01'),
(13, 3, 3, 3, 3, 3, 300, '2023-03-01'),
(14, 4, 4, 4, 4, 4, 400, '2023-04-01'),
(15, 5, 5, 5, 5, 5, 500, '2023-05-01'),
(16, 6, 6, 6, 6, 6, 600, '2023-06-01'),
(17, 7, 7, 7, 7, 7, 700, '2023-07-01'),
(18, 8, 8, 8, 8, 8, 800, '2023-08-01'),
(19, 9, 9, 9, 9, 9, 900, '2023-09-01'),
(20, 10, 10, 10, 10, 10, 1000, '2023-10-01');
---------------
select * from Suppliers
select * from Shipments 

Alter VIEW SupplierShipmentChange AS
WITH ShipmentYearlyValues AS (
SELECT
    s.SupplierID,
    su.SupplierName,
    YEAR(s.ShipmentDate) AS ShipmentYear,
    SUM(s.Quantity * p.Price) AS TotalShipmentValue,
    LAG(SUM(s.Quantity * p.Price)) OVER (PARTITION BY s.SupplierID ORDER BY YEAR(s.ShipmentDate)) AS PreviousYearTotalShipmentValue,
    (SUM(s.Quantity * p.Price) - LAG(SUM(s.Quantity * p.Price)) OVER (PARTITION BY s.SupplierID ORDER BY YEAR(s.ShipmentDate))) AS Difference
FROM
    Shipments s
JOIN
    Products p ON s.ProductID = p.ProductID
JOIN
    Suppliers su ON s.SupplierID = su.SupplierID
GROUP BY
    s.SupplierID, su.SupplierName, YEAR(s.ShipmentDate)
HAVING
    ShipmentYear = 2024
ORDER BY
    s.SupplierID, ShipmentYear;

	/*
),
ShipmentChange AS (
    SELECT
        syv.SupplierID,
        syv.SupplierName,
        syv.ShipmentYear,
        syv.TotalShipmentValue,
        LAG(syv.TotalShipmentValue, 1) OVER (PARTITION BY syv.SupplierID ORDER BY syv.ShipmentYear) AS PreviousYearShipmentValue,
        CASE
            WHEN LAG(syv.TotalShipmentValue, 1) OVER (PARTITION BY syv.SupplierID ORDER BY syv.ShipmentYear) IS NOT NULL THEN
                (syv.TotalShipmentValue - LAG(syv.TotalShipmentValue, 1) OVER (PARTITION BY syv.SupplierID ORDER BY syv.ShipmentYear))
            ELSE
                NULL
        END AS ValueChange,
        CASE
            WHEN LAG(syv.TotalShipmentValue, 1) OVER (PARTITION BY syv.SupplierID ORDER BY syv.ShipmentYear) IS NOT NULL THEN
                ((syv.TotalShipmentValue - LAG(syv.TotalShipmentValue, 1) OVER (PARTITION BY syv.SupplierID ORDER BY syv.ShipmentYear)) / LAG(syv.TotalShipmentValue, 1) OVER (PARTITION BY syv.SupplierID ORDER BY syv.ShipmentYear)) * 100
            ELSE
                NULL
        END AS PercentageChange
    FROM
        ShipmentYearlyValues syv
)
SELECT
    SupplierID,
    SupplierName,
    ShipmentYear,
    TotalShipmentValue,
    PreviousYearShipmentValue,
    ValueChange,
    PercentageChange
FROM
    ShipmentChange;

select * from SupplierShipmentChange



*/
WITH ShipmentSummary AS (
    SELECT
        s.SupplierID,
        su.SupplierName,
        YEAR(s.ShipmentDate) AS ShipmentYear,
        SUM(s.Quantity * p.Price) AS TotalShipmentValue,
        LAG(SUM(s.Quantity * p.Price)) OVER (PARTITION BY s.SupplierID ORDER BY YEAR(s.ShipmentDate)) AS PreviousYearTotalShipmentValue
    FROM
        Shipments s
    JOIN
        Products p ON s.ProductID = p.ProductID
    JOIN
        Suppliers su ON s.SupplierID = su.SupplierID
    GROUP BY
        s.SupplierID, su.SupplierName, YEAR(s.ShipmentDate)
)
SELECT
    SupplierID,
    SupplierName,
    ShipmentYear,
    TotalShipmentValue,
    PreviousYearTotalShipmentValue,
    (TotalShipmentValue - PreviousYearTotalShipmentValue) AS Difference
FROM
    ShipmentSummary
WHERE
    ShipmentYear = 2024
ORDER BY
    SupplierID, ShipmentYear,Difference ;



/*•	Implement a trigger that automatically updates a historical tracking table 
whenever a shipment record is modified or deleted.*/   
/*✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ ✔ */

select * from Shipments
CREATE TABLE Audit_table_On_shipment 
(
    shipmentID  int,
    UserName  varchar(50),
    ModifiedDate  date,
    Quantity_Old  int,
    Quantity_New  int
);
-- the trigger 
create trigger t1
on Shipments 
instead of update 
as 
	if update(Quantity)
	begin 
	declare @new_Quantity int , @old_Quantity int , @shipmentID int
	select @old_Quantity = Quantity from deleted 
	select @new_Quantity = Quantity from inserted  
	select @shipmentID = shipmentID from deleted 
	insert into Audit_table_On_shipment
	values(@shipmentID ,SUSER_NAME(), GETDATE(),  @old_Quantity, @new_Quantity);
	end 

-- test 
