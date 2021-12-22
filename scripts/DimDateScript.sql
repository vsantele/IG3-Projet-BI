USE [ProjetETLBI]
GO

/****** Object:  Table [dbo].[DimDate]    Script Date: 09-12-21 19:14:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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


