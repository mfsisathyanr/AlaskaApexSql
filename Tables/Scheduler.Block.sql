SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Scheduler].[Block] (
		[BlockId]             [int] IDENTITY(1, 1) NOT NULL,
		[BlockName]           [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[BackgroundColor]     [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ActionDateTime]      [datetime2](7) NOT NULL,
		[ProviderID]          [int] NOT NULL,
		[IsDefault]           [bit] NULL,
		[DayId]               [tinyint] NULL,
		CONSTRAINT [_Blocks]
		PRIMARY KEY
		CLUSTERED
		([BlockId])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Scheduler].[Block]
	ADD
	CONSTRAINT [BlockDefaultActionDateTime]
	DEFAULT (getdate()) FOR [ActionDateTime]
GO
ALTER TABLE [Scheduler].[Block]
	WITH CHECK
	ADD CONSTRAINT [FK_Block_MasterPerson]
	FOREIGN KEY ([ProviderID]) REFERENCES [Core].[MasterPerson] ([MasterPersonId])
ALTER TABLE [Scheduler].[Block]
	CHECK CONSTRAINT [FK_Block_MasterPerson]

GO
ALTER TABLE [Scheduler].[Block] SET (LOCK_ESCALATION = TABLE)
GO
