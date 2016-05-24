SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Core].[LookupValue] (
		[LookupValueId]       [int] IDENTITY(1, 1) NOT NULL,
		[LookupTypeId]        [int] NOT NULL,
		[LookupValueName]     [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[DisplaySequence]     [tinyint] NULL,
		[ActionDateTime]      [datetime2](7) NOT NULL,
		CONSTRAINT [PK_LOfficeLookupValue]
		PRIMARY KEY
		CLUSTERED
		([LookupValueId])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Core].[LookupValue]
	ADD
	CONSTRAINT [DF__LookupVal__Actio__4865BE2A]
	DEFAULT (getdate()) FOR [ActionDateTime]
GO
ALTER TABLE [Core].[LookupValue]
	ADD
	CONSTRAINT [DF_LookupValue_DisplaySequence]
	DEFAULT ((1)) FOR [DisplaySequence]
GO
ALTER TABLE [Core].[LookupValue]
	WITH CHECK
	ADD CONSTRAINT [FK_LookupValue_LookupType]
	FOREIGN KEY ([LookupTypeId]) REFERENCES [Core].[LookupType] ([LookupTypeId])
ALTER TABLE [Core].[LookupValue]
	CHECK CONSTRAINT [FK_LookupValue_LookupType]

GO
CREATE NONCLUSTERED INDEX [IX_LookupValue]
	ON [Core].[LookupValue] ([LookupValueName])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_LookupValue_TypeID]
	ON [Core].[LookupValue] ([LookupTypeId])
	ON [PRIMARY]
GO
ALTER TABLE [Core].[LookupValue] SET (LOCK_ESCALATION = TABLE)
GO
