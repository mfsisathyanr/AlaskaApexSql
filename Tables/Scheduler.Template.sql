SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Scheduler].[Template] (
		[TemplateId]         [int] IDENTITY(1, 1) NOT NULL,
		[ProviderId]         [int] NOT NULL,
		[TemplateName]       [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[StartTime]          [time](7) NOT NULL,
		[EndTime]            [time](7) NOT NULL,
		[DaysApplicable]     [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[ActionDateTime]     [datetime2](7) NOT NULL,
		CONSTRAINT [PK_Templates]
		PRIMARY KEY
		CLUSTERED
		([TemplateId])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Scheduler].[Template]
	ADD
	CONSTRAINT [DF_Template_ActionDateTime]
	DEFAULT (getdate()) FOR [ActionDateTime]
GO
ALTER TABLE [Scheduler].[Template] SET (LOCK_ESCALATION = TABLE)
GO
