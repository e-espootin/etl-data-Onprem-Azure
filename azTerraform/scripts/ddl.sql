if not exists(select * from sys.schemas where name = 'SalesLT')
begin
	create schema SalesLT
end

if not exists(select * from sys.tables where name = 'Address')
begin
	CREATE TABLE  [salesLT].[Address](
		[AddressID] [int]  null ,
		[AddressLine1] [nvarchar](60)  NULL,
		[AddressLine2] [nvarchar](60) NULL,
		[City] [nvarchar](30)  NULL,
		[StateProvince] nvarchar(50)  NULL,
		[CountryRegion] nvarchar(50)  NULL,
		[PostalCode] [nvarchar](15) NULL,
		[ModifiedDate] [datetime]  NULL
	) 
end

if not exists(select * from sys.tables where name = 'SalesOrderDetail')
begin
CREATE TABLE [SalesLT].[SalesOrderDetail](
	[SalesOrderID] [int]  NULL,
	[SalesOrderDetailID] [int]  NULL,
	[OrderQty] [smallint]  NULL,
	[ProductID] [int]  NULL,
	[UnitPrice] [money]  NULL,
	[UnitPriceDiscount] [money]  NULL,
	[LineTotal]  int,
	[ModifiedDate] [datetime] NOT NULL
)
end

if not exists(select * from sys.tables where name = 'Product')
begin
CREATE TABLE [SalesLT].[Product](
	[ProductID] [int]  NULL,
	[Name] [nvarchar](125)  NULL,
	[ProductNumber] [nvarchar](25)  NULL,
	[Color] [nvarchar](15) NULL,
	[StandardCost] [money]  NULL,
	[ListPrice] [money]  NULL,
	[Size] [nvarchar](5) NULL,
	[Weight] [decimal](8, 2) NULL,
	[ProductCategoryID] [int] NULL,
	[ProductModelID] [int] NULL,
	[SellStartDate] [datetime]  NULL,
	[SellEndDate] [datetime] NULL,
	[DiscontinuedDate] [datetime] NULL,
	[modifieddate] [datetime] NOT NULL
)
end

if not exists(select * from sys.tables where name = 'SalesOrderHeader')
begin
CREATE TABLE [SalesLT].[SalesOrderHeader](
	[SalesOrderID] [int]  NULL,
	[RevisionNumber] [tinyint]  NULL,
	[OrderDate] [datetime]  NULL,
	[DueDate] [datetime]  NULL,
	[ShipDate] [datetime] NULL,
	[Status] [tinyint]  NULL,
	[OnlineOrderFlag] varchar(15)  NULL,
	[SalesOrderNumber]  varchar(4000),
	[PurchaseOrderNumber] int NULL,
	[AccountNumber] int NULL,
	[CustomerID] [int]  NULL,
	[ShipToAddressID] [int] NULL,
	[BillToAddressID] [int] NULL,
	[ShipMethod] [nvarchar](50)  NULL,
	[CreditCardApprovalCode] [varchar](15) NULL,
	[SubTotal] [money]  NULL,
	[TaxAmt] [money]  NULL,
	[Freight] [money]  NULL,
	[TotalDue]  int null,
	[Comment] [nvarchar](max) NULL,
	[ModifiedDate] [datetime] NOT NULL
)
end


if not exists(select * from sys.tables where name = 'Customer')
begin
create table SalesLT.Customer(
	CustomerID int,
	NameStyle bit,
	Title nvarchar(18),
	FirstName nvarchar(150),
	LastName nvarchar(150),
	EmailAddress nvarchar(150),
	Phone nvarchar(125),
	modifieddate datetime
)
end

