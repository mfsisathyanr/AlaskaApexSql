SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Architecture].[ScreenHtmlControl] (
		[ScreenHtmlControlId]     [int] IDENTITY(1, 1) NOT NULL,
		[ScreenId]                [int] NOT NULL,
		[ControlId]               [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ControlTypeId]           [int] NOT NULL,
		[TextValue]               [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ActionUrl]               [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[SortPriority]            [smallint] NULL,
		[ActionDateTime]          [datetime2](7) NOT NULL,
		CONSTRAINT [PK_ScreenNonDataTypeControl]
		PRIMARY KEY
		CLUSTERED
		([ScreenHtmlControlId])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Architecture].[ScreenHtmlControl]
	ADD
	CONSTRAINT [DF__ScreenHtm__Actio__4B422AD5]
	DEFAULT (getdate()) FOR [ActionDateTime]
GO
ALTER TABLE [Architecture].[ScreenHtmlControl]
	WITH CHECK
	ADD CONSTRAINT [FK_ScreenNonDataTypeControl_ScreenConfig]
	FOREIGN KEY ([ScreenId]) REFERENCES [Architecture].[Screen] ([ScreenId])
ALTER TABLE [Architecture].[ScreenHtmlControl]
	CHECK CONSTRAINT [FK_ScreenNonDataTypeControl_ScreenConfig]

GO
ALTER TABLE [Architecture].[ScreenHtmlControl] SET (LOCK_ESCALATION = TABLE)
GO
