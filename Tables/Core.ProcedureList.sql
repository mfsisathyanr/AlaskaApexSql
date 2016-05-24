SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Core].[ProcedureList] (
		[ProcedureListId]     [int] IDENTITY(1, 1) NOT NULL,
		[ProcedureName]       [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[ActionDateTime]      [datetime2](7) NOT NULL,
		CONSTRAINT [PK_ProcedureList]
		PRIMARY KEY
		CLUSTERED
		([ProcedureListId])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Core].[ProcedureList]
	ADD
	CONSTRAINT [ProcedureListDefaultActionDateTime]
	DEFAULT (getdate()) FOR [ActionDateTime]
GO
ALTER TABLE [Core].[ProcedureList] SET (LOCK_ESCALATION = TABLE)
GO
