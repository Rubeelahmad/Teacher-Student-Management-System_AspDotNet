USE [TEACHER_MANAGEMENT]
GO

/****** Object:  Table [dbo].[Register]    Script Date: 5/3/2021 8:17:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Register](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](50) NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Contact] [varchar](15) NULL,
	[Address] [varchar](200) NULL,
	[Email_Id] [varchar](50) NULL,
	[Course] [varchar](50) NULL,
	[Role] [char](2) NULL,
	[SUBJECT_NAME] [varchar](50) NULL,
	[EXPERIENCE] [varchar](50) NULL,
	[BOARD] [varchar](50) NULL,
	[TAGS] [varchar](50) NULL,
	[GENDER] [varchar](50) NULL,
	[PIC_PATH] [varchar](250) NULL,
 CONSTRAINT [PK_Register] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REPLY_MASTER]    Script Date: 5/3/2021 8:17:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REPLY_MASTER](
	[ReplyId] [int] IDENTITY(1,1) NOT NULL,
	[Student_ID] [int] NULL,
	[DESCRIPTION] [varchar](250) NULL,
	[File] [varchar](250) NULL,
	[Teacher_NAME] [varchar](50) NULL,
	[Teacher_EMAIL] [varchar](50) NULL,
	[Teacher_CONTACT] [varchar](15) NULL,
	[CREATED_BY_TeacherID] [int] NULL,
 CONSTRAINT [PK_REPLY_MASTER] PRIMARY KEY CLUSTERED 
(
	[ReplyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentCourses]    Script Date: 5/3/2021 8:17:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentCourses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NULL,
	[CourseName] [nvarchar](max) NULL,
	[TeacherId] [int] NULL,
	[UserId] [int] NULL,
	[Username] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Contact] [nvarchar](50) NULL,
 CONSTRAINT [PK_StudentCourses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeacherCourses]    Script Date: 5/3/2021 8:17:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeacherCourses](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Username] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Contact] [nvarchar](50) NULL,
	[CourseName] [nvarchar](max) NULL,
 CONSTRAINT [PK_TeacherCourses] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
