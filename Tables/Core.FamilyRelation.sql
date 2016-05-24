SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [Core].[FamilyRelation] (
		[FamilyRelationId]     [int] IDENTITY(1, 1) NOT NULL,
		[PatientId]            [int] NOT NULL,
		[FamilyMemberId]       [int] NOT NULL,
		[RelationshipId]       [int] NOT NULL,
		[ActionDateTime]       [datetime2](7) NOT NULL,
		CONSTRAINT [PK_PatientFamilyRelation]
		PRIMARY KEY
		CLUSTERED
		([FamilyRelationId])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Core].[FamilyRelation]
	ADD
	CONSTRAINT [DF__FamilyRel__Actio__44952D46]
	DEFAULT (getdate()) FOR [ActionDateTime]
GO
ALTER TABLE [Core].[FamilyRelation]
	WITH CHECK
	ADD CONSTRAINT [FK_PatientFamilyRelation_MasterPersonIndex]
	FOREIGN KEY ([FamilyMemberId]) REFERENCES [Core].[MasterPerson] ([MasterPersonId])
ALTER TABLE [Core].[FamilyRelation]
	CHECK CONSTRAINT [FK_PatientFamilyRelation_MasterPersonIndex]

GO
ALTER TABLE [Core].[FamilyRelation]
	WITH CHECK
	ADD CONSTRAINT [FK_PatientFamilyRelation_PatientFamilyRelation]
	FOREIGN KEY ([PatientId]) REFERENCES [Core].[MasterPerson] ([MasterPersonId])
ALTER TABLE [Core].[FamilyRelation]
	CHECK CONSTRAINT [FK_PatientFamilyRelation_PatientFamilyRelation]

GO
ALTER TABLE [Core].[FamilyRelation] SET (LOCK_ESCALATION = TABLE)
GO
