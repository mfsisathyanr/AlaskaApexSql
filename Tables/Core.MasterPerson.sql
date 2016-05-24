SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Core].[MasterPerson] (
		[MasterPersonId]     [int] IDENTITY(1, 1) NOT NULL,
		[FirstName]          [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[MiddleName]         [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[LastName]           [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[NickName]           [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Gender]             [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[DateOfBirth]        [date] NOT NULL,
		[SSN]                [char](9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ActionDateTime]     [datetime2](7) NOT NULL,
		[Prefix]             [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Suffix]             [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[MaritalStatus]      [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_MaterPersonIndex]
		PRIMARY KEY
		CLUSTERED
		([MasterPersonId])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Core].[MasterPerson]
	ADD
	CONSTRAINT [DF_MaterPersonIndex_ActionDateTime]
	DEFAULT (getdate()) FOR [ActionDateTime]
GO
ALTER TABLE [Core].[MasterPerson] SET (LOCK_ESCALATION = TABLE)
GO
