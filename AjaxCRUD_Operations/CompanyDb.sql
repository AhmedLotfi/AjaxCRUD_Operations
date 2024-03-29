
USE [CompanyDb]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 9/6/2019 6:14:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Description] [nvarchar](2000) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employees]    Script Date: 9/6/2019 6:14:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Age] [int] NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Salary] [float] NOT NULL,
	[Gender] [nvarchar](50) NOT NULL,
	[DepartmentID] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Address] [nvarchar](50) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

GO
INSERT [dbo].[Departments] ([ID], [Name], [Description], [IsActive]) VALUES (2, N'HR', NULL, 1)
GO
INSERT [dbo].[Departments] ([ID], [Name], [Description], [IsActive]) VALUES (3, N'Programming', NULL, 1)
GO
INSERT [dbo].[Departments] ([ID], [Name], [Description], [IsActive]) VALUES (4, N'Entertaiment', NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

GO
INSERT [dbo].[Employees] ([ID], [Name], [Age], [Phone], [Salary], [Gender], [DepartmentID], [IsActive], [Address]) VALUES (1, N'ahmed lotfy', 22, N'01094159521', 11111, N'Male', 3, 0, NULL)
GO
INSERT [dbo].[Employees] ([ID], [Name], [Age], [Phone], [Salary], [Gender], [DepartmentID], [IsActive], [Address]) VALUES (2, N'samy', 34, N'01094159521', 11111, N'Male', 4, 0, NULL)
GO
INSERT [dbo].[Employees] ([ID], [Name], [Age], [Phone], [Salary], [Gender], [DepartmentID], [IsActive], [Address]) VALUES (3, N'sara john', 22, N'01094159521', 1, N'Male', 2, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([ID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Departments]
GO
USE [master]
GO
ALTER DATABASE [CompanyDb] SET  READ_WRITE 
GO
