SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [Core].[ProviderInsurance] (
		[ProviderInsuranceId]     [int] IDENTITY(1, 1) NOT NULL,
		[InsuranceId]             [int] NOT NULL,
		[ProviderId]              [int] NOT NULL,
		[RenewalDate]             [date] NULL,
		[ActionDateTime]          [datetime2](7) NOT NULL,
		CONSTRAINT [PK_ProviderInsurance]
		PRIMARY KEY
		CLUSTERED
		([ProviderInsuranceId])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Core].[ProviderInsurance]
	ADD
	CONSTRAINT [ProviderInsuranceDefaultActionDateTime]
	DEFAULT (getdate()) FOR [ActionDateTime]
GO
ALTER TABLE [Core].[ProviderInsurance]
	WITH CHECK
	ADD CONSTRAINT [FK_ProviderInsurance_InsuranceCarrier]
	FOREIGN KEY ([InsuranceId]) REFERENCES [Insurance].[InsuranceCarrier] ([InsuranceCarrierId])
ALTER TABLE [Core].[ProviderInsurance]
	CHECK CONSTRAINT [FK_ProviderInsurance_InsuranceCarrier]

GO
ALTER TABLE [Core].[ProviderInsurance]
	WITH CHECK
	ADD CONSTRAINT [FK_ProviderInsurance_Provider]
	FOREIGN KEY ([ProviderId]) REFERENCES [Core].[Provider] ([ProviderId])
ALTER TABLE [Core].[ProviderInsurance]
	CHECK CONSTRAINT [FK_ProviderInsurance_Provider]

GO
ALTER TABLE [Core].[ProviderInsurance] SET (LOCK_ESCALATION = TABLE)
GO
