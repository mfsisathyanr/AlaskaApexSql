SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Core].[Patient] (
		[PatientId]                       [int] IDENTITY(1, 1) NOT NULL,
		[MasterPersonId]                  [int] NOT NULL,
		[PatientType]                     [int] NULL,
		[PatientStatus]                   [int] NOT NULL,
		[PatientStatusDate]               [date] NULL,
		[PrimaryPorviderId]               [int] NULL,
		[SecondaryProviderId]             [int] NULL,
		[ChartNumber]                     [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[CellCarrierId]                   [int] NULL,
		[PortalActive]                    [bit] NULL,
		[PortalInviteSent]                [datetime] NULL,
		[ReferralSource]                  [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Messages]                        [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[RaceId]                          [int] NULL,
		[EthnicityId]                     [int] NULL,
		[LanguageId]                      [int] NULL,
		[GovtIdFront]                     [varbinary](500) NULL,
		[GovtIdBack]                      [varbinary](500) NULL,
		[ReferringProvider]               [int] NULL,
		[PrimaryCareProvider]             [int] NULL,
		[GuardianName]                    [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[PowerOfAttorney]                 [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[PCA]                             [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Attorney]                        [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[CareCoordinator]                 [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[IsIdOnFile]                      [bit] NULL,
		[IsInsuranceOnFile]               [bit] NULL,
		[IsInitialMrRecieved]             [bit] NULL,
		[IsConsentForCare]                [bit] NULL,
		[IsCommunicationAuzthorized]      [bit] NOT NULL,
		[ReleaseRecordsTo]                [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[IsNeuroQuestionnaire]            [bit] NULL,
		[IsSleepQuestionnaire]            [bit] NULL,
		[IsIpmQuestionnaire]              [bit] NULL,
		[IsIsNeuroPyschQuestionnaire]     [bit] NULL,
		[IsPolicyReceiptAck]              [bit] NULL,
		[ActionDateTime]                  [datetime2](7) NOT NULL,
		CONSTRAINT [PK_Patient]
		PRIMARY KEY
		CLUSTERED
		([PatientId])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [Core].[Patient]
	ADD
	CONSTRAINT [PatientDefaultActionDateTime]
	DEFAULT (getdate()) FOR [ActionDateTime]
GO
ALTER TABLE [Core].[Patient]
	WITH CHECK
	ADD CONSTRAINT [FK_Patient_LookupValue]
	FOREIGN KEY ([RaceId]) REFERENCES [Core].[LookupValue] ([LookupValueId])
ALTER TABLE [Core].[Patient]
	CHECK CONSTRAINT [FK_Patient_LookupValue]

GO
ALTER TABLE [Core].[Patient]
	WITH CHECK
	ADD CONSTRAINT [FK_Patient_LookupValue1]
	FOREIGN KEY ([EthnicityId]) REFERENCES [Core].[LookupValue] ([LookupValueId])
ALTER TABLE [Core].[Patient]
	CHECK CONSTRAINT [FK_Patient_LookupValue1]

GO
ALTER TABLE [Core].[Patient]
	WITH CHECK
	ADD CONSTRAINT [FK_Patient_LookupValue2]
	FOREIGN KEY ([LanguageId]) REFERENCES [Core].[LookupValue] ([LookupValueId])
ALTER TABLE [Core].[Patient]
	CHECK CONSTRAINT [FK_Patient_LookupValue2]

GO
ALTER TABLE [Core].[Patient]
	WITH CHECK
	ADD CONSTRAINT [FK_Patient_MasterPersonIndex]
	FOREIGN KEY ([MasterPersonId]) REFERENCES [Core].[MasterPerson] ([MasterPersonId])
ALTER TABLE [Core].[Patient]
	CHECK CONSTRAINT [FK_Patient_MasterPersonIndex]

GO
ALTER TABLE [Core].[Patient] SET (LOCK_ESCALATION = TABLE)
GO
