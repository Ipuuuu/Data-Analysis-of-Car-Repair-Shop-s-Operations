SHOW DATABASES;
USE `DA-Immaculata Umoh`;
show tables;
-- Dimension Tables

CREATE TABLE DimCustomer (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(255),
    PhoneNumber VARCHAR(20)
);

CREATE TABLE DimVehicle (
    VehicleID INT AUTO_INCREMENT PRIMARY KEY,
    Make VARCHAR(50),
    Model VARCHAR(50),
    Year INT,
    VIN VARCHAR(50) UNIQUE,
    RegistrationNumber VARCHAR(20),
    Mileage INT
);

CREATE TABLE DimLocation (
    LocationID INT AUTO_INCREMENT PRIMARY KEY,
    LocationName VARCHAR(100),
    Address VARCHAR(255)
);

CREATE TABLE DimDate (
    DateID INT AUTO_INCREMENT PRIMARY KEY,
    Date DATE,
    Month INT,
    Year INT
);

CREATE TABLE DimService (
    ServiceID INT AUTO_INCREMENT PRIMARY KEY,
    Description VARCHAR(100),
    Rate DECIMAL(10, 2)
);

CREATE TABLE DimPart (
    PartID INT AUTO_INCREMENT PRIMARY KEY,
    PartNumber VARCHAR(50),
    PartName VARCHAR(100),
    UnitPrice DECIMAL(10, 2)
);

-- Fact Tables

CREATE TABLE Sales (
    SalesID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    VehicleID INT,
    LocationID INT,
    DateID INT,
    TotalLabor DECIMAL(10, 2),
    TotalParts DECIMAL(10, 2),
    SalesTax DECIMAL(10, 2),
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES DimCustomer(CustomerID),
    FOREIGN KEY (VehicleID) REFERENCES DimVehicle(VehicleID),
    FOREIGN KEY (LocationID) REFERENCES DimLocation(LocationID),
    FOREIGN KEY (DateID) REFERENCES DimDate(DateID)
);

CREATE TABLE FactServiceDetail (
    ServiceDetailID INT AUTO_INCREMENT PRIMARY KEY,
    SalesID INT,
    ServiceID INT,
    Hours DECIMAL(5, 2),
    Amount DECIMAL(10, 2),
    FOREIGN KEY (SalesID) REFERENCES Sales(SalesID),
    FOREIGN KEY (ServiceID) REFERENCES DimService(ServiceID)
);

CREATE TABLE FactPartDetail (
    PartDetailID INT AUTO_INCREMENT PRIMARY KEY,
    SalesID INT,
    PartID INT,
    Quantity INT,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (SalesID) REFERENCES Sales(SalesID),
    FOREIGN KEY (PartID) REFERENCES DimPart(PartID)
);
