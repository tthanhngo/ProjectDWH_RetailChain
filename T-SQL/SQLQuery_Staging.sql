
DROP DATABASE  DatacoSupplyChainDWStage
GO
CREATE DATABASE  DatacoSupplyChainDWStage
GO
ALTER DATABASE  DatacoSupplyChainDWStage
SET RECOVERY SIMPLE
GO


USE DatacoSupplyChainDWStage
GO

--- Staging bang Category
SELECT CategoryId, CategoryName
into [dbo].[DatacoSupplyChainCategory]
from [DatacoSupplyChain].[dbo].[Categories]

--- Staging bang Customer
SELECT CustomerId, CustomerFname, CustomerLname, CustomerCity, CustomerCountry, CustomerSegment, CustomerState, CustomerStreet, CustomerZipcode 
into [dbo].[DatacoSupplyChainCustomer] 
from [DatacoSupplyChain].[dbo].[Customers] 

--- Staging bang OrderDetail
SELECT o.OrderId, ProductCardId as OrderItemCardproId, OrderItemDiscount, OrderItemId, OrderItemProductPrice, OrderItemProfitRatio, OrderItemQuantity, Sales, OrderItemTotal, OrderProfitPerOrder
into [dbo].[DatacoSupplyChainOrderDetail]
from [DatacoSupplyChain].[dbo].[OrderDetail] od
join [DatacoSupplyChain].[dbo].[Orders] o on od.OrderId = o.OrderId
join [DatacoSupplyChain].[dbo].[Products] p on od.OrderItemCardprodId = p.ProductCardId

--- Staging bang Orders
SELECT OrderId, Type, Market, OrderCity, OrderCountry, CustomerId as OrderCustomerId, OrderDate, OrderRegion, OrderState, OrderStatus
into [dbo].[DatacoSupplyChainOrders]
from [DatacoSupplyChain].[dbo].[Orders] o
join [DatacoSupplyChain].[dbo].[Customers] c on o.OrderCustomerId = c.CustomerId

--- Staging bang Product
SELECT ProductCardId, CategoryId as ProductCategoryId , ProductImage, ProductName 
into [dbo].[DatacoSupplyChainProduct]
from [DatacoSupplyChain].[dbo].[Products] p
join [DatacoSupplyChain].[dbo].[Categories] c on p.ProductCategoryId = c.CategoryId

--- Staging bang Shipping
SELECT o.OrderId, DaysForShippingReal, DaysForShipmentScheduled, DeliveryStatus, LateDeliveryRisk, ShippingDate, ShippingMode 
into [dbo].[DatecoSupplyChainShipping]
from [DatacoSupplyChain].[dbo].[Shipping] s
join [DatacoSupplyChain].[dbo].[Orders] o on s.OrderId = o.OrderId

-- Staging bảng Date

-- Import data for  [Temp].[dbo].[DateDimension] by run Query ImportDataForDateDimension

select * 
into [dbo].[NorthwindStageDate] 
from [Temp].[dbo].[Date_Dimension] 
where year between 2014 and 2018 

--- Staging bang FactSale
select OrderDate as Date_Key
, OrderCustomerId
, o.OrderId
, OrderItemCardprodId
, ProductCategoryId
, sh.OrderId as Shipping_key
, ProductCardId
, OrderItemProductPrice
, OrderItemQuantity

into [dbo].[DatacoSupplyChainFSale] 
from [DatacoSupplyChain].[dbo].[OrderDetail] od 
join [DatacoSupplyChain].[dbo].[Orders] o 
 on od.OrderID = o.OrderID 
join [DatacoSupplyChain].[dbo].[Products] p 
 on od.OrderItemCardprodId = p.ProductCardId
join [DatacoSupplyChain].[dbo].[Shipping] sh
 on od.OrderId = sh.OrderId

 -- Staging bang FactOrderFullFillment
 select o.OrderId
, sh.OrderId as Shipping_key
, DeliveryStatus

into [dbo].[DatacoSupplyChainFOrderFullfill] 
from [DatacoSupplyChain].[dbo].[Shipping] sh
join [DatacoSupplyChain].[dbo].[Orders] o 
 on sh.OrderID = o.OrderID
