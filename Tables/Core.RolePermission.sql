SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [Core].[RolePermission] (
		[RolePermissionId]     [int] IDENTITY(1, 1) NOT NULL,
		[RoleId]               [int] NOT NULL,
		[ScreenId]             [int] NOT NULL,
		[IsRead]               [bit] NOT NULL,
		[IsReadWrite]          [bit] NOT NULL,
		[ActionDateTime]       [datetime2](7) NOT NULL,
		CONSTRAINT [_RolePermission]
		PRIMARY KEY
		CLUSTERED
		([RolePermissionId])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Core].[RolePermission]
	ADD
	CONSTRAINT [RolePermissionDefaultActionDateTime]
	DEFAULT (getdate()) FOR [ActionDateTime]
GO
ALTER TABLE [Core].[RolePermission]
	WITH CHECK
	ADD CONSTRAINT [FK_RolePermission_Screen]
	FOREIGN KEY ([ScreenId]) REFERENCES [Architecture].[Screen] ([ScreenId])
ALTER TABLE [Core].[RolePermission]
	CHECK CONSTRAINT [FK_RolePermission_Screen]

GO
ALTER TABLE [Core].[RolePermission] SET (LOCK_ESCALATION = TABLE)
GO
