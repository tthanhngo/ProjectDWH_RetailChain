CREATE TABLE Categories  (
  CategoryId INT PRIMARY KEY,
  CategoryName NVARCHAR(255)
);


BULK INSERT Categories 
FROM 'C:/Users/84356/OneDrive - hcmute.edu.vn/HCMUTE/Nam_3/HK2/Kho_du_lieu/Final_Report/Data/Tables_DatacoSupplyChain - CATEGORY.csv'
WITH (
  FIELDTERMINATOR = ',',  -- Giả định file CSV dùng dấu phẩy làm dấu phân cách
  ROWTERMINATOR = '\n',
  FIRSTROW = 2
);

DROP TABLE IF EXISTS Orders;

CREATE TABLE Products (
  ProductCardId INT PRIMARY KEY,
  ProductCategoryId INT,
  ProductImage NVARCHAR(255),
  ProductName NVARCHAR(255),
  FOREIGN KEY (ProductCategoryId) REFERENCES Categories(CategoryId)
);

BULK INSERT Products
FROM 'C:/Users/84356/OneDrive - hcmute.edu.vn/HCMUTE/Nam_3/HK2/Kho_du_lieu/Final_Report/Data/Tables_DatacoSupplyChain - PRODUCT.csv'
WITH (
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  FIRSTROW = 2
);

CREATE TABLE Customers (
  CustomerId INT PRIMARY KEY,
  CustomerFname NVARCHAR(255),
  CustomerLname NVARCHAR(255),
  CustomerCity NVARCHAR(255),
  CustomerCountry NVARCHAR(255),
  CustomerSegment NVARCHAR(255),
  CustomerState NVARCHAR(255),
  CustomerStreet NVARCHAR(255),
  CustomerZipcode NVARCHAR(255)
);

BULK INSERT Customers
FROM 'C:/Users/84356/OneDrive - hcmute.edu.vn/HCMUTE/Nam_3/HK2/Kho_du_lieu/Final_Report/Data/Tables_DatacoSupplyChain - CUSTOMER.csv'
WITH (
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  FIRSTROW = 2
);

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
  OrderId INT PRIMARY KEY,
  Type NVARCHAR(255),
  Market NVARCHAR(255),
  OrderCity NVARCHAR(255),
  OrderCountry NVARCHAR(255),
  OrderCustomerId INT,
  OrderDate DATETIME,
  OrderRegion NVARCHAR(255),
  OrderState NVARCHAR(255),
  OrderStatus NVARCHAR(255),
  FOREIGN KEY (OrderCustomerId) REFERENCES Customers(CustomerId)
);


BULK INSERT Orders
FROM 'C:/Users/84356/OneDrive - hcmute.edu.vn/HCMUTE/Nam_3/HK2/Kho_du_lieu/Final_Report/Data/Tables_DatacoSupplyChain - ORDER.csv'
WITH (
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  FIRSTROW = 2
);

DROP TABLE IF EXISTS OrderDetail;

CREATE TABLE OrderDetail (
  OrderId INT,
  OrderItemCardprodId INT,
  OrderItemDiscount DECIMAL(38, 2),
  OrderItemDiscountRate DECIMAL(38, 2),
  OrderItemId INT,
  OrderItemProductPrice DECIMAL(38, 2),
  OrderItemProfitRatio DECIMAL(38, 2),
  OrderItemQuantity INT,
  Sales DECIMAL(38, 2),
  OrderItemTotal DECIMAL(38, 2),
  OrderProfitPerOrder DECIMAL(38, 2),
  PRIMARY KEY (OrderItemCardprodId, OrderItemDiscount, OrderId),
  FOREIGN KEY (OrderId) REFERENCES Orders(OrderId),
  FOREIGN KEY (OrderItemCardprodId) REFERENCES Products(ProductCardId)
);


BULK INSERT OrderDetail
FROM 'C:/Users/84356/OneDrive - hcmute.edu.vn/HCMUTE/Nam_3/HK2/Kho_du_lieu/Final_Report/Data/Tables_DatacoSupplyChain - ORDER_DETAIL.csv'
WITH (
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  FIRSTROW = 2
);

CREATE TABLE Shipping (
  OrderId INT PRIMARY KEY,
  DaysForShippingReal INT,
  DaysForShipmentScheduled INT,
  DeliveryStatus NVARCHAR(255),
  LateDeliveryRisk INT,
  ShippingDate DATETIME,
  ShippingMode NVARCHAR(255),
  FOREIGN KEY (OrderId) REFERENCES Orders(OrderId)
);


BULK INSERT Shipping
FROM 'C:/Users/84356/OneDrive - hcmute.edu.vn/HCMUTE/Nam_3/HK2/Kho_du_lieu/Final_Report/Data/Tables_DatacoSupplyChain - SHIPPING.csv'
WITH (
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  FIRSTROW = 2
);
