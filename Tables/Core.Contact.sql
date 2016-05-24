SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Core].[Contact] (
		[ContactId]          [int] IDENTITY(1, 1) NOT NULL,
		[EntityId]           [int] NULL,
		[TableId]            [int] NULL,
		[ContactType]        [int] NULL,
		[ContactValue]       [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ActionDateTime]     [datetime2](7) NOT NULL,
		CONSTRAINT [PK_Contact]
		PRIMARY KEY
		CLUSTERED
		([ContactId])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Core].[Contact]
	ADD
	CONSTRAINT [DF_Contact_ActionDateTime]
	DEFAULT (getdate()) FOR [ActionDateTime]
GO
ALTER TABLE [Core].[Contact]
	WITH CHECK
	ADD CONSTRAINT [FK_Contact_LookupValue]
	FOREIGN KEY ([TableId]) REFERENCES [Core].[LookupValue] ([LookupValueId])
ALTER TABLE [Core].[Contact]
	CHECK CONSTRAINT [FK_Contact_LookupValue]

GO
CREATE NONCLUSTERED INDEX [IX_Contact]
	ON [Core].[Contact] ([EntityId])
	ON [PRIMARY]
GO
ALTER TABLE [Core].[Contact] SET (LOCK_ESCALATION = TABLE)
GO
