SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Architecture].[ControlValidation] (
		[ControlValidationId]     [int] IDENTITY(1, 1) NOT NULL,
		[ControlId]               [int] NOT NULL,
		[ValidationId]            [int] NOT NULL,
		[ValidationMessage]       [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_ControlValidation]
		PRIMARY KEY
		CLUSTERED
		([ControlValidationId])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Architecture].[ControlValidation]
	WITH CHECK
	ADD CONSTRAINT [FK_ControlValidation_ScreenModelControl]
	FOREIGN KEY ([ControlId]) REFERENCES [Architecture].[ScreenModelControl] ([ScreenModelControlId])
ALTER TABLE [Architecture].[ControlValidation]
	CHECK CONSTRAINT [FK_ControlValidation_ScreenModelControl]

GO
ALTER TABLE [Architecture].[ControlValidation]
	WITH CHECK
	ADD CONSTRAINT [FK_ControlValidation_Validation]
	FOREIGN KEY ([ValidationId]) REFERENCES [Architecture].[Validation] ([ValidationId])
ALTER TABLE [Architecture].[ControlValidation]
	CHECK CONSTRAINT [FK_ControlValidation_Validation]

GO
ALTER TABLE [Architecture].[ControlValidation] SET (LOCK_ESCALATION = TABLE)
GO
