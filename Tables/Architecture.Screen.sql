SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Architecture].[Screen] (
		[ScreenId]               [int] IDENTITY(1, 1) NOT NULL,
		[ScreenName]             [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Description]            [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[IsExistAlert]           [bit] NOT NULL,
		[IsAutoPreviousInfo]     [bit] NOT NULL,
		[IsPreviousInfo]         [bit] NOT NULL,
		[IsHistoryInfo]          [bit] NOT NULL,
		[DefaultCss]             [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ScreenLevel]            [tinyint] NULL,
		[ActionDateTime]         [datetime2](7) NOT NULL,
		CONSTRAINT [PK_ScreenConfig]
		PRIMARY KEY
		CLUSTERED
		([ScreenId])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [Architecture].[Screen]
	ADD
	CONSTRAINT [DF__Screen__ActionDa__4589517F]
	DEFAULT (getdate()) FOR [ActionDateTime]
GO
ALTER TABLE [Architecture].[Screen] SET (LOCK_ESCALATION = TABLE)
GO
