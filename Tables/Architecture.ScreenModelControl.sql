SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Architecture].[ScreenModelControl] (
		[ScreenModelControlId]     [int] IDENTITY(1, 1) NOT NULL,
		[ScreenModelId]            [int] NOT NULL,
		[ModelProperty]            [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[ControlTypeId]            [int] NOT NULL,
		[ActionDateTime]           [datetime2](7) NOT NULL,
		[LookUpTypeId]             [int] NULL,
		[MetaInformation]          [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_ScreenDomainModelControl]
		PRIMARY KEY
		CLUSTERED
		([ScreenModelControlId])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [Architecture].[ScreenModelControl]
	ADD
	CONSTRAINT [DF__ScreenMod__Actio__4959E263]
	DEFAULT (getdate()) FOR [ActionDateTime]
GO
ALTER TABLE [Architecture].[ScreenModelControl]
	WITH CHECK
	ADD CONSTRAINT [FK_ScreenDomainModelControl_ScreenDomainModel]
	FOREIGN KEY ([ScreenModelId]) REFERENCES [Architecture].[ScreenModel] ([ScreenModelId])
ALTER TABLE [Architecture].[ScreenModelControl]
	CHECK CONSTRAINT [FK_ScreenDomainModelControl_ScreenDomainModel]

GO
ALTER TABLE [Architecture].[ScreenModelControl]
	WITH CHECK
	ADD CONSTRAINT [FK_ScreenModelControl_LookupType]
	FOREIGN KEY ([LookUpTypeId]) REFERENCES [Core].[LookupType] ([LookupTypeId])
ALTER TABLE [Architecture].[ScreenModelControl]
	CHECK CONSTRAINT [FK_ScreenModelControl_LookupType]

GO
ALTER TABLE [Architecture].[ScreenModelControl] SET (LOCK_ESCALATION = TABLE)
GO
