-- Query to import cleaned and formatted files into database

-- SHOW VARIABLES LIKE 'secure_file_priv';
-- SHOW GLOBAL VARIABLES LIKE 'local_infile';


-- LOAD DATA INFILE 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\customer.csv'
-- INTO TABLE DimCustomer
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS
-- (CustomerID, Name, Address, PhoneNumber);

-- LOAD DATA INFILE 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\vehicle.csv'
-- INTO TABLE DimVehicle
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS
-- (VehicleID, Make, Model, Year, VIN, RegistrationNumber, Mileage);

-- LOAD DATA INFILE 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\location.csv'
-- INTO TABLE DimLocation
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS
-- (LocationID, LocationName, Address);

-- LOAD DATA INFILE 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\Date.csv'
-- INTO TABLE DimDate
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS
-- (DateID, Date, Month, Year);

-- LOAD DATA INFILE 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\Service.csv'
-- INTO TABLE DimService
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS
-- (ServiceID, Description, Rate);

-- LOAD DATA INFILE 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\parts.csv'
-- INTO TABLE DimPart
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS
-- (PartID, PartNumber, PartName, UnitPrice);

-- LOAD DATA INFILE 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\Sales.csv'
-- INTO TABLE Sales
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS
-- (SalesID, CustomerID, VehicleID, LocationID, DateID, TotalLabor, TotalParts, SalesTax, TotalAmount);

-- LOAD DATA INFILE 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\ServiceDetail.csv'
-- INTO TABLE FactServiceDetail
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS
-- (ServiceDetailID, SalesID, ServiceID, Hours, Amount);

-- LOAD DATA INFILE 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\PartDetail.csv'
-- INTO TABLE FactPartDetail
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS
-- (PartDetailID, SalesID, PartID, Quantity, Amount);



-- Inserting cleaned and formatted data into database


INSERT INTO DimCustomer (Name, Address, PhoneNumber)
VALUES
('Jennifer Robinson', '126 Nairn Ave, Winnipeg, MB, R3J 3C4', '204-771-0784'),
('Michael Smith', '250 Broadway, Winnipeg, MB, R3C 0R5', '204-555-1234'),
('Sarah Johnson', '789 Main St, Winnipeg, MB, R2W 3N2', '204-666-5678'),
('Emily Brown', '456 Elm St, Winnipeg, MB, R3M 2S5', '204-777-9101'),
('David Wilson', '123 Oak St, Winnipeg, MB, R2J 3C4', '204-888-1112');

INSERT INTO DimVehicle  (Make, Model, Year, VIN, RegistrationNumber, Mileage)
VALUES
('BMW', 'X5', 2012, 'CVS123456789123-115Z', 'BMW 123', 16495),
('Toyota', 'Corolla', 2015, 'TYS678901234567-876Z', 'TOY 456', 45000),
('Honda', 'Civic', 2018, 'HCS345678901234-123X', 'HON 789', 30000),
('Ford', 'Escape', 2020, 'FES234567890123-456Y', 'FOR 987', 15000),
('Chevrolet', 'Malibu', 2016,  'CMS456789012345-789Z', 'CHE 321', 60000);

INSERT INTO DimPart (PartNumber, PartName, UnitPrice)
VALUES
('23435', 'CV Axel', 876.87),
('7777', 'Shop Materials', 45),
('W187', 'Wheel Weights', 12),
('54321', 'Brake Pads', 200),
('67890', 'Battery', 120),
('11223', 'Tire Rotation Kit', 30),
('33445', 'Transmission Fluid', 100),
('99887', 'Air Filter', 25),
('77654', 'Coolant', 60),
('99876', 'Spark Plugs', 20);

INSERT INTO dimdate (Date, Month, Year)
VALUES
('2023-09-10', 9, 2023),
('2023-09-15', 9, 2023),
('2023-09-20', 9, 2023),
('2023-09-25', 9, 2023),
('2023-09-30', 9, 2023);

INSERT INTO dimlocation (LocationName, Address)
VALUES
('Latino Garage Winnipeg North', '111 McPhillps, Winnipeg, Manitoba, MB, R3J1X7');

INSERT INTO DimService (Description, Rate)
VALUES
('Diagnose front wheel vibration', 125),
('Replace front CV Axel', 125),
('Balance tires',125),
('Oil change', 75),
('Replace brake pads', 125),
('Replace battery', 100),
('Tire rotation', 50),
('Transmission check', 150),
('Replace air filter', 50),
('Coolant flush', 120),
('Replace spark plugs', 130);

INSERT INTO Sales (CustomerID, VehicleID, LocationID, DateID, TotalLabor, TotalParts, SalesTax, TotalAmount)
VALUES
(1, 1, 1, 1, 625, 970, 207.33, 1802.20),
(2, 2, 1, 2, 325, 250, 42.25, 617.25),
(3, 3, 1, 3, 200, 150, 26, 376),
(4, 4, 1, 4, 300, 325, 39, 664),
(5, 5, 1, 5, 440, 340, 57.2, 837.2);

INSERT INTO FactServiceDetail (ServiceID, SalesID, Hours, Amount)
VALUES
(1, 1, 0.5, 62.5),
(2, 1, 3.5, 437.5),
(3, 1, 1, 125),
(4, 2, 1, 75),
(5, 2, 2, 250),
(6, 3, 1.5, 150),
(7, 3, 1, 50),
(8, 4, 2, 300),
(9, 4, 0.5, 25),
(10, 5, 1.5, 180),
(11, 5, 2, 260);

INSERT INTO FactPartDetail (PartID, SalesID, Quantity, Amount)
VALUES
(1, 1, 1, 876.87),
(2, 1, 1, 45),
(3, 1, 4, 48),
(4, 2, 1, 200),
(5, 3, 1, 120),
(6, 3, 1, 30),
(7, 4, 1, 100),
(8, 4, 1, 25),
(9, 5, 1, 60),
(10, 5, 4, 80);


--CUSTOMER ANALYSIS
-- Top 5 customers who have spent the most on vehicle repairs and parts
SELECT c.Name, SUM(s.TotalAmount) as TotalSpent
FROM Sales s
JOIN DimCustomer c ON s.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.Name
ORDER BY TotalSpent DESC
LIMIT 5;

-- Average spending of customers on repairs and parts
SELECT AVG(TotalSpent) as AverageSpending
FROM (
    SELECT c.CustomerID, SUM(s.TotalAmount) as TotalSpent
    FROM Sales s
    JOIN DimCustomer c ON s.CustomerID = c.CustomerID
    GROUP BY c.CustomerID
) as CustomerSpending;

-- Frequency of customer visists
SELECT c.Name, COUNT(*) as VisitCount
FROM Sales s
JOIN DimCustomer c ON s.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.Name
ORDER BY VisitCount DESC;
 --enhanced query using date table for context
SELECT c.Name, COUNT(*) as VisitCount, MIN(d.Date) as FirstVisit, MAX(d.Date) as LastVisit
FROM Sales s
JOIN DimCustomer c ON s.CustomerID = c.CustomerID
JOIN DimDate d ON s.DateID = d.DateID
GROUP BY c.CustomerID, c.Name
ORDER BY VisitCount DESC;


--VEHICLE ANALYSIS
-- Average mileage of vehicles serviced
SELECT AVG(Mileage) as AverageMileage
FROM DimVehicle;

-- Most common vehicle makes and models brought in for service
SELECT Make, Model, COUNT(*) as ServiceCount
FROM DimVehicle
GROUP BY Make, Model
ORDER BY ServiceCount DESC
LIMIT 5;

-- Distribution of vehicle ages
SELECT 
    v.Make,
    YEAR(CURDATE()) - v.Year as VehicleAge,
    COUNT(*) as VehicleCount,
    AVG(s.TotalAmount) as AvgServiceCost
FROM DimVehicle v
JOIN Sales s ON v.VehicleID = s.VehicleID
GROUP BY v.Make, VehicleAge
ORDER BY VehicleAge;


--JOB PERFORMANCE ANALYSIS
-- Most common types of jobs and their frequency
SELECT Description, COUNT(*) as JobFrequency
FROM FactServiceDetail fsd
JOIN DimService ds ON fsd.ServiceID = ds.ServiceID
GROUP BY Description
ORDER BY JobFrequency DESC;

-- Total revenue from each type of job
SELECT Description, SUM(Amount) as TotalRevenue
FROM FactServiceDetail fsd
JOIN DimService ds ON fsd.ServiceID = ds.ServiceID
GROUP BY Description
ORDER BY TotalRevenue DESC;

-- Jobs with highest and lowest average costs
-- Highest Average Cost
(SELECT Description, AVG(Amount) as AvgCost
FROM FactServiceDetail fsd
JOIN DimService ds ON fsd.ServiceID = ds.ServiceID
GROUP BY Description
ORDER BY AvgCost DESC
LIMIT 1)

UNION ALL

-- Lowest Average Cost
(SELECT Description, AVG(Amount) as AvgCost
FROM FactServiceDetail fsd
JOIN DimService ds ON fsd.ServiceID = ds.ServiceID
GROUP BY Description
ORDER BY AvgCost ASC
LIMIT 1);



--PARTS USAGE ANALYSIS
-- Top 5 most frequently used parts
SELECT PartName, SUM(Quantity) as TotalUsage
FROM FactPartDetail fpd
JOIN DimPart dp ON fpd.PartID = dp.PartID
GROUP BY PartName
ORDER BY TotalUsage DESC
LIMIT 5;

-- Average cost of parts used in repairs
SELECT AVG(UnitPrice) as AvgPartCost
FROM DimPart;

-- Total revenue from parts sales
SELECT SUM(Amount) as TotalPartsRevenue
FROM FactPartDetail;


--FINANCIAL ANALYSIS
-- Monthly revenue from labor and parts
SELECT 
    CONCAT(dd.Year, '-', dd.Month) as YearMonth,
    SUM(s.TotalLabor) as LaborRevenue,
    SUM(s.TotalParts) as PartsRevenue
FROM Sales s
JOIN DimDate dd ON s.DateID = dd.DateID
GROUP BY dd.Year, dd.Month
ORDER BY dd.Year, dd.Month;

-- Overall profitability (Assuming some costs (e.g., 20% of labor costs and 30% of parts costs))
SELECT 
    SUM(s.TotalAmount) as TotalRevenue,
    SUM(s.TotalAmount- (s.TotalLabor * 0.2) - (s.TotalParts * 0.3)) as TotalCost, 
    SUM(s.TotalAmount) - SUM(s.TotalAmount - (s.TotalLabor * 0.2) - (s.TotalParts * 0.3)) as Profitability
FROM Sales s;

-- Impact of sales tax on total revenue
SELECT 
    SUM(TotalAmount) as TotalRevenue,
    SUM(SalesTax) as TotalSalesTax,
    (SUM(SalesTax) / SUM(TotalAmount)) * 100 as SalesTaxPercentage
FROM Sales;
