SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Core].[Practice] (
		[PracticeId]           [int] IDENTITY(1, 1) NOT NULL,
		[PracticeName]         [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[POS]                  [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[PracticeNPI]          [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[NPIType]              [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[TaxonomyCode]         [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[TaxId]                [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[PracticeType]         [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[CLIA]                 [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[CLIAExpiry]           [date] NULL,
		[EIN]                  [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[PracticeTimeZone]     [datetimeoffset](7) NULL,
		[ActionDateTime]       [datetime2](7) NOT NULL,
		CONSTRAINT [PK_Practice]
		PRIMARY KEY
		CLUSTERED
		([PracticeId])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Core].[Practice]
	ADD
	CONSTRAINT [DefaultActionDateTime]
	DEFAULT (getdate()) FOR [ActionDateTime]
GO
ALTER TABLE [Core].[Practice] SET (LOCK_ESCALATION = TABLE)
GO
