SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Architecture].[ControlType] (
		[ControlTypeId]          [int] IDENTITY(1, 1) NOT NULL,
		[ControlTypeElement]     [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[ActionDateTime]         [datetime2](7) NOT NULL,
		CONSTRAINT [PK_ControlType]
		PRIMARY KEY
		CLUSTERED
		([ControlTypeId])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Architecture].[ControlType]
	ADD
	CONSTRAINT [DF_ControlType_ActionDateTime]
	DEFAULT (getdate()) FOR [ActionDateTime]
GO
ALTER TABLE [Architecture].[ControlType] SET (LOCK_ESCALATION = TABLE)
GO
