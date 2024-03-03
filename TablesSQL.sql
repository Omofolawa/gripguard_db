-- Create Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(255),
    CategoryID INT FOREIGN KEY REFERENCES Categories(CategoryID),
    Quantity INT,
    Cost DECIMAL(10, 2)
);

-- Create Categories table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255),
    Size NVARCHAR(50),
    Rating INT
);

-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(255),
    LastName NVARCHAR(255),
    Phone NVARCHAR(20),
    Email NVARCHAR(255),
    Address NVARCHAR(255)
);

-- Create Bookings table
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    BookingDate DATE
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    OrderDate DATE,
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    BookingID INT FOREIGN KEY REFERENCES Bookings(BookingID)
);

-- Create Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255),
    Role NVARCHAR(255),
    Pay DECIMAL(10, 2),
    Address NVARCHAR(255),
    Email NVARCHAR(255),
    Phone NVARCHAR(20)
);

-- Create Suppliers table
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY IDENTITY(1,1),
    SupplierName NVARCHAR(255),
    ContactPerson NVARCHAR(255),
    Phone NVARCHAR(20),
    Address NVARCHAR(255)
);

-- Create Inventory table
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    Quantity INT,
    Location NVARCHAR(255)
);

-- Create Sales table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    SaleDate DATE,
    TotalCost DECIMAL(10, 2)
);

-- Create Warranty table
CREATE TABLE Warranty (
    WarrantyID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    WarrantyPeriod INT,
    TermsConditions VARCHAR(255)
);

-- Create Reviews table
CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    Rating INT,
    ReviewText VARCHAR(255)
);