SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Scheduler].[RecurrentAppointment] (
		[RecurrentAppointmentId]     [int] IDENTITY(1, 1) NOT NULL,
		[PatientId]                  [int] NOT NULL,
		[ProviderId]                 [int] NOT NULL,
		[RecurrenceRule]             [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[RecurrenceFrequency]        [tinyint] NULL,
		[EndAfter]                   [int] NULL,
		[EndOn]                      [datetime2](7) NULL,
		[RepeatBy]                   [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[RepeatOn]                   [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ActionDateTime]             [datetime2](7) NOT NULL,
		CONSTRAINT [PK_RecurrenceAppointments]
		PRIMARY KEY
		CLUSTERED
		([RecurrentAppointmentId])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Scheduler].[RecurrentAppointment]
	ADD
	CONSTRAINT [RecurrentAppointmentDefaultActionDateTime]
	DEFAULT (getdate()) FOR [ActionDateTime]
GO
ALTER TABLE [Scheduler].[RecurrentAppointment] SET (LOCK_ESCALATION = TABLE)
GO
