SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Insurance].[InsuranceCarrier] (
		[InsuranceCarrierId]     [int] IDENTITY(1, 1) NOT NULL,
		[PracticeId]             [int] NOT NULL,
		[InsuranceName]          [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[ActionDateTime]         [datetime2](7) NOT NULL,
		CONSTRAINT [PK_InsuranceProvider]
		PRIMARY KEY
		CLUSTERED
		([InsuranceCarrierId])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Insurance].[InsuranceCarrier]
	ADD
	CONSTRAINT [InsuranceCarrierDefaultActionDateTime]
	DEFAULT (getdate()) FOR [ActionDateTime]
GO
ALTER TABLE [Insurance].[InsuranceCarrier]
	WITH CHECK
	ADD CONSTRAINT [FK_InsuranceProvider_Practice]
	FOREIGN KEY ([PracticeId]) REFERENCES [Core].[Practice] ([PracticeId])
ALTER TABLE [Insurance].[InsuranceCarrier]
	CHECK CONSTRAINT [FK_InsuranceProvider_Practice]

GO
ALTER TABLE [Insurance].[InsuranceCarrier] SET (LOCK_ESCALATION = TABLE)
GO
