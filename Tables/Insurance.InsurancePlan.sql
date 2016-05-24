SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Insurance].[InsurancePlan] (
		[InsurancePlanId]        [int] IDENTITY(1, 1) NOT NULL,
		[MasterPersonId]         [int] NOT NULL,
		[InsuranceCarrierId]     [int] NOT NULL,
		[PlanId]                 [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[GroupId]                [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[PlanType]               [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[PayerNetwork]           [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[AuthRequired]           [bit] NULL,
		[CardFront]              [varbinary](500) NULL,
		[CardBack]               [varbinary](500) NULL,
		[SubscriberId]           [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[IsPrimary]              [bit] NOT NULL,
		[CallforBenefits]        [bit] NULL,
		[FaxClaims]              [bit] NULL,
		[EffectiveDate]          [date] NULL,
		[TerminationDate]        [date] NOT NULL,
		[RelationshipId]         [int] NULL,
		[GuarantorId]            [int] NULL,
		[SubscriberName]         [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[DeductibleAmount]       [money] NULL,
		[MaxOOP]                 [money] NULL,
		[CoInsurance]            [money] NULL,
		[CoPay]                  [money] NULL,
		[IsActive]               [bit] NOT NULL,
		[ActionDateTime]         [datetime2](7) NOT NULL,
		CONSTRAINT [PK_InsurancePlan]
		PRIMARY KEY
		CLUSTERED
		([InsurancePlanId])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Insurance].[InsurancePlan]
	ADD
	CONSTRAINT [DF_InsurancePlan_ActionDateTime]
	DEFAULT (getdate()) FOR [ActionDateTime]
GO
ALTER TABLE [Insurance].[InsurancePlan]
	WITH CHECK
	ADD CONSTRAINT [FK_InsurancePlan_MaterPersonIndex]
	FOREIGN KEY ([MasterPersonId]) REFERENCES [Core].[MasterPerson] ([MasterPersonId])
ALTER TABLE [Insurance].[InsurancePlan]
	CHECK CONSTRAINT [FK_InsurancePlan_MaterPersonIndex]

GO
CREATE NONCLUSTERED INDEX [IX_InsurancePlan]
	ON [Insurance].[InsurancePlan] ([MasterPersonId])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_InsurancePlan_1]
	ON [Insurance].[InsurancePlan] ([IsActive])
	ON [PRIMARY]
GO
ALTER TABLE [Insurance].[InsurancePlan] SET (LOCK_ESCALATION = TABLE)
GO
