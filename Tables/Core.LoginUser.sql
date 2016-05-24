SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Core].[LoginUser] (
		[LoginUserId]        [int] IDENTITY(1, 1) NOT NULL,
		[MasterPersonId]     [int] NOT NULL,
		[UserName]           [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[ActionDateTime]     [datetime2](7) NOT NULL,
		[Password]           [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		CONSTRAINT [IX_M_USER_LOGIN_1]
		UNIQUE
		NONCLUSTERED
		([UserName])
		ON [PRIMARY],
		CONSTRAINT [UserLogin]
		PRIMARY KEY
		CLUSTERED
		([LoginUserId])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Core].[LoginUser]
	ADD
	CONSTRAINT [DF__LoginUser__Actio__4D2A7347]
	DEFAULT (getdate()) FOR [ActionDateTime]
GO
ALTER TABLE [Core].[LoginUser]
	WITH CHECK
	ADD CONSTRAINT [FK_LoginUser_MasterPersonIndex]
	FOREIGN KEY ([MasterPersonId]) REFERENCES [Core].[MasterPerson] ([MasterPersonId])
ALTER TABLE [Core].[LoginUser]
	CHECK CONSTRAINT [FK_LoginUser_MasterPersonIndex]

GO
ALTER TABLE [Core].[LoginUser] SET (LOCK_ESCALATION = TABLE)
GO
