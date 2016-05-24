SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Complaints].[ChiefComplaintList] (
		[ChiefComplaintListId]     [int] IDENTITY(1, 1) NOT NULL,
		[ChiefComplaintName]       [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[ActionDateTime]           [datetime2](7) NOT NULL,
		CONSTRAINT [PK_ChiefComplaintList]
		PRIMARY KEY
		CLUSTERED
		([ChiefComplaintListId])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Complaints].[ChiefComplaintList]
	ADD
	CONSTRAINT [DF__ChiefComp__Actio__43A1090D]
	DEFAULT (getdate()) FOR [ActionDateTime]
GO
ALTER TABLE [Complaints].[ChiefComplaintList] SET (LOCK_ESCALATION = TABLE)
GO
