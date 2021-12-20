USE [ProjetETLBI]
GO

/****** Object:  Table [dbo].[DimAdress]    Script Date: 09-12-21 18:39:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimAdress](
	[Id] [numeric](18, 0) NOT NULL,
	[Locality] [nchar](15) NOT NULL,
	[Code] [numeric](18, 0) NOT NULL,
	[CountryId] [numeric](18, 0) NOT NULL,
	[CountryNameFr] [nchar](15) NOT NULL,
	[CountryNameEn] [nchar](15) NOT NULL,
 CONSTRAINT [PK_DimAdress] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


