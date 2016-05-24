SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Core].[LookupType] (
		[LookupTypeId]       [int] IDENTITY(1, 1) NOT NULL,
		[LookupTypeName]     [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[ActionDateTime]     [datetime2](7) NOT NULL,
		CONSTRAINT [PK_LOfficeLookupType]
		PRIMARY KEY
		CLUSTERED
		([LookupTypeId])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Core].[LookupType]
	ADD
	CONSTRAINT [DF__LookupTyp__Actio__4A4E069C]
	DEFAULT (getdate()) FOR [ActionDateTime]
GO
ALTER TABLE [Core].[LookupType] SET (LOCK_ESCALATION = TABLE)
GO
