USE [ProjetETLBI]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE [dbo].[DimCustomer](
	[Id] [nchar](5) NOT NULL,
	[CompanyName] [nchar](40) NOT NULL,
	[ContactName] [nchar](30) NOT NULL,
	[ContactTitle] [nchar](30) NOT NULL,
	[Phone] [nchar](24) NOT NULL,
	[City] [nchar](15) NOT NULL,
	[PostalCode] [nchar](10) NOT NULL,
	[Region] [nchar](15) NOT NULL,
	[CountryNameFr] [nchar](15) NOT NULL,
	[CountryNameEn] [nchar](15) NOT NULL,
 CONSTRAINT [PK_DimCustomer] PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DimCustomer] ADD  CONSTRAINT [DF_DimCustomer_ContactName]  DEFAULT (N'Unknown') FOR [ContactName]
GO

ALTER TABLE [dbo].[DimCustomer] ADD  CONSTRAINT [DF_DimCustomer_ContactTitle]  DEFAULT (N'Unknown') FOR [ContactTitle]
GO

ALTER TABLE [dbo].[DimCustomer] ADD  CONSTRAINT [DF_DimCustomer_Region]  DEFAULT (N'Unknown') FOR [Region]
GO

ALTER TABLE [dbo].[DimCustomer] ADD  CONSTRAINT [DF_DimCustomer_City]  DEFAULT (N'Unknown') FOR [City]
GO

ALTER TABLE [dbo].[DimCustomer] ADD  CONSTRAINT [DF_DimCustomer_PostalCode]  DEFAULT (N'Unknown') FOR [PostalCode]
GO

ALTER TABLE [dbo].[DimCustomer] ADD  CONSTRAINT [DF_DimCustomer_CountryNameEN]  DEFAULT (N'Unknown') FOR [CountryNameEn]
GO

ALTER TABLE [dbo].[DimCustomer] ADD  CONSTRAINT [DF_DimCustomer_CountryNameFR]  DEFAULT (N'Inconnu') FOR [CountryNameFr]
GO

CREATE TABLE [dbo].[DimDate](
	[Id] [numeric](18, 0) NOT NULL,
	[Date] [date] NOT NULL,
	[DayOfWeek] [numeric](18, 0) NOT NULL,
	[DayOfWeekNameFr] [nchar](15) NOT NULL,
	[DayOfWeekNameEn] [nchar](15) NOT NULL,
	[WeekOfYear] [numeric](18, 0) NOT NULL,
	[Month] [numeric](18, 0) NOT NULL,
	[MonthNameFr] [nchar](15) NOT NULL,
	[MonthNameEn] [nchar](15) NOT NULL,
	[Year] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_DimDate] PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[DimEmployee](
	[Id] [numeric](18, 0) NOT NULL,
	[FirstName] [nchar](10) NOT NULL,
	[LastName] [nchar](20) NOT NULL,
 CONSTRAINT [PK_DimEmployee] PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[DimProduct](
	[Id] [numeric](18, 0) NOT NULL,
	[NameFr] [nchar](40) NOT NULL,
	[NameEn] [nchar](40) NOT NULL,
	[QuantityPerUnit] [nchar](20) NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[CatId] [numeric](18, 0) NOT NULL,
	[NameCatFr] [nchar](15) NOT NULL,
	[NameCatEn] [nchar](15) NOT NULL,
 CONSTRAINT [PK_DimProduct] PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DimProduct] ADD  CONSTRAINT [DF_DimProduct_NameFr]  DEFAULT (N'Inconnu') FOR [NameFr]
GO

ALTER TABLE [dbo].[DimProduct] ADD  CONSTRAINT [DF_DimProduct_NameCatFr]  DEFAULT (N'Inconnu') FOR [NameCatFr]
GO

CREATE TABLE [dbo].[DimShipper](
	[Id] [numeric](18, 0) NOT NULL,
	[CompanyName] [nchar](40) NOT NULL,
	[Phone] [nchar](24) NOT NULL,
 CONSTRAINT [PK_DimShipper] PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[FactOrder](
	[id] [numeric](18, 0) NOT NULL,
	[ProductKey] [numeric](18, 0) NOT NULL,
	[Price] [money] NOT NULL,
	[Freight] [money] NOT NULL,
	[Quantity] [smallint] NOT NULL,
	[ShipperKey] [numeric](18, 0) NOT NULL,
	[EmployeeKey] [numeric](18, 0) NOT NULL,
	[CustomerKey] [nchar](5) NOT NULL,
	[OrderDateKey] [numeric](18, 0) NOT NULL,
	[RequiredDateKey] [numeric](18, 0) NOT NULL,
	[ShippedDateKey] [numeric](18, 0) NOT NULL,
	[IsOnline] [tinyint] NOT NULL,
 CONSTRAINT [PK_FactOrder] PRIMARY KEY CLUSTERED
(
	[id] ASC,
	[ProductKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FactOrder]  WITH CHECK ADD  CONSTRAINT [FK_DimCustomer] FOREIGN KEY([CustomerKey])
REFERENCES [dbo].[DimCustomer] ([Id])
GO

ALTER TABLE [dbo].[FactOrder] CHECK CONSTRAINT [FK_DimCustomer]
GO

ALTER TABLE [dbo].[FactOrder]  WITH CHECK ADD  CONSTRAINT [FK_DimDate_Order] FOREIGN KEY([OrderDateKey])
REFERENCES [dbo].[DimDate] ([Id])
GO

ALTER TABLE [dbo].[FactOrder] CHECK CONSTRAINT [FK_DimDate_Order]
GO

ALTER TABLE [dbo].[FactOrder]  WITH CHECK ADD  CONSTRAINT [FK_DimDate_Required] FOREIGN KEY([RequiredDateKey])
REFERENCES [dbo].[DimDate] ([Id])
GO

ALTER TABLE [dbo].[FactOrder] CHECK CONSTRAINT [FK_DimDate_Required]
GO

ALTER TABLE [dbo].[FactOrder]  WITH CHECK ADD  CONSTRAINT [FK_DimDate_Shipped] FOREIGN KEY([ShippedDateKey])
REFERENCES [dbo].[DimDate] ([Id])
GO

ALTER TABLE [dbo].[FactOrder] CHECK CONSTRAINT [FK_DimDate_Shipped]
GO

ALTER TABLE [dbo].[FactOrder]  WITH CHECK ADD  CONSTRAINT [FK_DimEmployee] FOREIGN KEY([EmployeeKey])
REFERENCES [dbo].[DimEmployee] ([Id])
GO

ALTER TABLE [dbo].[FactOrder] CHECK CONSTRAINT [FK_DimEmployee]
GO

ALTER TABLE [dbo].[FactOrder]  WITH CHECK ADD  CONSTRAINT [FK_DimProduct] FOREIGN KEY([ProductKey])
REFERENCES [dbo].[DimProduct] ([Id])
GO

ALTER TABLE [dbo].[FactOrder] CHECK CONSTRAINT [FK_DimProduct]
GO

ALTER TABLE [dbo].[FactOrder]  WITH CHECK ADD  CONSTRAINT [FK_DimShipper] FOREIGN KEY([ShipperKey])
REFERENCES [dbo].[DimShipper] ([Id])
GO

ALTER TABLE [dbo].[FactOrder] CHECK CONSTRAINT [FK_DimShipper]
GO

