SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Core].[ZipDetails] (
		[ZipDetailsId]       [int] IDENTITY(1, 1) NOT NULL,
		[ZipCode]            [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[City]               [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[State]              [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[County]             [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Country]            [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[ActionDateTime]     [datetime2](7) NOT NULL,
		CONSTRAINT [_ZipDetails]
		PRIMARY KEY
		CLUSTERED
		([ZipDetailsId])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Core].[ZipDetails]
	ADD
	CONSTRAINT [DF__ZipDetail__Actio__467D75B8]
	DEFAULT (getdate()) FOR [ActionDateTime]
GO
ALTER TABLE [Core].[ZipDetails] SET (LOCK_ESCALATION = TABLE)
GO
