USE [ProjetETLBI]
GO

/****** Object:  Table [dbo].[FactCommand]    Script Date: 14-12-21 11:44:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FactCommand](
	[id] [numeric](18, 0) NOT NULL,
	[price] [numeric](18, 0) NOT NULL,
	[freight] [numeric](18, 0) NOT NULL,
	[product_key] [numeric](18, 0) NOT NULL,
	[shipper_key] [numeric](18, 0) NOT NULL,
	[ship_adress_key] [numeric](18, 0) NOT NULL,
	[shop_key] [numeric](18, 0) NOT NULL,
	[shop_adress_key] [numeric](18, 0) NOT NULL,
	[employee_key] [numeric](18, 0) NOT NULL,
	[client_key] [numeric](18, 0) NOT NULL,
	[order_date_key] [numeric](18, 0) NOT NULL,
	[required_date_key] [numeric](18, 0) NOT NULL,
	[shipped_date_key] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_FactCommand] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FactCommand]  WITH CHECK ADD  CONSTRAINT [FK_DimAdress_Ship] FOREIGN KEY([ship_adress_key])
REFERENCES [dbo].[DimAdress] ([Id])
GO

ALTER TABLE [dbo].[FactCommand] CHECK CONSTRAINT [FK_DimAdress_Ship]
GO

ALTER TABLE [dbo].[FactCommand]  WITH CHECK ADD  CONSTRAINT [FK_DimAdress_Shop] FOREIGN KEY([shop_adress_key])
REFERENCES [dbo].[DimAdress] ([Id])
GO

ALTER TABLE [dbo].[FactCommand] CHECK CONSTRAINT [FK_DimAdress_Shop]
GO

ALTER TABLE [dbo].[FactCommand]  WITH CHECK ADD  CONSTRAINT [FK_DimClient] FOREIGN KEY([client_key])
REFERENCES [dbo].[DimClient] ([Id])
GO

ALTER TABLE [dbo].[FactCommand] CHECK CONSTRAINT [FK_DimClient]
GO

ALTER TABLE [dbo].[FactCommand]  WITH CHECK ADD  CONSTRAINT [FK_DimDate_Order] FOREIGN KEY([order_date_key])
REFERENCES [dbo].[DimDate] ([Id])
GO

ALTER TABLE [dbo].[FactCommand] CHECK CONSTRAINT [FK_DimDate_Order]
GO

ALTER TABLE [dbo].[FactCommand]  WITH CHECK ADD  CONSTRAINT [FK_DimDate_Required] FOREIGN KEY([required_date_key])
REFERENCES [dbo].[DimDate] ([Id])
GO

ALTER TABLE [dbo].[FactCommand] CHECK CONSTRAINT [FK_DimDate_Required]
GO

ALTER TABLE [dbo].[FactCommand]  WITH CHECK ADD  CONSTRAINT [FK_DimDate_Shipped] FOREIGN KEY([shipped_date_key])
REFERENCES [dbo].[DimDate] ([Id])
GO

ALTER TABLE [dbo].[FactCommand] CHECK CONSTRAINT [FK_DimDate_Shipped]
GO

ALTER TABLE [dbo].[FactCommand]  WITH CHECK ADD  CONSTRAINT [FK_DimEmployee] FOREIGN KEY([employee_key])
REFERENCES [dbo].[DimEmployee] ([Id])
GO

ALTER TABLE [dbo].[FactCommand] CHECK CONSTRAINT [FK_DimEmployee]
GO

ALTER TABLE [dbo].[FactCommand]  WITH CHECK ADD  CONSTRAINT [FK_DimProduct] FOREIGN KEY([product_key])
REFERENCES [dbo].[DimProduct] ([Id])
GO

ALTER TABLE [dbo].[FactCommand] CHECK CONSTRAINT [FK_DimProduct]
GO

ALTER TABLE [dbo].[FactCommand]  WITH CHECK ADD  CONSTRAINT [FK_DimShipper] FOREIGN KEY([shipper_key])
REFERENCES [dbo].[DimShipper] ([Id])
GO

ALTER TABLE [dbo].[FactCommand] CHECK CONSTRAINT [FK_DimShipper]
GO

ALTER TABLE [dbo].[FactCommand]  WITH CHECK ADD  CONSTRAINT [FK_DimShop] FOREIGN KEY([shop_key])
REFERENCES [dbo].[DimShop] ([Id])
GO

ALTER TABLE [dbo].[FactCommand] CHECK CONSTRAINT [FK_DimShop]
GO


