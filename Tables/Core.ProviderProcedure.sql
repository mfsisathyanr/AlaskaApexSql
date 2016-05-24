SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [Core].[ProviderProcedure] (
		[ProviderProcedureId]     [int] IDENTITY(1, 1) NOT NULL,
		[ProcedureListId]         [int] NOT NULL,
		[ProviderId]              [int] NOT NULL,
		[ActionDateTime]          [datetime2](7) NOT NULL,
		CONSTRAINT [PK_ProviderProcedure]
		PRIMARY KEY
		CLUSTERED
		([ProviderProcedureId])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Core].[ProviderProcedure]
	ADD
	CONSTRAINT [ProviderProcedureDefaultActionDateTime]
	DEFAULT (getdate()) FOR [ActionDateTime]
GO
ALTER TABLE [Core].[ProviderProcedure]
	WITH CHECK
	ADD CONSTRAINT [FK_ProviderProcedure_ProcedureList]
	FOREIGN KEY ([ProviderId]) REFERENCES [Core].[MasterPerson] ([MasterPersonId])
ALTER TABLE [Core].[ProviderProcedure]
	CHECK CONSTRAINT [FK_ProviderProcedure_ProcedureList]

GO
ALTER TABLE [Core].[ProviderProcedure]
	WITH CHECK
	ADD CONSTRAINT [FK_ProviderProcedure_ProcedureList1]
	FOREIGN KEY ([ProcedureListId]) REFERENCES [Core].[ProcedureList] ([ProcedureListId])
ALTER TABLE [Core].[ProviderProcedure]
	CHECK CONSTRAINT [FK_ProviderProcedure_ProcedureList1]

GO
ALTER TABLE [Core].[ProviderProcedure] SET (LOCK_ESCALATION = TABLE)
GO
