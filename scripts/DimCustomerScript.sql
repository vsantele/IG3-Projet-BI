USE [ProjetETLBI]
GO

/****** Object:  Table [dbo].[DimCustomer]    Script Date: 09-12-21 18:45:31 ******/
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
