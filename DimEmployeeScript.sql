USE [ProjetETLBI]
GO

/****** Object:  Table [dbo].[DimEmployee]    Script Date: 14-12-21 11:44:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimEmployee](
	[Id] [numeric](18, 0) NOT NULL,
	[FirstNAme] [nchar](15) NOT NULL,
	[LastName] [nchar](15) NOT NULL,
	[Street] [nchar](15) NOT NULL,
	[BirthDate] [date] NOT NULL,
 CONSTRAINT [PK_DimEmployee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


