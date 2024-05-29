/****** Object:  Database DatacoSupplyChainDW    Script Date: 5/21/2024 11:09:12 PM ******/
/*
Kimball Group, The Microsoft Data Warehouse Toolkit
Generate a database from the datamodel worksheet, version: 4,00

You can use this Excel workbook as a data modeling tool during the logical design phase of your project.
As discussed in the book, it is in some ways preferable to a real data modeling tool during the inital design.
We expect you to move away from this spreadsheet and into a real modeling tool during the physical design phase.
The authors provide this macro so that the spreadsheet isn't a dead-end. You can 'import' into your
data modeling tool by generating a database using this script, then reverse-engineering that database into
your tool.

Uncomment the next lines if you want to drop and create the database
*/
/*
DROP DATABASE DatacoSupplyChainDW
GO
CREATE DATABASE DatacoSupplyChainDW
GO
ALTER DATABASE DatacoSupplyChainDW
SET RECOVERY SIMPLE
GO
*/
DROP DATABASE DatacoSupplyChainDW
GO
CREATE DATABASE DatacoSupplyChainDW
GO
ALTER DATABASE DatacoSupplyChainDW
SET RECOVERY SIMPLE
GO

USE DatacoSupplyChainDW
;
IF EXISTS (SELECT Name from sys.extended_properties where Name = 'Description')
    EXEC sys.sp_dropextendedproperty @name = 'Description'
EXEC sys.sp_addextendedproperty @name = 'Description', @value = 'Default description - you should change this.'
;





/* Drop table dbo.DimDate */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimDate') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimDate 
;

/* Create table dbo.DimDate */
CREATE TABLE dbo.DimDate (
   [DateKey]  int IDENTITY  NOT NULL
,  [FullDate]  datetime   NOT NULL
,  [DayNumberOfWeek]  int   NULL
,  [DayNameOfWeek]  nvarchar(255)   NULL
,  [DayNumberOfMonth]  int   NULL
,  [DayNumberOfYear]  int   NULL
,  [WeekNumberOfYear]  int   NULL
,  [MonthName]  nvarchar(255)   NULL
,  [MonthNumberOfYear]  int   NULL
,  [CalendarQuarter]  int   NULL
,  [CalendarYear]  int   NULL
, CONSTRAINT [PK_dbo.DimDate] PRIMARY KEY CLUSTERED 
( [DateKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimDate
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimDate', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimDate
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Date Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimDate
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DateKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'FullDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FullDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DayNumberOfWeek', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayNumberOfWeek'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DayNameOfWeek', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayNameOfWeek'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DayNumberOfMonth', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayNumberOfMonth'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DayNumberOfYear', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayNumberOfYear'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'WeekNumberOfYear', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'WeekNumberOfYear'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'MonthName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'MonthNumberOfYear', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthNumberOfYear'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CalendarQuarter', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'CalendarQuarter'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CalendarYear', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'CalendarYear'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Full date as aSQL date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FullDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Number of the day of week', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayNumberOfWeek'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Day name of week', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayNameOfWeek'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Number of the day in the month', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayNumberOfMonth'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Number of the day in the year', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayNumberOfYear'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Week of year', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'WeekNumberOfYear'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Month name of year', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Month of year', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthNumberOfYear'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Calendar quarter', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'CalendarQuarter'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Year', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'CalendarYear'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FullDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayNumberOfWeek'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayNameOfWeek'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayNumberOfMonth'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayNumberOfYear'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'WeekNumberOfYear'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthName'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthNumberOfYear'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'CalendarQuarter'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'CalendarYear'; 
;





/* Drop table dbo.DimOrder */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimOrder') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimOrder 
;

/* Create table dbo.DimOrder */
CREATE TABLE dbo.DimOrder (
   [OrderKey]  int IDENTITY  NOT NULL
,  [OrderID]  int   NOT NULL
,  [Type]  nvarchar(255)   NOT NULL
,  [Market]  nvarchar(255)   NOT NULL
,  [OrderCity]  nvarchar(255)   NOT NULL
,  [OrderCountry]  nvarchar(255)   NOT NULL
,  [OrderCustomerId]  int   NOT NULL
,  [OrderDate]  datetime   NOT NULL
,  [OrderRegion]  nvarchar(255)   NOT NULL
,  [OrderState]  nvarchar(255)   NOT NULL
,  [OrderStatus]  nvarchar(255)   NOT NULL
, CONSTRAINT [PK_dbo.DimOrder] PRIMARY KEY CLUSTERED 
( [OrderKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimOrder
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimOrder', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimOrder
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Order Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimOrder
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'OrderKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'OrderID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Type', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'Type'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Market', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'Market'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'OrderCity', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderCity'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'OrderCountry', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderCountry'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'OrderCustomerId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderCustomerId'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'OrderDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'OrderRegion', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderRegion'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'OrderState', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderState'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'OrderStatus', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderStatus'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Payment method', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'Type'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Market for the order', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'Market'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'City of each order', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderCity'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Country of each order', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderCountry'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Customer order ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderCustomerId'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The date an order was placed', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Geographic area of order placement', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderRegion'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'State of order placement', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderState'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Status of each order', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderStatus'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderID'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'Type'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'Market'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderCity'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderCountry'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderCustomerId'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderRegion'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderState'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderStatus'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'Type'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'Market'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderCity'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderCountry'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderCustomerId'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderRegion'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderState'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderStatus'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'Type'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'Market'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderCity'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderCountry'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderCustomerId'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderDate'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderRegion'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderState'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderStatus'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Orders', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Orders', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'Type'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Orders', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'Market'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Orders', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderCity'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Orders', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderCountry'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Orders', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderCustomerId'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Orders', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderDate'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Orders', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderRegion'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Orders', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderState'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Orders', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderStatus'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'OrderID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Type', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'Type'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Market', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'Market'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'OrderCity', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderCity'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'OrderCountry', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderCountry'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'OrderCustomerId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderCustomerId'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'OrderDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderDate'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'OrderRegion', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderRegion'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'OrderState', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderState'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'OrderStatus', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderStatus'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvachar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'Type'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'Market'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderCity'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderCountry'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderCustomerId'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'datetime', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderDate'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderRegion'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderState'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'OrderStatus'; 
;





/* Drop table dbo.DimOrderDetail */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimOrderDetail') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimOrderDetail 
;

/* Create table dbo.DimOrderDetail */
CREATE TABLE dbo.DimOrderDetail (
   [OrderDetailKey]  int IDENTITY  NOT NULL
,  [OrderItemId]  int   NULL
,  [OrderId]  int   NOT NULL
,  [OrderItemCardprodId]  int   NOT NULL
,  [OrderItemDiscount]  decimal(38,2)   NOT NULL
,  [OrderItemDiscountRate]  decimal(38,2)   NOT NULL
,  [OrderItemProductPrice]  decimal(38,2)   NOT NULL
,  [OrderItemProfitRatio]  decimal(38,2)   NOT NULL
,  [OrderItemQuantity]  int   NOT NULL
,  [Sales]  decimal(38,2)   NOT NULL
,  [OrderItemTotal]  decimal(38,2)   NOT NULL
,  [OrderProfitPerOrder]  decimal(38,2)   NOT NULL
, CONSTRAINT [PK_dbo.DimOrderDetail] PRIMARY KEY CLUSTERED 
( [OrderDetailKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimOrderDetail
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimOrderDetail', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimOrderDetail
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Order detail dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimOrderDetail
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'OrderDetailKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderDetailKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'OrderItemId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemId'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'OrderId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderId'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'OrderItemCardprodId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemCardprodId'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'OrderItemDiscount', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemDiscount'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'OrderItemDiscountRate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemDiscountRate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'OrderItemProductPrice', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemProductPrice'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'OrderItemProfitRatio', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemProfitRatio'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'OrderItemQuantity', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemQuantity'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'Sales'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'OrderItemTotal', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemTotal'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'OrderProfitPerOrder', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderProfitPerOrder'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'A unique identifier for each order detail in the table', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderDetailKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Product item code on an order', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemId'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Id of each order', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderId'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Product code on the order', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemCardprodId'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Discount rate per unit of product', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemDiscount'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Percentage discount applied to the product', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemDiscountRate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Original price per unit of product', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemProductPrice'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The ratio of profit obtained from an item to the sales value of that item.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemProfitRatio'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Quantity of products on the order', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemQuantity'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Selling price of the product calculated with quantity', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'Sales'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Total unit price of each item after applying discounts', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemTotal'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Profit margin per item on the order', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderProfitPerOrder'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderDetailKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderDetailKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderId'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemCardprodId'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemDiscount'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemDiscountRate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemProductPrice'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemProfitRatio'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemQuantity'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'Sales'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemTotal'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderProfitPerOrder'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderDetailKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemId'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderId'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemCardprodId'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemDiscount'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemDiscountRate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemProductPrice'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemProfitRatio'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemQuantity'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'Sales'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemTotal'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderProfitPerOrder'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemId'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderId'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemCardprodId'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemDiscount'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemDiscountRate'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemProductPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemProfitRatio'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemQuantity'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'Sales'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemTotal'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderProfitPerOrder'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'OrderDetail', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemId'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'OrderDetail', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderId'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'OrderDetail', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemCardprodId'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'OrderDetail', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemDiscount'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'OrderDetail', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemDiscountRate'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'OrderDetail', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemProductPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'OrderDetail', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemProfitRatio'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'OrderDetail', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemQuantity'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'OrderDetail', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'Sales'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'OrderDetail', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemTotal'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'OrderDetail', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderProfitPerOrder'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'OrderItemId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemId'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'OrderId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderId'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'OrderItemCardprodId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemCardprodId'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'OrderItemDiscount', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemDiscount'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'OrderItemDiscountRate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemDiscountRate'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'OrderItemProductPrice', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemProductPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'OrderItemProfitRatio', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemProfitRatio'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'OrderItemQuantity', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemQuantity'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'Sales'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'OrderItemTotal', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemTotal'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'OrderProfitPerOrder', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderProfitPerOrder'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemId'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderId'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemCardprodId'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'decimal', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemDiscount'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'decimal', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemDiscountRate'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'decimal', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemProductPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'decimal', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemProfitRatio'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemQuantity'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'decimal', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'Sales'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'decimal', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderItemTotal'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'decimal', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderDetail', @level2type=N'COLUMN', @level2name=N'OrderProfitPerOrder'; 
;





/* Drop table dbo.DimCustomer */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimCustomer') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimCustomer 
;

/* Create table dbo.DimCustomer */
CREATE TABLE dbo.DimCustomer (
   [CustomerKey]  int IDENTITY  NOT NULL
,  [CustomerId]  int   NOT NULL
,  [CustomerFname]  nvarchar(255)   NOT NULL
,  [CustomerLname]  nvarchar(255)   NOT NULL
,  [CustomerCity]  nvarchar(255)   NOT NULL
,  [CustomerCountry]  nvarchar(255)   NOT NULL
,  [CustomerSegment]  nvarchar(255)   NOT NULL
,  [CustomerState]  nvarchar(255)   NOT NULL
,  [CustomerStreet]  nvarchar(255)   NOT NULL
,  [CustomerZipcode]  nvarchar(255)   NOT NULL
,  [RowIsCurrent]  bit   NOT NULL
,  [RowStartDate]  datetime   NOT NULL
,  [RowEndDate]  datetime   NOT NULL
, CONSTRAINT [PK_dbo.DimCustomer] PRIMARY KEY CLUSTERED 
( [CustomerKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimCustomer
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimCustomer', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimCustomer
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Customer dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimCustomer
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerId'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerFname', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerFname'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerLname', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerLname'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerCity', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerCity'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerCountry', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerCountry'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerSegment', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerSegment'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerState', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerState'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerStreet', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerStreet'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerZipcode', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerZipcode'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Is Current', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Start Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row End Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Id of each customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerId'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'First name of each customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerFname'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Last name of each customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerLname'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'City of each customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerCity'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Country of customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerCountry'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Segment of each customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerSegment'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'State of each customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerState'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Address of each customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerStreet'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Zipcode of each customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerZipcode'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the current row for this member (Y/N)?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become valid for this member?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become invalid? (12/31/9999 if current row)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerId'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerFname'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerLname'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerCity'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerCountry'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerSegment'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerState'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerStreet'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerZipcode'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerId'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerFname'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerLname'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerCity'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerCountry'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerSegment'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerState'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerStreet'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerZipcode'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerId'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerFname'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerLname'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerCity'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerCountry'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerSegment'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerState'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerStreet'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerZipcode'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Customers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerId'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Customers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerFname'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Customers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerLname'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Customers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerCity'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Customers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerCountry'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Customers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerSegment'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Customers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerState'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Customers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerStreet'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Customers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerZipcode'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'CustomerId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerId'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'CustomerFname', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerFname'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'CustomerLname', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerLname'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'CustomerCity', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerCity'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'CustomerCountry', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerCountry'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'CustomerSegment', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerSegment'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'CustomerState', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerState'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'CustomerStreet', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerStreet'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'CustomerZipcode', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerZipcode'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerId'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerFname'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerLname'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerCity'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerCountry'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerSegment'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerState'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerStreet'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerZipcode'; 
;





/* Drop table dbo.DimCategory */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimCategory') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimCategory 
;

/* Create table dbo.DimCategory */
CREATE TABLE dbo.DimCategory (
   [CategoryKey]  int IDENTITY  NOT NULL
,  [CategoryId]  int   NOT NULL
,  [CategoryName]  nvarchar(255)   NOT NULL
, CONSTRAINT [PK_dbo.DimCategory] PRIMARY KEY CLUSTERED 
( [CategoryKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimCategory
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimCategory', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimCategory
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Category Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimCategory
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CategoryKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCategory', @level2type=N'COLUMN', @level2name=N'CategoryKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CategoryId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCategory', @level2type=N'COLUMN', @level2name=N'CategoryId'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CategoryName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCategory', @level2type=N'COLUMN', @level2name=N'CategoryName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'A unique identifier for each order detail in the table', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCategory', @level2type=N'COLUMN', @level2name=N'CategoryKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Id of each category', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCategory', @level2type=N'COLUMN', @level2name=N'CategoryId'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Name of category', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCategory', @level2type=N'COLUMN', @level2name=N'CategoryName'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCategory', @level2type=N'COLUMN', @level2name=N'CategoryKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCategory', @level2type=N'COLUMN', @level2name=N'CategoryId'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCategory', @level2type=N'COLUMN', @level2name=N'CategoryKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCategory', @level2type=N'COLUMN', @level2name=N'CategoryId'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCategory', @level2type=N'COLUMN', @level2name=N'CategoryName'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCategory', @level2type=N'COLUMN', @level2name=N'CategoryId'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCategory', @level2type=N'COLUMN', @level2name=N'CategoryName'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Categories', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCategory', @level2type=N'COLUMN', @level2name=N'CategoryId'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Categories', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCategory', @level2type=N'COLUMN', @level2name=N'CategoryName'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'CategoryId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCategory', @level2type=N'COLUMN', @level2name=N'CategoryId'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'CategoryName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCategory', @level2type=N'COLUMN', @level2name=N'CategoryName'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCategory', @level2type=N'COLUMN', @level2name=N'CategoryId'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCategory', @level2type=N'COLUMN', @level2name=N'CategoryName'; 
;





/* Drop table dbo.DimShipping */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimShipping') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimShipping 
;

/* Create table dbo.DimShipping */
CREATE TABLE dbo.DimShipping (
   [ShippingKey]  int IDENTITY  NOT NULL
,  [OrderId]  int   NOT NULL
,  [DaysForShippingReal]  int   NOT NULL
,  [DaysForShipmentScheduled]  int   NOT NULL
,  [DeliveryStatus]  nvarchar(255)   NOT NULL
,  [LateDeliveryRisk]  int   NOT NULL
,  [ShippingDate]  datetime   NOT NULL
,  [ShippingMode]  nvarchar(255)   NOT NULL
, CONSTRAINT [PK_dbo.DimShipping] PRIMARY KEY CLUSTERED 
( [ShippingKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimShipping
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimShipping', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimShipping
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Shipping dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimShipping
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ShippingKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'ShippingKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'OrderId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'OrderId'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DaysForShippingReal', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'DaysForShippingReal'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DaysForShipmentScheduled', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'DaysForShipmentScheduled'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DeliveryStatus', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'DeliveryStatus'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'LateDeliveryRisk', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'LateDeliveryRisk'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ShippingDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'ShippingDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ShippingMode', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'ShippingMode'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'A unique identifier for each product in the table', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'ShippingKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Id of each order', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'OrderId'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Number of actual shipping days', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'DaysForShippingReal'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Scheduled shipping days', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'DaysForShipmentScheduled'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Order delivery status', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'DeliveryStatus'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Risk of late delivery for the order', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'LateDeliveryRisk'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Date the order was handed over to the shipping carrier', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'ShippingDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Shipping mode of each order', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'ShippingMode'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'ShippingKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'OrderId'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'ShippingKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'OrderId'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'DaysForShippingReal'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'DaysForShipmentScheduled'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'DeliveryStatus'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'LateDeliveryRisk'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'ShippingDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'ShippingMode'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'OrderId'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'DaysForShippingReal'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'DaysForShipmentScheduled'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'DeliveryStatus'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'LateDeliveryRisk'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'ShippingDate'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'ShippingMode'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Shipping', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'OrderId'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Shipping', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'DaysForShippingReal'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Shipping', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'DaysForShipmentScheduled'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Shipping', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'DeliveryStatus'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Shipping', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'LateDeliveryRisk'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Shipping', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'ShippingDate'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Shipping', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'ShippingMode'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'OrderId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'OrderId'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'DaysForShippingReal', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'DaysForShippingReal'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'DaysForShipmentScheduled', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'DaysForShipmentScheduled'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'DeliveryStatus', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'DeliveryStatus'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'LateDeliveryRisk', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'LateDeliveryRisk'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'ShippingDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'ShippingDate'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'ShippingMode', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'ShippingMode'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'OrderId'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'DaysForShippingReal'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'DaysForShipmentScheduled'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'DeliveryStatus'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'LateDeliveryRisk'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'datetime', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'ShippingDate'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimShipping', @level2type=N'COLUMN', @level2name=N'ShippingMode'; 
;





/* Drop table dbo.DimProduct */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimProduct') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimProduct 
;

/* Create table dbo.DimProduct */
CREATE TABLE dbo.DimProduct (
   [ProductKey]  int IDENTITY  NOT NULL
,  [ProductCardId]  int   NOT NULL
,  [ProductCategoryId]  int   NOT NULL
,  [ProductImage]  nvarchar(255)   NOT NULL
,  [ProductName]  nvarchar(255)   NOT NULL
, CONSTRAINT [PK_dbo.DimProduct] PRIMARY KEY CLUSTERED 
( [ProductKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimProduct
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimProduct', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimProduct
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Product dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimProduct
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductCardId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCardId'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductCategoryId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCategoryId'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductImage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductImage'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'A unique identifier for each product in the table', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Id of each product', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCardId'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Category id of each product', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCategoryId'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Image of each product', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductImage'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Name of each producy', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductName'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCardId'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCardId'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCategoryId'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductImage'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductName'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCardId'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCategoryId'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductImage'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductName'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Products', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCardId'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Products', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCategoryId'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Products', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductImage'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Products', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductName'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'ProductCardId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCardId'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'ProductCategoryId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCategoryId'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'ProductImage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductImage'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'ProductName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductName'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCardId'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCategoryId'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductImage'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductName'; 
;





/* Drop table dbo.FactSale */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.FactSale') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.FactSale 
;

/* Create table dbo.FactSale */
CREATE TABLE dbo.FactSale (
   [DateKey]  int   NOT NULL
,  [CustomerKey]  int   NOT NULL
,  [OrderKey]  int   NOT NULL
,  [OrderDetailKey]  int   NOT NULL
,  [CategoryKey]  int   NOT NULL
,  [ShippingKey]  int   NOT NULL
,  [ProductKey]  int   NOT NULL
,  [UnitPrice]  decimal(38,2)   NOT NULL
,  [Quantity]  int   NOT NULL
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Fact', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactSale
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'FactSale', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactSale
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Fact of Sale', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactSale
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DateKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'OrderKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'OrderKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'OrderDetailKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'OrderDetailKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CategoryKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'CategoryKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ShippingKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'ShippingKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'UnitPrice', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'UnitPrice'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Quantity', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'Quantity'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to DimDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to DimCustomer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to DimOrder', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'OrderKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to DimOrderDetail', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'OrderDetailKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to DimCategory', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'CategoryKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to DimShipping', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'ShippingKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to DimProduct', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Unit price of each product', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'UnitPrice'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Quantity of each product', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'Quantity'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'OrderKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'OrderDetailKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'CategoryKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'ShippingKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'UnitPrice'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'Quantity'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'UnitPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'Quantity'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'OrderDetail', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'UnitPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'OrderDetail', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'Quantity'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'OrderItemProductPrice', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'UnitPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'OrderItemQuantity', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'Quantity'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'decimal', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'UnitPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSale', @level2type=N'COLUMN', @level2name=N'Quantity'; 
;





/* Drop table dbo.FactOrderFullfillment */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.FactOrderFullfillment') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.FactOrderFullfillment 
;

/* Create table dbo.FactOrderFullfillment */
CREATE TABLE dbo.FactOrderFullfillment (
   [DateKey]  int   NOT NULL
,  [OrderKey]  int   NOT NULL
,  [ShippingKey]  int   NOT NULL
,  [DeliveryStatus]  nvarchar(255)   NOT NULL
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Fact', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactOrderFullfillment
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'FactOrderFullfillment', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactOrderFullfillment
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Fact of Order Fullfillment', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactOrderFullfillment
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DateKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderFullfillment', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'OrderKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderFullfillment', @level2type=N'COLUMN', @level2name=N'OrderKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ShippingKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderFullfillment', @level2type=N'COLUMN', @level2name=N'ShippingKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DeliveryStatus', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderFullfillment', @level2type=N'COLUMN', @level2name=N'DeliveryStatus'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to DimDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderFullfillment', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to DimOrder', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderFullfillment', @level2type=N'COLUMN', @level2name=N'OrderKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to DimShipping', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderFullfillment', @level2type=N'COLUMN', @level2name=N'ShippingKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Order delivery status', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderFullfillment', @level2type=N'COLUMN', @level2name=N'DeliveryStatus'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderFullfillment', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderFullfillment', @level2type=N'COLUMN', @level2name=N'OrderKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderFullfillment', @level2type=N'COLUMN', @level2name=N'ShippingKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DatacoSupplyChain', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderFullfillment', @level2type=N'COLUMN', @level2name=N'DeliveryStatus'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderFullfillment', @level2type=N'COLUMN', @level2name=N'DeliveryStatus'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Shipping', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderFullfillment', @level2type=N'COLUMN', @level2name=N'DeliveryStatus'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'DeliveryStatus', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderFullfillment', @level2type=N'COLUMN', @level2name=N'DeliveryStatus'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderFullfillment', @level2type=N'COLUMN', @level2name=N'DeliveryStatus'; 
;
ALTER TABLE dbo.FactSale ADD CONSTRAINT
   FK_dbo_FactSale_DateKey FOREIGN KEY
   (
   DateKey
   ) REFERENCES DimDate
   ( DateKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactSale ADD CONSTRAINT
   FK_dbo_FactSale_CustomerKey FOREIGN KEY
   (
   CustomerKey
   ) REFERENCES DimCustomer
   ( CustomerKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactSale ADD CONSTRAINT
   FK_dbo_FactSale_OrderKey FOREIGN KEY
   (
   OrderKey
   ) REFERENCES DimOrder
   ( OrderKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactSale ADD CONSTRAINT
   FK_dbo_FactSale_OrderDetailKey FOREIGN KEY
   (
   OrderDetailKey
   ) REFERENCES DimOrderDetail
   ( OrderDetailKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactSale ADD CONSTRAINT
   FK_dbo_FactSale_CategoryKey FOREIGN KEY
   (
   CategoryKey
   ) REFERENCES DimCategory
   ( CategoryKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactSale ADD CONSTRAINT
   FK_dbo_FactSale_ShippingKey FOREIGN KEY
   (
   ShippingKey
   ) REFERENCES DimShipping
   ( ShippingKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactSale ADD CONSTRAINT
   FK_dbo_FactSale_ProductKey FOREIGN KEY
   (
   ProductKey
   ) REFERENCES DimProduct
   ( ProductKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactOrderFullfillment ADD CONSTRAINT
   FK_dbo_FactOrderFullfillment_DateKey FOREIGN KEY
   (
   DateKey
   ) REFERENCES DimDate
   ( DateKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactOrderFullfillment ADD CONSTRAINT
   FK_dbo_FactOrderFullfillment_OrderKey FOREIGN KEY
   (
   OrderKey
   ) REFERENCES DimOrder
   ( OrderKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactOrderFullfillment ADD CONSTRAINT
   FK_dbo_FactOrderFullfillment_ShippingKey FOREIGN KEY
   (
   ShippingKey
   ) REFERENCES DimShipping
   ( ShippingKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
