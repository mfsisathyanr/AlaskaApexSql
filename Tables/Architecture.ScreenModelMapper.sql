SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Architecture].[ScreenModelMapper] (
		[ScreenModelMapperId]      [int] IDENTITY(1, 1) NOT NULL,
		[ScreenId]                 [int] NOT NULL,
		[ScreenModelControlId]     [int] NOT NULL,
		[Description]              [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[LabelName]                [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[SortPriority]             [smallint] NULL,
		[DefaultCssClass]          [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[IsColumnFullWidth]        [bit] NULL,
		[ActionDateTime]           [datetime2](7) NOT NULL,
		CONSTRAINT [PK_ScreenControlsDbMapper_1]
		PRIMARY KEY
		CLUSTERED
		([ScreenModelMapperId])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Architecture].[ScreenModelMapper]
	ADD
	CONSTRAINT [DF__ScreenMod__Actio__41B8C09B]
	DEFAULT (getdate()) FOR [ActionDateTime]
GO
ALTER TABLE [Architecture].[ScreenModelMapper]
	WITH CHECK
	ADD CONSTRAINT [FK_ScreenControlsDbMapper_ScreenConfig]
	FOREIGN KEY ([ScreenId]) REFERENCES [Architecture].[Screen] ([ScreenId])
ALTER TABLE [Architecture].[ScreenModelMapper]
	CHECK CONSTRAINT [FK_ScreenControlsDbMapper_ScreenConfig]

GO
ALTER TABLE [Architecture].[ScreenModelMapper]
	WITH CHECK
	ADD CONSTRAINT [FK_ScreenModelMapper_ScreenModelControl]
	FOREIGN KEY ([ScreenModelControlId]) REFERENCES [Architecture].[ScreenModelControl] ([ScreenModelControlId])
ALTER TABLE [Architecture].[ScreenModelMapper]
	CHECK CONSTRAINT [FK_ScreenModelMapper_ScreenModelControl]

GO
ALTER TABLE [Architecture].[ScreenModelMapper] SET (LOCK_ESCALATION = TABLE)
GO
