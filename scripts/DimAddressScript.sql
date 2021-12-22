USE [ProjetETLBI]
GO

/****** Object:  Table [dbo].[DimAdress]    Script Date: 09-12-21 18:39:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimAddress](
	[Id] [numeric](18, 0) IDENTITY(1, 1) NOT NULL,
	[Address] [nchar](60) NOT NULL,
	[City] [nchar](15) NOT NULL,
	[PostalCode] [nchar](10) NOT NULL,
	[Region] [nchar](15) NULL,
	[CountryNameFr] [nchar](15) NOT NULL,
	[CountryNameEn] [nchar](15) NOT NULL,
 CONSTRAINT [PK_DimAdress] PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DimAddress] ADD  CONSTRAINT [DF_DimAddress_CountryNameFr]  DEFAULT (N'Inconnu') FOR [CountryNameFr]
GO

