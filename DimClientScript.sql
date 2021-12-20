USE [ProjetETLBI]
GO

/****** Object:  Table [dbo].[DimClient]    Script Date: 09-12-21 18:45:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimClient](
	[Id] [numeric](18, 0) NOT NULL,
	[CompanyName] [nchar](15) NOT NULL,
	[ContactName] [nchar](15) NULL,
	[ContactTitle] [nchar](15) NULL,
 CONSTRAINT [PK_DimClient] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


