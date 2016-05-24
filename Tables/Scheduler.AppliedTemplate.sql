SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [Scheduler].[AppliedTemplate] (
		[AppliedTemplateId]     [int] IDENTITY(1, 1) NOT NULL,
		[StartDate]             [date] NOT NULL,
		[EndDate]               [date] NOT NULL,
		[TemplateID]            [int] NOT NULL,
		[ActionDateTime]        [datetime2](7) NOT NULL,
		[ProviderID]            [int] NOT NULL,
		CONSTRAINT [_AppliedTemplates]
		PRIMARY KEY
		CLUSTERED
		([AppliedTemplateId])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Scheduler].[AppliedTemplate]
	ADD
	CONSTRAINT [AppliedTemplateDefaultActionDateTime]
	DEFAULT (getdate()) FOR [ActionDateTime]
GO
ALTER TABLE [Scheduler].[AppliedTemplate]
	WITH CHECK
	ADD CONSTRAINT [FK_AppliedTemplate_Template]
	FOREIGN KEY ([TemplateID]) REFERENCES [Scheduler].[Template] ([TemplateId])
ALTER TABLE [Scheduler].[AppliedTemplate]
	CHECK CONSTRAINT [FK_AppliedTemplate_Template]

GO
ALTER TABLE [Scheduler].[AppliedTemplate] SET (LOCK_ESCALATION = TABLE)
GO
