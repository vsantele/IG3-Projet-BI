USE [ProjetETLBI]
GO

/****** Object:  Table [dbo].[FactOrder]    Script Date: 14-12-21 11:44:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FactOrder](
	[id] [numeric](18, 0) NOT NULL,
	[ProductKey] [numeric](18, 0) NOT NULL,
	[Price] [money] NOT NULL,
	[Freight] [money] NOT NULL,
	[ShipperKey] [numeric](18, 0) NOT NULL,
	[ShipAddressKey] [numeric](18, 0) NOT NULL,
	[EmployeeKey] [numeric](18, 0) NOT NULL,
	[CustomerKey] [nchar](5) NOT NULL,
	[CustomerAddressKey] [numeric](18,0) NOT NULL,
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

ALTER TABLE [dbo].[FactOrder]  WITH CHECK ADD  CONSTRAINT [FK_DimAddress_Ship] FOREIGN KEY([ShipAddressKey])
REFERENCES [dbo].[DimAddress] ([Id])
GO

ALTER TABLE [dbo].[FactOrder] CHECK CONSTRAINT [FK_DimAddress_Ship]
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

ALTER TABLE [dbo].[FactOrder]  WITH CHECK ADD  CONSTRAINT [FK_DimCustomer_Ship] FOREIGN KEY([CustomerAddressKey])
REFERENCES [dbo].[DimAddress] ([Id])
GO

ALTER TABLE [dbo].[FactOrder] CHECK CONSTRAINT [FK_DimAddress_Ship]
GO
