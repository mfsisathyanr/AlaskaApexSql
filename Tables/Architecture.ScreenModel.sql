SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Architecture].[ScreenModel] (
		[ScreenModelId]      [int] IDENTITY(1, 1) NOT NULL,
		[ModelName]          [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[ActionDateTime]     [datetime2](7) NOT NULL,
		CONSTRAINT [PK_ScreenDomainModel]
		PRIMARY KEY
		CLUSTERED
		([ScreenModelId])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Architecture].[ScreenModel]
	ADD
	CONSTRAINT [DF__ScreenMod__Actio__477199F1]
	DEFAULT (getdate()) FOR [ActionDateTime]
GO
ALTER TABLE [Architecture].[ScreenModel] SET (LOCK_ESCALATION = TABLE)
GO
