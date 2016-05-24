SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Core].[Facility] (
		[FacilityId]         [int] IDENTITY(1, 1) NOT NULL,
		[PracticeId]         [int] NOT NULL,
		[FacilityName]       [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[POS]                [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[FacilityNPI]        [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[NPIType]            [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[TaxonomyCode]       [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[TaxId]              [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[FacilityType]       [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ActionDateTime]     [datetime2](7) NOT NULL,
		CONSTRAINT [PK_Facility]
		PRIMARY KEY
		CLUSTERED
		([FacilityId])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Core].[Facility]
	ADD
	CONSTRAINT [FacilityDefaultActionDateTime]
	DEFAULT (getdate()) FOR [ActionDateTime]
GO
ALTER TABLE [Core].[Facility]
	WITH CHECK
	ADD CONSTRAINT [FK_Facility_Practice]
	FOREIGN KEY ([PracticeId]) REFERENCES [Core].[Practice] ([PracticeId])
ALTER TABLE [Core].[Facility]
	CHECK CONSTRAINT [FK_Facility_Practice]

GO
ALTER TABLE [Core].[Facility] SET (LOCK_ESCALATION = TABLE)
GO
