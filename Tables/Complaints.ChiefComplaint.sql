SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [Complaints].[ChiefComplaint] (
		[ChiefComplaintId]         [int] IDENTITY(1, 1) NOT NULL,
		[ChiefComplaintListId]     [int] NOT NULL,
		[PatientId]                [int] NOT NULL,
		[ActionDateTime]           [datetime2](7) NOT NULL,
		CONSTRAINT [PK_PatientChiefComplaint]
		PRIMARY KEY
		CLUSTERED
		([ChiefComplaintId])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Complaints].[ChiefComplaint]
	ADD
	CONSTRAINT [DF__ChiefComp__Actio__42ACE4D4]
	DEFAULT (getdate()) FOR [ActionDateTime]
GO
ALTER TABLE [Complaints].[ChiefComplaint]
	WITH CHECK
	ADD CONSTRAINT [FK_ChiefComplaint_MasterPerson]
	FOREIGN KEY ([PatientId]) REFERENCES [Core].[MasterPerson] ([MasterPersonId])
ALTER TABLE [Complaints].[ChiefComplaint]
	CHECK CONSTRAINT [FK_ChiefComplaint_MasterPerson]

GO
ALTER TABLE [Complaints].[ChiefComplaint]
	WITH CHECK
	ADD CONSTRAINT [FK_PatientChiefComplaint_ChiefComplaintList]
	FOREIGN KEY ([ChiefComplaintListId]) REFERENCES [Complaints].[ChiefComplaintList] ([ChiefComplaintListId])
ALTER TABLE [Complaints].[ChiefComplaint]
	CHECK CONSTRAINT [FK_PatientChiefComplaint_ChiefComplaintList]

GO
ALTER TABLE [Complaints].[ChiefComplaint] SET (LOCK_ESCALATION = TABLE)
GO
