SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Core].[Address] (
		[AddressId]          [int] IDENTITY(1, 1) NOT NULL,
		[TableId]            [int] NULL,
		[EntityId]           [int] NULL,
		[AddressType]        [int] NULL,
		[AddressLine1]       [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[AddressLine2]       [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[AddressLine3]       [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[City]               [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ZipCode]            [varchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[State]              [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ActionDateTime]     [datetime2](7) NOT NULL,
		CONSTRAINT [PK_Address]
		PRIMARY KEY
		CLUSTERED
		([AddressId])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Core].[Address]
	ADD
	CONSTRAINT [DF_Address_ActionDateTime]
	DEFAULT (getdate()) FOR [ActionDateTime]
GO
ALTER TABLE [Core].[Address]
	WITH CHECK
	ADD CONSTRAINT [FK_Address_LookupValue]
	FOREIGN KEY ([TableId]) REFERENCES [Core].[LookupValue] ([LookupValueId])
ALTER TABLE [Core].[Address]
	CHECK CONSTRAINT [FK_Address_LookupValue]

GO
CREATE NONCLUSTERED INDEX [IX_Address]
	ON [Core].[Address] ([EntityId])
	ON [PRIMARY]
GO
ALTER TABLE [Core].[Address] SET (LOCK_ESCALATION = TABLE)
GO
