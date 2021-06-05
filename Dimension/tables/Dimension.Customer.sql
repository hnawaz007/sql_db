USE [WideWorldImportersDW]
GO

/****** Object:  Table [Dimension].[Customer]    Script Date: 6/4/2021 10:49:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[Dimension].[Customer]') AND type in (N'U'))

BEGIN
CREATE TABLE [Dimension].[Customer](
	[Customer Key] [int] NOT NULL,
	[WWI Customer ID] [int] NOT NULL,
	[Customer] [nvarchar](100) NOT NULL,
	[Bill To Customer] [nvarchar](100) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[Buying Group] [nvarchar](50) NOT NULL,
	[Primary Contact] [nvarchar](50) NOT NULL,
	[Postal Code] [nvarchar](10) NOT NULL,
	[Valid From] [datetime2](7) NOT NULL,
	[Valid To] [datetime2](7) NOT NULL,
	[Lineage Key] [int] NOT NULL
) ON [Primary]
End
GO

--First Change
IF NOT EXISTS(SELECT * FROM sys.objects WHERE type = 'PK' AND  name = 'PK_Dimension_Customer')
BEGIN
    ALTER TABLE [Dimension].[Customer]
    ADD CONSTRAINT PK_Dimension_Customer PRIMARY KEY CLUSTERED ([Customer Key] ASC)
END
---Second Change
ALTER TABLE [Dimension].[Customer] ADD  CONSTRAINT [DF_Dimension_Customer_Customer_Key]  
DEFAULT (NEXT VALUE FOR [Sequences].[CustomerKey]) FOR [Customer Key]
GO

