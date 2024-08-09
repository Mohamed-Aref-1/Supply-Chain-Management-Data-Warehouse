
/* Warehouses with the most efficient shipping processes based on average shipping times.*/
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
-- total value of shipments for each supplier.
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

/*plan to do a histogram or a bar graph for as a report */
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
