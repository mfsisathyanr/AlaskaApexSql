SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Architecture].[Validation] (
		[ValidationId]       [int] IDENTITY(1, 1) NOT NULL,
		[ValidationRule]     [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Description]        [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Value]              [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Message]            [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_Validation]
		PRIMARY KEY
		CLUSTERED
		([ValidationId])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [Architecture].[Validation] SET (LOCK_ESCALATION = TABLE)
GO
