SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Core].[Provider] (
		[ProviderId]            [int] IDENTITY(1, 1) NOT NULL,
		[MasterPersonId]        [int] NOT NULL,
		[AlaskaLicense]         [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[ProviderNpi]           [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[NpiType]               [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[ProviderDea1]          [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[ProviderDea2]          [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[TaxonomyId1]           [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[TaxonomyId2]           [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[IssueDate]             [date] NULL,
		[EffectiveDate]         [date] NULL,
		[ExpirationDate]        [date] NULL,
		[ProfessionalTitle]     [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Program]               [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ProviderType]          [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ProviderStatus]        [bit] NULL,
		[BillingProvider]       [bit] NULL,
		[SureScriptsSpi]        [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[AMASpecialty]          [int] NULL,
		[AgeRange]              [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[CCPreferred]           [bit] NULL,
		[CCNonTreat]            [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ActionDateTime]        [datetime2](7) NOT NULL,
		CONSTRAINT [PK_Provider]
		PRIMARY KEY
		CLUSTERED
		([ProviderId])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Core].[Provider]
	ADD
	CONSTRAINT [ProviderDefaultActionDateTime]
	DEFAULT (getdate()) FOR [ActionDateTime]
GO
ALTER TABLE [Core].[Provider]
	WITH CHECK
	ADD CONSTRAINT [FK_Provider_LookupValue]
	FOREIGN KEY ([AMASpecialty]) REFERENCES [Core].[LookupValue] ([LookupValueId])
ALTER TABLE [Core].[Provider]
	CHECK CONSTRAINT [FK_Provider_LookupValue]

GO
ALTER TABLE [Core].[Provider]
	WITH CHECK
	ADD CONSTRAINT [FK_Provider_MasterPersonIndex]
	FOREIGN KEY ([MasterPersonId]) REFERENCES [Core].[MasterPerson] ([MasterPersonId])
ALTER TABLE [Core].[Provider]
	CHECK CONSTRAINT [FK_Provider_MasterPersonIndex]

GO
CREATE NONCLUSTERED INDEX [IX_Provider_MP]
	ON [Core].[Provider] ([MasterPersonId])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Provider_Npi]
	ON [Core].[Provider] ([ProviderNpi])
	ON [PRIMARY]
GO
ALTER TABLE [Core].[Provider] SET (LOCK_ESCALATION = TABLE)
GO
