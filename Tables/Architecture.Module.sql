SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Architecture].[Module] (
		[ModuleId]           [int] IDENTITY(1, 1) NOT NULL,
		[ModuleName]         [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[ModuleUrl]          [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Properties]         [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Parent]             [int] NULL,
		[ActionDateTime]     [datetime2](7) NOT NULL,
		CONSTRAINT [PK_Module]
		PRIMARY KEY
		CLUSTERED
		([ModuleId])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [Architecture].[Module]
	ADD
	CONSTRAINT [DF__Module__ActionDa__4C364F0E]
	DEFAULT (getdate()) FOR [ActionDateTime]
GO
ALTER TABLE [Architecture].[Module]
	WITH CHECK
	ADD CONSTRAINT [FK_Module_Module]
	FOREIGN KEY ([Parent]) REFERENCES [Architecture].[Module] ([ModuleId])
ALTER TABLE [Architecture].[Module]
	CHECK CONSTRAINT [FK_Module_Module]

GO
ALTER TABLE [Architecture].[Module] SET (LOCK_ESCALATION = TABLE)
GO
