SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Scheduler].[AppointmentType] (
		[AppointmentTypeId]     [int] IDENTITY(1, 1) NOT NULL,
		[AppointmentType]       [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Duration]              [time](7) NOT NULL,
		[BackgroundColor]       [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ProviderID]            [int] NOT NULL,
		[ActionDateTime]        [datetime2](7) NOT NULL,
		CONSTRAINT [_AppointmentTypes]
		PRIMARY KEY
		CLUSTERED
		([AppointmentTypeId])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Scheduler].[AppointmentType]
	ADD
	CONSTRAINT [AppointmentTypeDefaultActionDateTime]
	DEFAULT (getdate()) FOR [ActionDateTime]
GO
ALTER TABLE [Scheduler].[AppointmentType] SET (LOCK_ESCALATION = TABLE)
GO
