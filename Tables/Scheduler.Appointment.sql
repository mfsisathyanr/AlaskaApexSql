SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Scheduler].[Appointment] (
		[AppointmentId]               [int] IDENTITY(1, 1) NOT NULL,
		[StartTime]                   [time](7) NOT NULL,
		[EndTime]                     [time](7) NOT NULL,
		[ProviderID]                  [int] NOT NULL,
		[PatientID]                   [int] NOT NULL,
		[AppointmentTypeID]           [int] NOT NULL,
		[StatusID]                    [int] NOT NULL,
		[Comments]                    [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[RemindPatient]               [bit] NOT NULL,
		[ActionDateTime]              [datetime2](7) NOT NULL,
		[AppointmentDate]             [date] NOT NULL,
		[IsBlock]                     [tinyint] NULL,
		[BlockID]                     [int] NOT NULL,
		[IsRecurrenceAppointment]     [tinyint] NULL,
		[RecurrenceAppointmentId]     [int] NULL,
		[PreviousAppointmentDate]     [date] NULL,
		[IsEmailReminderSent]         [tinyint] NOT NULL,
		[IsTextReminder]              [tinyint] NULL,
		CONSTRAINT [_Appointments]
		PRIMARY KEY
		CLUSTERED
		([AppointmentId])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [Scheduler].[Appointment]
	ADD
	CONSTRAINT [AppointmentDefaultActionDateTime]
	DEFAULT (getdate()) FOR [ActionDateTime]
GO
ALTER TABLE [Scheduler].[Appointment]
	ADD
	CONSTRAINT [DF__Appointme__IsEma__29E1370A]
	DEFAULT ((0)) FOR [IsEmailReminderSent]
GO
ALTER TABLE [Scheduler].[Appointment]
	WITH NOCHECK
	ADD CONSTRAINT [AppointmentTypesAppointmentsAppointmentTypeID]
	FOREIGN KEY ([AppointmentTypeID]) REFERENCES [Scheduler].[AppointmentType] ([AppointmentTypeId])
ALTER TABLE [Scheduler].[Appointment]
	CHECK CONSTRAINT [AppointmentTypesAppointmentsAppointmentTypeID]

GO
ALTER TABLE [Scheduler].[Appointment] SET (LOCK_ESCALATION = TABLE)
GO
