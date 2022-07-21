 CREATE TABLE Customer
(
	ID INT PRIMARY KEY,
	FirstName nvarchar(40) NOT NULL,
	LastName nvarchar(40),
	City nvarchar(40),
	Country nvarchar(40),
	Phone nvarchar(20),
	Fax nvarchar(40) DEFAULT NULL,
)

CREATE TABLE Orders
(
	ID INT PRIMARY KEY,
	OrderDate datetime NOT NULL,
	OrderNumber nvarchar(40),
	CustomerID INT,
	TotalAmount decimal(12,2),
	ShippedDate DATETIME NOT NULL,
	ShipName nvarchar(40),
	FOREIGN KEY(CustomerID) REFERENCES Customer(ID) ON DELETE CASCADE,
)

CREATE TABLE Supplier
(
	ID INT PRIMARY KEY NOT NULL,
	CompanyName nvarchar(40),
	ContactName nvarchar(40),
	City nvarchar(40),
	Country nvarchar(40),
	Phone nvarchar(40),
)

CREATE TABLE Product
(
	ID INT PRIMARY KEY,
	ProductName nvarchar(50),
	UnitPrice decimal(12,2),
	IsDiscontinued bit,
	SupplierID INT,
	UnitsInStock INT,
	UnitsOnOrder INT,
	FOREIGN KEY(SupplierID) REFERENCES Supplier(ID) ON DELETE CASCADE,
)

CREATE TABLE OrderItem
(
	ID INT PRIMARY KEY,
	OrderID INT,
	ProductID INT,
	UnitPrice decimal(12,2),
	Quantity INT,
	FOREIGN KEY (OrderID) REFERENCES Orders (ID) ON DELETE CASCADE,
	FOREIGN KEY (ProductID) REFERENCES Product (ID) ON DELETE CASCADE,
)



INSERT INTO Customer 
VALUES (1,'Rohit','Sharma','Nagpur','India','12345678',NULL),
      (2,'virat','kohli','Delhi','India','234567896','(313) 555-3349'),
      (3,'steve','Smith','Melbourne','Australia','679867897',NULL),
      (4,'david','miller','capetown','SouthAfrica','67675689',NULL),
      (5,'Ishan','Sharma','Delhi','India','0300074321','(08) 423-3439');
	  

	  INSERT INTO Orders
VALUES(101,'2022-03-04 12:15:30','11',4,1800.50,'2020-03-07 12:20:30','Merchant Shipping'),
      (102,'2022-02-12 12:16:31','02',2,2060.50,'2022-03-02 12:45:00','Lacorne d"abondance'),
      (103,'2022-07-11 12:17:32','09',4,2499.50,'2019-07-12 11:00:00','Global e-trender'),
      (104,'2022-07-07 12:18:33','14',3,1499.00,'2022-07-10 10:20:30','LTL & International'),
      (105,'2022-01-02 12:19:34','01',1,499.50,'2022-02-04 11:40:00','Cofee Board');
	  

	  INSERT INTO Supplier
VALUES (1,'Exotic Liquids','Charlotte Cooper','Lasi','UK','(111) 444-2222'),
		(2,'Tokyo Traders','Yoshi Nagase','Tokyo','Japan','(03) 8888-5011'),
		(3,'Specialty Biscuits, Ltd.','Peter Wilson','Manchester','UK','(161) 555-4448'),
		(4,'Formaggi Fortini s.r.l.','Elio Rossi','Ravenna','Italy','(0544) 60323'),
		(5,'Cooperativa de Quesos ''Las Cabras''','Antonio del Valle Saavedra','Oviedo','Spain','(98) 598 76 54');
		

		INSERT INTO Supplier
VALUES (1,'Exotic Liquids','Charlotte Cooper','Lasi','UK','(111) 444-2222'),
		(2,'Tokyo Traders','Yoshi Nagase','Tokyo','Japan','(03) 8888-5011'),
		(3,'Specialty Biscuits, Ltd.','Peter Wilson','Manchester','UK','(161) 555-4448'),
		(4,'Formaggi Fortini s.r.l.','Elio Rossi','Ravenna','Italy','(0544) 60323'),
		(5,'Cooperativa de Quesos ''Las Cabras''','Antonio del Valle Saavedra','Oviedo','Spain','(98) 598 76 54');


		INSERT INTO Product 
VALUES (1,'Chai',16.00,1,8,15,2),
		(2,'Aniseed Syrup',19.00,1,1,4,10),
		(3,'Teatime Chocolate Biscuits',128.75,1,3,25,30),
		(4,'Geitost',12.00,0,5,33,0),
		(5,'Carnarvon Tigers',54.00,1,2,19,14);
		
INSERT INTO OrderItem
VALUES (101,104,8,177.00,7),
		(102,105,5,57.00,18),
		(103,102,1,18.50,20),
		(104,104,7,200.00,15),
		(105,101,4,15.00,20);
		
		
		
		
		
	SELECT * FROM Customer;




		SELECT DISTINCT Country FROM Customer
WHERE Country LIKE 'A%' OR Country LIKE 'I%';

SELECT * FROM Customer
WHERE FirstName LIKE '__i%';

