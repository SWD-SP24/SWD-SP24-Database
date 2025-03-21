use master
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'swd392')
BEGIN
    ALTER DATABASE swd392 SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE swd392;
END;

CREATE DATABASE swd392;
use swd392

/****** Object:  Table [dbo].[blog_categories]    Script Date: 3/11/2025 12:58:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blog_categories](
	[blog_content_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[blog_content_id] ASC,
	[category_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[blog_contents]    Script Date: 3/11/2025 12:58:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blog_contents](
	[blog_content_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[thumbnail_url] [varchar](255) NOT NULL,
	[status] [nvarchar](50) NOT NULL,
	[views] [int] NOT NULL,
	[likes] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[admin_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[blog_content_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 3/11/2025 12:58:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[children]    Script Date: 3/11/2025 12:58:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[children](
	[children_id] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [nvarchar](255) NOT NULL,
	[avatar] [varchar](255) NULL,
	[member_id] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[dob] [date] NULL,
	[blood_type] [nvarchar](10) NULL,
	[allergies] [nvarchar](255) NULL,
	[chronic_conditions] [nvarchar](255) NULL,
	[gender] [nvarchar](50) NULL,
	[status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[children_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[consultation_notes]    Script Date: 3/11/2025 12:58:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[consultation_notes](
	[consultation_note_id] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[record_time] [datetime] NOT NULL,
	[member_id] [int] NOT NULL,
	[doctor_id] [int] NOT NULL,
	[children_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[consultation_note_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deviation_Analysis]    Script Date: 3/11/2025 12:58:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deviation_Analysis](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[growth_record_id] [int] NULL,
	[computed_value] [decimal](5, 2) NULL,
	[deviation_percentage] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FAQ]    Script Date: 3/11/2025 12:58:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAQ](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[question] [nvarchar](255) NULL,
	[answer] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feedbacks]    Script Date: 3/11/2025 12:58:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feedbacks](
	[feedback_id] [int] IDENTITY(1,1) NOT NULL,
	[rating] [int] NOT NULL,
	[content] [nvarchar](max) NULL,
	[member_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[feedback_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[growth_indicators]    Script Date: 3/11/2025 12:58:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[growth_indicators](
	[growth_indicators_id] [int] IDENTITY(1,1) NOT NULL,
	[height] [decimal](10, 4) NOT NULL,
	[weight] [decimal](10, 4) NOT NULL,
	[bmi] [decimal](10, 4) NOT NULL,
	[record_time] [datetime] NOT NULL,
	[children_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[growth_indicators_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[membership_packages]    Script Date: 3/11/2025 12:58:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[membership_packages](
	[membership_package_id] [int] IDENTITY(1,1) NOT NULL,
	[membership_package_name] [nvarchar](255) NOT NULL,
	[price] [decimal](18, 2) NOT NULL,
	[validity_period] [int] NOT NULL,
	[status] [nvarchar](50) NOT NULL,
	[created_time] [datetime] NOT NULL,
	[admin_id] [int] NULL,
	[image] [nvarchar](max) NULL,
	[yearly_price] [decimal](18, 2) NULL,
	[summary] [nvarchar](max) NULL,
	[percent_discount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[membership_package_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[package_permissions]    Script Date: 3/11/2025 12:58:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[package_permissions](
	[membership_package_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[membership_package_id] ASC,
	[permission_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentTransactions]    Script Date: 3/11/2025 12:58:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentTransactions](
	[PaymentTransactionId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentId] [nvarchar](100) NULL,
	[UserId] [int] NOT NULL,
	[MembershipPackageId] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[previous_membership_package_name] [nvarchar](255) NULL,
	[user_membership_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentTransactionId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permissions]    Script Date: 3/11/2025 12:58:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permissions](
	[permission_id] [int] IDENTITY(1,1) NOT NULL,
	[permission_name] [nvarchar](255) NOT NULL,
	[description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[permission_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[replies]    Script Date: 3/11/2025 12:58:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[replies](
	[reply_id] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[feedback_id] [int] NOT NULL,
	[admin_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[reply_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeethingRecord]    Script Date: 3/11/2025 12:58:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeethingRecord](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[child_id] [int] NOT NULL,
	[tooth_id] [int] NOT NULL,
	[eruption_date] [datetime] NULL,
	[record_time] [datetime] NULL,
	[note] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tooth]    Script Date: 3/11/2025 12:58:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tooth](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[number_of_teeth] [int] NOT NULL,
	[teething_period] [int] NOT NULL,
	[name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_memberships]    Script Date: 3/11/2025 12:58:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_memberships](
	[user_membership_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[membership_package_id] [int] NOT NULL,
	[start_date] [datetime] NOT NULL,
	[end_date] [datetime] NULL,
	[status] [nvarchar](50) NOT NULL,
	[PaymentTransactionId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_membership_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 3/11/2025 12:58:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[uid] [nvarchar](255) NULL,
	[email] [varchar](255) NOT NULL,
	[phone_number] [varchar](50) NULL,
	[password_hash] [varchar](255) NOT NULL,
	[full_name] [nvarchar](255) NOT NULL,
	[avatar] [varchar](255) NULL,
	[role] [nvarchar](50) NOT NULL,
	[status] [nvarchar](50) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[membership_package_id] [int] NULL,
	[email_activation] [nvarchar](50) NOT NULL,
	[address] [nvarchar](100) NULL,
	[zipcode] [varchar](50) NULL,
	[state] [nvarchar](50) NULL,
	[country] [nvarchar](50) NULL,
	[specialization] [nvarchar](255) NULL,
	[license_number] [nvarchar](255) NULL,
	[hospital] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vaccination_Schedule]    Script Date: 3/11/2025 12:58:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vaccination_Schedule](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[vaccine_id] [int] NULL,
	[recommended_age_months] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vaccine]    Script Date: 3/11/2025 12:58:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vaccine](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL,
	[doses_required] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VaccineRecord]    Script Date: 3/11/2025 12:58:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VaccineRecord](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[child_id] [int] NOT NULL,
	[vaccine_id] [int] NOT NULL,
	[administered_date] [datetime] NOT NULL,
	[dose] [int] NULL,
	[next_dose_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WHO_Growth_Standards]    Script Date: 3/11/2025 12:58:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WHO_Growth_Standards](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[age_months] [int] NULL,
	[gender] [varchar](10) NULL,
	[height_avg] [decimal](10, 4) NOT NULL,
	[weight_avg] [decimal](10, 4) NOT NULL,
	[bmi_avg] [decimal](10, 4) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[children] ON 

INSERT [dbo].[children] ([children_id], [full_name], [avatar], [member_id], [created_at], [dob], [blood_type], [allergies], [chronic_conditions], [gender], [status]) VALUES (4, N'John Wicked', N'http://res.cloudinary.com/dbgdwk1jo/image/upload/v1741097276/Screenshot_2023-03-16_233540.png', 28, CAST(N'2025-02-25T08:54:31.883' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[children] ([children_id], [full_name], [avatar], [member_id], [created_at], [dob], [blood_type], [allergies], [chronic_conditions], [gender], [status]) VALUES (5, N'Johnny Sins', N'string', 28, CAST(N'2025-02-25T10:12:16.673' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[children] ([children_id], [full_name], [avatar], [member_id], [created_at], [dob], [blood_type], [allergies], [chronic_conditions], [gender], [status]) VALUES (13, N'Samuii', N'https://img.freepik.com/premium-vector/anime-style-character_961307-21499.jpg?w=900', 17, CAST(N'2025-02-27T08:28:11.230' AS DateTime), CAST(N'2003-02-11' AS Date), N'O', N'-', N'-', N'male', 1)
INSERT [dbo].[children] ([children_id], [full_name], [avatar], [member_id], [created_at], [dob], [blood_type], [allergies], [chronic_conditions], [gender], [status]) VALUES (15, N'string', N'string', 28, CAST(N'2025-02-27T11:31:51.393' AS DateTime), CAST(N'2025-02-27' AS Date), N'string', N'string', N'string', N'string', 0)
INSERT [dbo].[children] ([children_id], [full_name], [avatar], [member_id], [created_at], [dob], [blood_type], [allergies], [chronic_conditions], [gender], [status]) VALUES (21, N'Nguyen Ngoc Bu', N'string', 6, CAST(N'2025-03-06T09:27:08.830' AS DateTime), CAST(N'2025-03-06' AS Date), N'A', N'B', N'A', N'M', 1)
INSERT [dbo].[children] ([children_id], [full_name], [avatar], [member_id], [created_at], [dob], [blood_type], [allergies], [chronic_conditions], [gender], [status]) VALUES (22, N'Truong Quang Sang', N'string', 6, CAST(N'2025-03-06T15:03:45.430' AS DateTime), CAST(N'2026-02-03' AS Date), N'A', N'B', N'A', N'M', 1)
INSERT [dbo].[children] ([children_id], [full_name], [avatar], [member_id], [created_at], [dob], [blood_type], [allergies], [chronic_conditions], [gender], [status]) VALUES (23, N'Thai Van Lung', N'string', 6, CAST(N'2025-03-07T02:27:39.213' AS DateTime), CAST(N'2020-02-23' AS Date), N'A', N'b', N'A', N'M', 1)
INSERT [dbo].[children] ([children_id], [full_name], [avatar], [member_id], [created_at], [dob], [blood_type], [allergies], [chronic_conditions], [gender], [status]) VALUES (24, N'Teo emmm', N'string', 6, CAST(N'2025-03-07T02:41:52.673' AS DateTime), CAST(N'2003-02-02' AS Date), N'B', N'B', N'D', N'M', 1)
INSERT [dbo].[children] ([children_id], [full_name], [avatar], [member_id], [created_at], [dob], [blood_type], [allergies], [chronic_conditions], [gender], [status]) VALUES (25, N'Teo Ang', N'string', 6, CAST(N'2025-03-07T05:53:20.400' AS DateTime), CAST(N'2021-02-21' AS Date), N'A', N'B', N'C', N'F', 1)
INSERT [dbo].[children] ([children_id], [full_name], [avatar], [member_id], [created_at], [dob], [blood_type], [allergies], [chronic_conditions], [gender], [status]) VALUES (26, N'Hàn', N'', 14, CAST(N'2025-03-08T00:38:06.797' AS DateTime), CAST(N'2023-06-20' AS Date), N'A', N'', N'', N'female', 1)
INSERT [dbo].[children] ([children_id], [full_name], [avatar], [member_id], [created_at], [dob], [blood_type], [allergies], [chronic_conditions], [gender], [status]) VALUES (27, N'Hàn', N'dê', 32, CAST(N'2025-03-08T05:48:21.703' AS DateTime), CAST(N'2021-06-18' AS Date), N'A', N'', N'', N'female', 0)
INSERT [dbo].[children] ([children_id], [full_name], [avatar], [member_id], [created_at], [dob], [blood_type], [allergies], [chronic_conditions], [gender], [status]) VALUES (28, N'Khoa', N'https://media.tenor.com/TiMKsmmhZMIAAAAM/messi-meme.gif', 26, CAST(N'2025-03-08T08:19:02.497' AS DateTime), CAST(N'2020-06-18' AS Date), N'A', N'None', N'None', N'male', 1)
INSERT [dbo].[children] ([children_id], [full_name], [avatar], [member_id], [created_at], [dob], [blood_type], [allergies], [chronic_conditions], [gender], [status]) VALUES (29, N'Johnny Sinner', N'string', 1, CAST(N'2025-03-09T03:54:01.570' AS DateTime), CAST(N'2005-03-09' AS Date), N'string', N'string', N'string', N'SheMale', 1)
INSERT [dbo].[children] ([children_id], [full_name], [avatar], [member_id], [created_at], [dob], [blood_type], [allergies], [chronic_conditions], [gender], [status]) VALUES (32, N'string', N'string', 17, CAST(N'2025-03-09T07:45:01.767' AS DateTime), CAST(N'2025-03-09' AS Date), N'string', N'string', N'string', N'string', 0)
INSERT [dbo].[children] ([children_id], [full_name], [avatar], [member_id], [created_at], [dob], [blood_type], [allergies], [chronic_conditions], [gender], [status]) VALUES (33, N'Ly', N'', 14, CAST(N'2025-03-09T13:05:35.423' AS DateTime), CAST(N'2021-06-18' AS Date), N'A', N'', N'', N'female', 1)
INSERT [dbo].[children] ([children_id], [full_name], [avatar], [member_id], [created_at], [dob], [blood_type], [allergies], [chronic_conditions], [gender], [status]) VALUES (34, N'hung nguyen', N'string', 6, CAST(N'2025-03-09T16:56:33.320' AS DateTime), CAST(N'2025-09-03' AS Date), N'A', N'B', N'C', N'F', 1)
INSERT [dbo].[children] ([children_id], [full_name], [avatar], [member_id], [created_at], [dob], [blood_type], [allergies], [chronic_conditions], [gender], [status]) VALUES (35, N'Truong Van B', N'string', 6, CAST(N'2025-03-09T16:57:39.963' AS DateTime), CAST(N'2003-03-10' AS Date), N'B', N'A', N'C', N'M', 1)
INSERT [dbo].[children] ([children_id], [full_name], [avatar], [member_id], [created_at], [dob], [blood_type], [allergies], [chronic_conditions], [gender], [status]) VALUES (36, N'Van Queen', N'string', 6, CAST(N'2025-03-09T17:15:15.747' AS DateTime), CAST(N'2025-03-25' AS Date), N'A', N'B', N'C', N'M', 1)
INSERT [dbo].[children] ([children_id], [full_name], [avatar], [member_id], [created_at], [dob], [blood_type], [allergies], [chronic_conditions], [gender], [status]) VALUES (37, N'Trương Quyến', N'', 32, CAST(N'2025-03-09T17:49:46.277' AS DateTime), CAST(N'2021-06-18' AS Date), N'A', N'', N'', N'male', 1)
INSERT [dbo].[children] ([children_id], [full_name], [avatar], [member_id], [created_at], [dob], [blood_type], [allergies], [chronic_conditions], [gender], [status]) VALUES (38, N'Ly', N'', 32, CAST(N'2025-03-09T17:51:58.097' AS DateTime), CAST(N'2021-06-18' AS Date), N'A', N'', N'', N'female', 1)
INSERT [dbo].[children] ([children_id], [full_name], [avatar], [member_id], [created_at], [dob], [blood_type], [allergies], [chronic_conditions], [gender], [status]) VALUES (39, N'Thanh An', N'string', 6, CAST(N'2025-03-09T18:32:13.763' AS DateTime), CAST(N'2025-03-12' AS Date), N'A', N'B', N'C', N'M', 1)
INSERT [dbo].[children] ([children_id], [full_name], [avatar], [member_id], [created_at], [dob], [blood_type], [allergies], [chronic_conditions], [gender], [status]) VALUES (40, N'Hung Quyen Khoa An', N'string', 6, CAST(N'2025-03-09T18:33:04.543' AS DateTime), CAST(N'2003-03-09' AS Date), N'A', N'B', N'C', N'M', 1)
INSERT [dbo].[children] ([children_id], [full_name], [avatar], [member_id], [created_at], [dob], [blood_type], [allergies], [chronic_conditions], [gender], [status]) VALUES (41, N'Nguyen Anh Khoa', N'http://res.cloudinary.com/dbgdwk1jo/image/upload/v1741599605/6685c9073ab8739cd73909de349acf8b.jpg', 17, CAST(N'2025-03-10T09:39:52.507' AS DateTime), CAST(N'2021-06-18' AS Date), N'A', N'', N'', N'male', 1)
INSERT [dbo].[children] ([children_id], [full_name], [avatar], [member_id], [created_at], [dob], [blood_type], [allergies], [chronic_conditions], [gender], [status]) VALUES (42, N'Nguyen Anh Khoa', N'', 17, CAST(N'2025-03-10T09:51:00.850' AS DateTime), CAST(N'2021-06-18' AS Date), N'A', N'', N'', N'male', 0)
INSERT [dbo].[children] ([children_id], [full_name], [avatar], [member_id], [created_at], [dob], [blood_type], [allergies], [chronic_conditions], [gender], [status]) VALUES (43, N'', NULL, 17, CAST(N'2025-03-10T09:52:33.573' AS DateTime), CAST(N'2021-06-18' AS Date), N'A', N'', N'', N'male', 0)
INSERT [dbo].[children] ([children_id], [full_name], [avatar], [member_id], [created_at], [dob], [blood_type], [allergies], [chronic_conditions], [gender], [status]) VALUES (44, N'Johnny Sins', NULL, 36, CAST(N'2025-03-10T11:13:59.140' AS DateTime), CAST(N'2021-06-18' AS Date), N'A', N'None', N'Sida', N'male', 1)
INSERT [dbo].[children] ([children_id], [full_name], [avatar], [member_id], [created_at], [dob], [blood_type], [allergies], [chronic_conditions], [gender], [status]) VALUES (45, N'John Cena', NULL, 37, CAST(N'2025-03-10T11:17:12.467' AS DateTime), CAST(N'2021-06-18' AS Date), N'B', N'Nuts', N'Nutting', N'male', 1)
INSERT [dbo].[children] ([children_id], [full_name], [avatar], [member_id], [created_at], [dob], [blood_type], [allergies], [chronic_conditions], [gender], [status]) VALUES (46, N'Ly', N'http://res.cloudinary.com/dbgdwk1jo/image/upload/v1741402944/jack-j97.jpg', 31, CAST(N'2025-03-10T11:54:21.327' AS DateTime), CAST(N'2021-06-18' AS Date), N'A', N'', N'', N'female', 1)
INSERT [dbo].[children] ([children_id], [full_name], [avatar], [member_id], [created_at], [dob], [blood_type], [allergies], [chronic_conditions], [gender], [status]) VALUES (47, N'Nguyen Anh ', NULL, 17, CAST(N'2025-03-10T11:56:58.233' AS DateTime), CAST(N'2021-06-18' AS Date), N'A', N'', N'', N'male', 1)
INSERT [dbo].[children] ([children_id], [full_name], [avatar], [member_id], [created_at], [dob], [blood_type], [allergies], [chronic_conditions], [gender], [status]) VALUES (48, N'', NULL, 17, CAST(N'2025-03-10T18:53:27.270' AS DateTime), CAST(N'2021-06-18' AS Date), N'AB', N'', N'', N'male', 1)
INSERT [dbo].[children] ([children_id], [full_name], [avatar], [member_id], [created_at], [dob], [blood_type], [allergies], [chronic_conditions], [gender], [status]) VALUES (49, N'Nguyen Anh Khoa', NULL, 17, CAST(N'2025-03-10T18:53:33.670' AS DateTime), CAST(N'2021-06-18' AS Date), N'B', N'', N'', N'male', 1)
SET IDENTITY_INSERT [dbo].[children] OFF
GO
SET IDENTITY_INSERT [dbo].[FAQ] ON 

INSERT [dbo].[FAQ] ([id], [question], [answer]) VALUES (2, N'an', N'ok')
SET IDENTITY_INSERT [dbo].[FAQ] OFF
GO
SET IDENTITY_INSERT [dbo].[growth_indicators] ON 

INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (1, CAST(175.0000 AS Decimal(10, 4)), CAST(2.0000 AS Decimal(10, 4)), CAST(1.0000 AS Decimal(10, 4)), CAST(N'2020-02-28T06:39:36.990' AS DateTime), 4)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (2, CAST(175.0000 AS Decimal(10, 4)), CAST(72.0000 AS Decimal(10, 4)), CAST(24.0000 AS Decimal(10, 4)), CAST(N'2020-02-28T06:39:36.990' AS DateTime), 4)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (3, CAST(150.0000 AS Decimal(10, 4)), CAST(300.0000 AS Decimal(10, 4)), CAST(18.0000 AS Decimal(10, 4)), CAST(N'2015-02-28T06:42:52.950' AS DateTime), 4)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (11, CAST(200.0000 AS Decimal(10, 4)), CAST(5.0000 AS Decimal(10, 4)), CAST(1.0000 AS Decimal(10, 4)), CAST(N'2017-03-04T06:13:30.243' AS DateTime), 4)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (22, CAST(76.0000 AS Decimal(10, 4)), CAST(10.3000 AS Decimal(10, 4)), CAST(18.0000 AS Decimal(10, 4)), CAST(N'2025-02-01T10:00:00.000' AS DateTime), 13)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (23, CAST(76.0000 AS Decimal(10, 4)), CAST(10.4000 AS Decimal(10, 4)), CAST(18.0000 AS Decimal(10, 4)), CAST(N'2025-02-02T10:00:00.000' AS DateTime), 13)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (24, CAST(76.0000 AS Decimal(10, 4)), CAST(10.5000 AS Decimal(10, 4)), CAST(18.0000 AS Decimal(10, 4)), CAST(N'2025-02-03T10:00:00.000' AS DateTime), 13)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (25, CAST(76.0000 AS Decimal(10, 4)), CAST(10.6000 AS Decimal(10, 4)), CAST(18.0000 AS Decimal(10, 4)), CAST(N'2025-02-04T10:00:00.000' AS DateTime), 13)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (26, CAST(76.0000 AS Decimal(10, 4)), CAST(10.7000 AS Decimal(10, 4)), CAST(19.0000 AS Decimal(10, 4)), CAST(N'2025-02-05T10:00:00.000' AS DateTime), 13)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (27, CAST(76.0000 AS Decimal(10, 4)), CAST(10.8000 AS Decimal(10, 4)), CAST(19.0000 AS Decimal(10, 4)), CAST(N'2025-02-06T10:00:00.000' AS DateTime), 13)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (28, CAST(76.0000 AS Decimal(10, 4)), CAST(10.9000 AS Decimal(10, 4)), CAST(19.0000 AS Decimal(10, 4)), CAST(N'2025-02-07T10:00:00.000' AS DateTime), 13)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (29, CAST(77.0000 AS Decimal(10, 4)), CAST(11.0000 AS Decimal(10, 4)), CAST(19.0000 AS Decimal(10, 4)), CAST(N'2025-02-08T10:00:00.000' AS DateTime), 13)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (30, CAST(77.0000 AS Decimal(10, 4)), CAST(11.1000 AS Decimal(10, 4)), CAST(19.0000 AS Decimal(10, 4)), CAST(N'2025-02-09T10:00:00.000' AS DateTime), 13)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (31, CAST(77.0000 AS Decimal(10, 4)), CAST(11.2000 AS Decimal(10, 4)), CAST(19.0000 AS Decimal(10, 4)), CAST(N'2025-02-10T10:00:00.000' AS DateTime), 13)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (32, CAST(77.0000 AS Decimal(10, 4)), CAST(11.3000 AS Decimal(10, 4)), CAST(19.0000 AS Decimal(10, 4)), CAST(N'2025-02-11T10:00:00.000' AS DateTime), 13)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (33, CAST(77.0000 AS Decimal(10, 4)), CAST(11.4000 AS Decimal(10, 4)), CAST(19.0000 AS Decimal(10, 4)), CAST(N'2025-02-12T10:00:00.000' AS DateTime), 13)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (34, CAST(77.0000 AS Decimal(10, 4)), CAST(11.5000 AS Decimal(10, 4)), CAST(19.0000 AS Decimal(10, 4)), CAST(N'2025-02-13T10:00:00.000' AS DateTime), 13)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (35, CAST(77.0000 AS Decimal(10, 4)), CAST(11.6000 AS Decimal(10, 4)), CAST(20.0000 AS Decimal(10, 4)), CAST(N'2025-02-14T10:00:00.000' AS DateTime), 13)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (36, CAST(78.0000 AS Decimal(10, 4)), CAST(11.7000 AS Decimal(10, 4)), CAST(19.0000 AS Decimal(10, 4)), CAST(N'2025-02-15T10:00:00.000' AS DateTime), 13)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (37, CAST(78.0000 AS Decimal(10, 4)), CAST(11.8000 AS Decimal(10, 4)), CAST(19.0000 AS Decimal(10, 4)), CAST(N'2025-02-16T10:00:00.000' AS DateTime), 13)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (38, CAST(78.0000 AS Decimal(10, 4)), CAST(11.9000 AS Decimal(10, 4)), CAST(20.0000 AS Decimal(10, 4)), CAST(N'2025-02-17T10:00:00.000' AS DateTime), 13)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (39, CAST(78.0000 AS Decimal(10, 4)), CAST(12.0000 AS Decimal(10, 4)), CAST(20.0000 AS Decimal(10, 4)), CAST(N'2025-02-18T10:00:00.000' AS DateTime), 13)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (40, CAST(78.0000 AS Decimal(10, 4)), CAST(12.1000 AS Decimal(10, 4)), CAST(20.0000 AS Decimal(10, 4)), CAST(N'2025-02-19T10:00:00.000' AS DateTime), 13)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (41, CAST(78.0000 AS Decimal(10, 4)), CAST(12.2000 AS Decimal(10, 4)), CAST(20.0000 AS Decimal(10, 4)), CAST(N'2025-02-20T10:00:00.000' AS DateTime), 13)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (42, CAST(78.0000 AS Decimal(10, 4)), CAST(12.3000 AS Decimal(10, 4)), CAST(20.0000 AS Decimal(10, 4)), CAST(N'2025-02-21T10:00:00.000' AS DateTime), 13)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (43, CAST(79.0000 AS Decimal(10, 4)), CAST(12.4000 AS Decimal(10, 4)), CAST(20.0000 AS Decimal(10, 4)), CAST(N'2025-02-22T10:00:00.000' AS DateTime), 13)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (44, CAST(79.0000 AS Decimal(10, 4)), CAST(12.5000 AS Decimal(10, 4)), CAST(20.0000 AS Decimal(10, 4)), CAST(N'2025-02-23T10:00:00.000' AS DateTime), 13)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (45, CAST(79.0000 AS Decimal(10, 4)), CAST(12.6000 AS Decimal(10, 4)), CAST(20.0000 AS Decimal(10, 4)), CAST(N'2025-02-24T10:00:00.000' AS DateTime), 13)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (46, CAST(79.0000 AS Decimal(10, 4)), CAST(12.7000 AS Decimal(10, 4)), CAST(20.0000 AS Decimal(10, 4)), CAST(N'2025-02-25T10:00:00.000' AS DateTime), 13)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (47, CAST(80.0000 AS Decimal(10, 4)), CAST(14.0000 AS Decimal(10, 4)), CAST(22.0000 AS Decimal(10, 4)), CAST(N'2025-02-26T10:00:00.000' AS DateTime), 13)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (48, CAST(79.0000 AS Decimal(10, 4)), CAST(12.9000 AS Decimal(10, 4)), CAST(21.0000 AS Decimal(10, 4)), CAST(N'2025-02-27T10:00:00.000' AS DateTime), 13)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (49, CAST(79.0000 AS Decimal(10, 4)), CAST(13.0000 AS Decimal(10, 4)), CAST(21.0000 AS Decimal(10, 4)), CAST(N'2025-02-28T10:00:00.000' AS DateTime), 13)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (50, CAST(200.0000 AS Decimal(10, 4)), CAST(100.0000 AS Decimal(10, 4)), CAST(25.0000 AS Decimal(10, 4)), CAST(N'2026-03-06T12:22:09.710' AS DateTime), 13)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (51, CAST(100.0000 AS Decimal(10, 4)), CAST(100.0000 AS Decimal(10, 4)), CAST(100.0000 AS Decimal(10, 4)), CAST(N'2025-03-07T06:26:40.490' AS DateTime), 4)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (52, CAST(100.0000 AS Decimal(10, 4)), CAST(100.0000 AS Decimal(10, 4)), CAST(100.0000 AS Decimal(10, 4)), CAST(N'2025-03-07T06:26:40.490' AS DateTime), 4)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (53, CAST(100.0000 AS Decimal(10, 4)), CAST(100.0000 AS Decimal(10, 4)), CAST(100.0000 AS Decimal(10, 4)), CAST(N'2025-03-07T06:26:40.490' AS DateTime), 4)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (54, CAST(100.0000 AS Decimal(10, 4)), CAST(100.0000 AS Decimal(10, 4)), CAST(100.0000 AS Decimal(10, 4)), CAST(N'2025-03-07T06:26:40.490' AS DateTime), 4)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (55, CAST(100.0000 AS Decimal(10, 4)), CAST(100.0000 AS Decimal(10, 4)), CAST(100.0000 AS Decimal(10, 4)), CAST(N'2025-03-07T06:26:40.490' AS DateTime), 4)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (56, CAST(100.0000 AS Decimal(10, 4)), CAST(100.0000 AS Decimal(10, 4)), CAST(100.0000 AS Decimal(10, 4)), CAST(N'2025-03-07T06:26:40.490' AS DateTime), 4)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (58, CAST(90.0000 AS Decimal(10, 4)), CAST(10.0000 AS Decimal(10, 4)), CAST(12.0000 AS Decimal(10, 4)), CAST(N'2025-03-08T00:41:07.297' AS DateTime), 26)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (62, CAST(20.0000 AS Decimal(10, 4)), CAST(20.0000 AS Decimal(10, 4)), CAST(500.0000 AS Decimal(10, 4)), CAST(N'2012-12-12T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (63, CAST(160.0000 AS Decimal(10, 4)), CAST(54.0000 AS Decimal(10, 4)), CAST(21.0000 AS Decimal(10, 4)), CAST(N'2025-03-09T00:00:00.000' AS DateTime), 21)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (64, CAST(160.0000 AS Decimal(10, 4)), CAST(54.0000 AS Decimal(10, 4)), CAST(21.0000 AS Decimal(10, 4)), CAST(N'2025-03-12T00:00:00.000' AS DateTime), 21)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (65, CAST(175.0000 AS Decimal(10, 4)), CAST(76.0000 AS Decimal(10, 4)), CAST(25.0000 AS Decimal(10, 4)), CAST(N'2025-03-09T00:00:00.000' AS DateTime), 22)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (66, CAST(179.0000 AS Decimal(10, 4)), CAST(79.0000 AS Decimal(10, 4)), CAST(25.0000 AS Decimal(10, 4)), CAST(N'2025-03-09T00:00:00.000' AS DateTime), 21)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (67, CAST(100.0000 AS Decimal(10, 4)), CAST(25.0000 AS Decimal(10, 4)), CAST(25.0000 AS Decimal(10, 4)), CAST(N'2018-03-13T00:00:00.000' AS DateTime), 22)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (68, CAST(50.0000 AS Decimal(10, 4)), CAST(9.0000 AS Decimal(10, 4)), CAST(36.0000 AS Decimal(10, 4)), CAST(N'2024-03-09T00:00:00.000' AS DateTime), 23)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (69, CAST(100.0000 AS Decimal(10, 4)), CAST(30.0000 AS Decimal(10, 4)), CAST(30.0000 AS Decimal(10, 4)), CAST(N'2025-03-09T00:00:00.000' AS DateTime), 23)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (70, CAST(150.0000 AS Decimal(10, 4)), CAST(90.0000 AS Decimal(10, 4)), CAST(40.0000 AS Decimal(10, 4)), CAST(N'2024-03-09T00:00:00.000' AS DateTime), 21)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (71, CAST(160.0000 AS Decimal(10, 4)), CAST(99.0000 AS Decimal(10, 4)), CAST(39.0000 AS Decimal(10, 4)), CAST(N'2024-03-30T00:00:00.000' AS DateTime), 21)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (72, CAST(160.0000 AS Decimal(10, 4)), CAST(80.0000 AS Decimal(10, 4)), CAST(31.0000 AS Decimal(10, 4)), CAST(N'2022-03-09T00:00:00.000' AS DateTime), 22)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (73, CAST(190.0000 AS Decimal(10, 4)), CAST(90.0000 AS Decimal(10, 4)), CAST(25.0000 AS Decimal(10, 4)), CAST(N'2025-03-13T00:00:00.000' AS DateTime), 22)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (74, CAST(175.0000 AS Decimal(10, 4)), CAST(90.0000 AS Decimal(10, 4)), CAST(29.0000 AS Decimal(10, 4)), CAST(N'2024-01-19T00:00:00.000' AS DateTime), 22)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (75, CAST(168.0000 AS Decimal(10, 4)), CAST(100.0000 AS Decimal(10, 4)), CAST(35.0000 AS Decimal(10, 4)), CAST(N'2025-03-11T00:00:00.000' AS DateTime), 13)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (79, CAST(100.0000 AS Decimal(10, 4)), CAST(10.0000 AS Decimal(10, 4)), CAST(10.0000 AS Decimal(10, 4)), CAST(N'2021-06-18T00:00:00.000' AS DateTime), 33)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (80, CAST(140.0000 AS Decimal(10, 4)), CAST(10.0000 AS Decimal(10, 4)), CAST(5.0000 AS Decimal(10, 4)), CAST(N'2021-06-18T00:00:00.000' AS DateTime), 33)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (84, CAST(90.0000 AS Decimal(10, 4)), CAST(15.0000 AS Decimal(10, 4)), CAST(19.0000 AS Decimal(10, 4)), CAST(N'2023-06-18T00:00:00.000' AS DateTime), 28)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (85, CAST(115.0000 AS Decimal(10, 4)), CAST(25.0000 AS Decimal(10, 4)), CAST(19.0000 AS Decimal(10, 4)), CAST(N'2025-03-09T00:00:00.000' AS DateTime), 28)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (86, CAST(175.0000 AS Decimal(10, 4)), CAST(90.0000 AS Decimal(10, 4)), CAST(29.0000 AS Decimal(10, 4)), CAST(N'2022-03-10T00:00:00.000' AS DateTime), 40)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (87, CAST(179.0000 AS Decimal(10, 4)), CAST(100.0000 AS Decimal(10, 4)), CAST(31.0000 AS Decimal(10, 4)), CAST(N'2025-03-10T00:00:00.000' AS DateTime), 40)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (88, CAST(100.0000 AS Decimal(10, 4)), CAST(50.0000 AS Decimal(10, 4)), CAST(50.0000 AS Decimal(10, 4)), CAST(N'2021-06-18T00:00:00.000' AS DateTime), 44)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (89, CAST(110.0000 AS Decimal(10, 4)), CAST(50.0000 AS Decimal(10, 4)), CAST(41.0000 AS Decimal(10, 4)), CAST(N'2021-07-18T00:00:00.000' AS DateTime), 44)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (90, CAST(130.0000 AS Decimal(10, 4)), CAST(50.0000 AS Decimal(10, 4)), CAST(30.0000 AS Decimal(10, 4)), CAST(N'2021-08-18T00:00:00.000' AS DateTime), 44)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (95, CAST(10.0000 AS Decimal(10, 4)), CAST(10.0000 AS Decimal(10, 4)), CAST(1000.0000 AS Decimal(10, 4)), CAST(N'2021-06-18T00:00:00.000' AS DateTime), 45)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (96, CAST(20.0000 AS Decimal(10, 4)), CAST(20.0000 AS Decimal(10, 4)), CAST(500.0000 AS Decimal(10, 4)), CAST(N'2021-07-18T00:00:00.000' AS DateTime), 45)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (97, CAST(30.0000 AS Decimal(10, 4)), CAST(30.0000 AS Decimal(10, 4)), CAST(333.0000 AS Decimal(10, 4)), CAST(N'2021-08-18T00:00:00.000' AS DateTime), 45)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (98, CAST(30.0000 AS Decimal(10, 4)), CAST(30.0000 AS Decimal(10, 4)), CAST(333.0000 AS Decimal(10, 4)), CAST(N'2021-09-18T00:00:00.000' AS DateTime), 45)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (99, CAST(140.0000 AS Decimal(10, 4)), CAST(10.0000 AS Decimal(10, 4)), CAST(5.0000 AS Decimal(10, 4)), CAST(N'2021-06-18T00:00:00.000' AS DateTime), 26)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (100, CAST(32.0000 AS Decimal(10, 4)), CAST(12.0000 AS Decimal(10, 4)), CAST(117.0000 AS Decimal(10, 4)), CAST(N'2021-06-18T00:00:00.000' AS DateTime), 26)
INSERT [dbo].[growth_indicators] ([growth_indicators_id], [height], [weight], [bmi], [record_time], [children_id]) VALUES (101, CAST(80.0000 AS Decimal(10, 4)), CAST(24.0000 AS Decimal(10, 4)), CAST(38.0000 AS Decimal(10, 4)), CAST(N'2021-06-18T00:00:00.000' AS DateTime), 26)
SET IDENTITY_INSERT [dbo].[growth_indicators] OFF
GO
SET IDENTITY_INSERT [dbo].[membership_packages] ON 

INSERT [dbo].[membership_packages] ([membership_package_id], [membership_package_name], [price], [validity_period], [status], [created_time], [admin_id], [image], [yearly_price], [summary], [percent_discount]) VALUES (1, N'Basic', CAST(0.00 AS Decimal(18, 2)), 9999, N'active', CAST(N'2025-01-14T08:00:00.000' AS DateTime), NULL, N'https://demos.themeselection.com/sneat-bootstrap-html-admin-template/assets/img/front-pages/icons/paper-airplane.png', CAST(0.00 AS Decimal(18, 2)), N'A simple start for everyone', 0)
INSERT [dbo].[membership_packages] ([membership_package_id], [membership_package_name], [price], [validity_period], [status], [created_time], [admin_id], [image], [yearly_price], [summary], [percent_discount]) VALUES (2, N'Standard', CAST(10.00 AS Decimal(18, 2)), 30, N'active', CAST(N'2025-01-14T08:00:00.000' AS DateTime), NULL, N'https://demos.themeselection.com/sneat-bootstrap-html-admin-template/assets/img/front-pages/icons/plane.png', CAST(108.00 AS Decimal(18, 2)), N'A simple start for everyone', 10)
INSERT [dbo].[membership_packages] ([membership_package_id], [membership_package_name], [price], [validity_period], [status], [created_time], [admin_id], [image], [yearly_price], [summary], [percent_discount]) VALUES (3, N'Enterprise', CAST(20.00 AS Decimal(18, 2)), 30, N'active', CAST(N'2025-02-26T15:01:36.740' AS DateTime), NULL, N'https://demos.themeselection.com/sneat-bootstrap-html-admin-template/assets/img/front-pages/icons/shuttle-rocket.png', CAST(216.00 AS Decimal(18, 2)), N'A simple start for everyone', 10)
SET IDENTITY_INSERT [dbo].[membership_packages] OFF
GO
INSERT [dbo].[package_permissions] ([membership_package_id], [permission_id]) VALUES (1, 1)
INSERT [dbo].[package_permissions] ([membership_package_id], [permission_id]) VALUES (1, 2)
INSERT [dbo].[package_permissions] ([membership_package_id], [permission_id]) VALUES (1, 3)
INSERT [dbo].[package_permissions] ([membership_package_id], [permission_id]) VALUES (1, 4)
INSERT [dbo].[package_permissions] ([membership_package_id], [permission_id]) VALUES (1, 5)
INSERT [dbo].[package_permissions] ([membership_package_id], [permission_id]) VALUES (1, 8)
INSERT [dbo].[package_permissions] ([membership_package_id], [permission_id]) VALUES (1, 9)
INSERT [dbo].[package_permissions] ([membership_package_id], [permission_id]) VALUES (2, 1)
INSERT [dbo].[package_permissions] ([membership_package_id], [permission_id]) VALUES (2, 2)
INSERT [dbo].[package_permissions] ([membership_package_id], [permission_id]) VALUES (2, 3)
INSERT [dbo].[package_permissions] ([membership_package_id], [permission_id]) VALUES (2, 4)
INSERT [dbo].[package_permissions] ([membership_package_id], [permission_id]) VALUES (2, 5)
INSERT [dbo].[package_permissions] ([membership_package_id], [permission_id]) VALUES (2, 6)
INSERT [dbo].[package_permissions] ([membership_package_id], [permission_id]) VALUES (2, 7)
INSERT [dbo].[package_permissions] ([membership_package_id], [permission_id]) VALUES (2, 8)
INSERT [dbo].[package_permissions] ([membership_package_id], [permission_id]) VALUES (2, 9)
INSERT [dbo].[package_permissions] ([membership_package_id], [permission_id]) VALUES (2, 12)
INSERT [dbo].[package_permissions] ([membership_package_id], [permission_id]) VALUES (3, 1)
INSERT [dbo].[package_permissions] ([membership_package_id], [permission_id]) VALUES (3, 2)
INSERT [dbo].[package_permissions] ([membership_package_id], [permission_id]) VALUES (3, 3)
INSERT [dbo].[package_permissions] ([membership_package_id], [permission_id]) VALUES (3, 4)
INSERT [dbo].[package_permissions] ([membership_package_id], [permission_id]) VALUES (3, 5)
INSERT [dbo].[package_permissions] ([membership_package_id], [permission_id]) VALUES (3, 6)
INSERT [dbo].[package_permissions] ([membership_package_id], [permission_id]) VALUES (3, 7)
INSERT [dbo].[package_permissions] ([membership_package_id], [permission_id]) VALUES (3, 8)
INSERT [dbo].[package_permissions] ([membership_package_id], [permission_id]) VALUES (3, 9)
INSERT [dbo].[package_permissions] ([membership_package_id], [permission_id]) VALUES (3, 10)
INSERT [dbo].[package_permissions] ([membership_package_id], [permission_id]) VALUES (3, 11)
INSERT [dbo].[package_permissions] ([membership_package_id], [permission_id]) VALUES (3, 12)
INSERT [dbo].[package_permissions] ([membership_package_id], [permission_id]) VALUES (3, 13)
GO

SET IDENTITY_INSERT [dbo].[permissions] ON 

INSERT [dbo].[permissions] ([permission_id], [permission_name], [description]) VALUES (1, N'CHILD_PROFILE_MANAGE', N'Manage child profiles')
INSERT [dbo].[permissions] ([permission_id], [permission_name], [description]) VALUES (2, N'GROWTH_RECORD_MANAGE', N'Manage child growth records')
INSERT [dbo].[permissions] ([permission_id], [permission_name], [description]) VALUES (3, N'TEETH_RECORD_MANAGE', N'Track teething progress and dental health')
INSERT [dbo].[permissions] ([permission_id], [permission_name], [description]) VALUES (4, N'VACCINATION_SCHEDULE_ACCESS', N'View schedules and set vaccination reminders')
INSERT [dbo].[permissions] ([permission_id], [permission_name], [description]) VALUES (5, N'VACCINATION_RECORD_MANAGE', N'Manage vaccination history and status')
INSERT [dbo].[permissions] ([permission_id], [permission_name], [description]) VALUES (6, N'DOCTOR_CHAT', N'Chat live with doctors')
INSERT [dbo].[permissions] ([permission_id], [permission_name], [description]) VALUES (7, N'DOCTOR_REVIEW_MANAGE', N'View and give feedback to doctor')
INSERT [dbo].[permissions] ([permission_id], [permission_name], [description]) VALUES (8, N'MEMBERSHIP_MANAGE', N'View and upgrade membership packages.')
INSERT [dbo].[permissions] ([permission_id], [permission_name], [description]) VALUES (9, N'PAYMENT_HISTORY_VIEW', N'Track payment transactions and history.')
INSERT [dbo].[permissions] ([permission_id], [permission_name], [description]) VALUES (10, N'AI_3D_DOCTOR_CHAT', N'Chat with a 3D AI doctor via text/voice')
INSERT [dbo].[permissions] ([permission_id], [permission_name], [description]) VALUES (11, N'AI_NUTRITION_ALERT', N'Receive alerts for nutrition issues')
INSERT [dbo].[permissions] ([permission_id], [permission_name], [description]) VALUES (12, N'AI_HEALTH_DATA_ANALYSIS', N'Recieve child health analytics')
INSERT [dbo].[permissions] ([permission_id], [permission_name], [description]) VALUES (13, N'AI_NUTRITION_PLAN', N'Get personalized diet recommendations')
SET IDENTITY_INSERT [dbo].[permissions] OFF
GO
SET IDENTITY_INSERT [dbo].[TeethingRecord] ON 

INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (1, 4, 8, CAST(N'2025-03-07T17:33:22.123' AS DateTime), CAST(N'2025-03-07T17:33:22.123' AS DateTime), N'string')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (2, 4, 10, CAST(N'2025-03-07T17:33:22.123' AS DateTime), CAST(N'2025-03-07T17:33:22.123' AS DateTime), N'deadass')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (4, 13, 8, CAST(N'2025-03-08T16:49:00.907' AS DateTime), CAST(N'2025-03-08T16:25:49.763' AS DateTime), N'khongcogihet')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (5, 13, 7, CAST(N'2025-03-08T16:51:19.563' AS DateTime), CAST(N'2025-03-08T16:51:19.563' AS DateTime), N'string')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (6, 4, 15, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(N'2011-11-11T00:00:00.000' AS DateTime), N'aaaaaa')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (7, 13, 6, CAST(N'2025-03-02T00:00:00.000' AS DateTime), CAST(N'2025-03-08T20:15:27.820' AS DateTime), N'TEsst')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (8, 13, 7, CAST(N'2025-03-02T00:00:00.000' AS DateTime), CAST(N'2025-03-08T20:17:45.327' AS DateTime), N'AaaAA')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (9, 13, 7, CAST(N'2025-03-02T00:00:00.000' AS DateTime), CAST(N'2025-03-08T20:17:56.557' AS DateTime), N'AaaAA')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (10, 13, 10, CAST(N'2025-03-03T00:00:00.000' AS DateTime), CAST(N'2025-03-08T20:19:14.270' AS DateTime), N'vac')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (11, 13, 10, CAST(N'2025-03-03T00:00:00.000' AS DateTime), CAST(N'2025-03-08T20:19:33.620' AS DateTime), N'vac')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (12, 13, 10, CAST(N'2025-03-03T00:00:00.000' AS DateTime), CAST(N'2025-03-08T20:19:43.390' AS DateTime), N'vac')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (13, 13, 10, CAST(N'2025-03-03T00:00:00.000' AS DateTime), CAST(N'2025-03-08T20:19:51.577' AS DateTime), N'cong nghe var')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (14, 13, 17, CAST(N'2025-03-03T00:00:00.000' AS DateTime), CAST(N'2025-03-08T20:21:26.450' AS DateTime), N'CCC')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (15, 13, 16, CAST(N'2025-03-01T00:00:00.000' AS DateTime), CAST(N'2025-03-08T20:27:52.997' AS DateTime), N'CCC')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (16, 13, 17, CAST(N'2025-03-05T00:00:00.000' AS DateTime), CAST(N'2025-03-08T20:36:23.923' AS DateTime), N'CCC')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (17, 4, 4, CAST(N'2001-01-01T00:00:00.000' AS DateTime), CAST(N'2012-12-12T00:00:00.000' AS DateTime), N'aspidj')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (18, 13, 15, CAST(N'2025-03-01T00:00:00.000' AS DateTime), CAST(N'2025-03-09T07:20:12.430' AS DateTime), N'rang so 13 da duoc test')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (19, 13, 12, CAST(N'2025-03-05T00:00:00.000' AS DateTime), CAST(N'2025-03-09T07:28:53.670' AS DateTime), N'aaaaaaaaaaaa')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (20, 32, 15, CAST(N'2025-03-05T00:00:00.000' AS DateTime), CAST(N'2025-03-09T07:46:29.160' AS DateTime), N'ddsad')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (21, 28, 12, CAST(N'2024-02-07T00:00:00.000' AS DateTime), CAST(N'2025-03-09T12:38:12.447' AS DateTime), N'răng sâu')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (22, 26, 11, CAST(N'2025-03-09T00:00:00.000' AS DateTime), CAST(N'2025-03-09T13:04:05.680' AS DateTime), N'')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (23, 33, 15, CAST(N'2025-03-09T00:00:00.000' AS DateTime), CAST(N'2025-03-09T13:12:38.187' AS DateTime), N'')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (24, 45, 11, CAST(N'2025-02-03T00:00:00.000' AS DateTime), CAST(N'2025-03-10T11:19:37.847' AS DateTime), N'Dead')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (25, 45, 15, CAST(N'2025-03-03T00:00:00.000' AS DateTime), CAST(N'2025-03-10T11:19:56.130' AS DateTime), N'Nice')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (26, 45, 14, CAST(N'2025-02-25T00:00:00.000' AS DateTime), CAST(N'2025-03-10T11:20:15.350' AS DateTime), N'asc')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (27, 45, 13, CAST(N'2025-02-26T00:00:00.000' AS DateTime), CAST(N'2025-03-10T11:20:20.500' AS DateTime), N'asczx')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (28, 45, 6, CAST(N'2025-03-03T00:00:00.000' AS DateTime), CAST(N'2025-03-10T11:20:25.150' AS DateTime), N'ascz')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (29, 45, 7, CAST(N'2025-03-06T00:00:00.000' AS DateTime), CAST(N'2025-03-10T11:20:29.220' AS DateTime), N'ascasc')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (30, 45, 8, CAST(N'2025-03-05T00:00:00.000' AS DateTime), CAST(N'2025-03-10T11:20:33.540' AS DateTime), N'ascaxc')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (31, 45, 9, CAST(N'2025-02-27T00:00:00.000' AS DateTime), CAST(N'2025-03-10T11:20:38.310' AS DateTime), N'ascasxc')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (32, 45, 12, CAST(N'2025-02-28T00:00:00.000' AS DateTime), CAST(N'2025-03-10T11:20:43.230' AS DateTime), N'ascszx')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (33, 45, 10, CAST(N'2025-02-25T00:00:00.000' AS DateTime), CAST(N'2025-03-10T11:20:47.130' AS DateTime), N'asczxc')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (34, 45, 22, CAST(N'2025-03-03T00:00:00.000' AS DateTime), CAST(N'2025-03-10T11:20:48.977' AS DateTime), N'zxcz')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (35, 45, 31, CAST(N'2025-03-07T00:00:00.000' AS DateTime), CAST(N'2025-03-10T11:21:02.740' AS DateTime), N'dad')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (36, 45, 30, NULL, CAST(N'2025-03-10T11:21:04.920' AS DateTime), N'dead')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (37, 45, 23, NULL, CAST(N'2025-03-10T11:23:01.187' AS DateTime), N'zxczxcz')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (38, 45, 24, NULL, CAST(N'2025-03-10T11:23:52.600' AS DateTime), N'')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (39, 45, 25, NULL, CAST(N'2025-03-10T11:24:04.587' AS DateTime), N'')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (40, 45, 26, NULL, CAST(N'2025-03-10T11:24:06.407' AS DateTime), N'')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (41, 45, 27, NULL, CAST(N'2025-03-10T11:24:07.710' AS DateTime), N'')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (42, 45, 28, NULL, CAST(N'2025-03-10T11:24:09.180' AS DateTime), N'')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (43, 45, 29, NULL, CAST(N'2025-03-10T11:24:10.993' AS DateTime), N'')
INSERT [dbo].[TeethingRecord] ([id], [child_id], [tooth_id], [eruption_date], [record_time], [note]) VALUES (44, 21, 4, NULL, CAST(N'2025-03-10T13:33:04.873' AS DateTime), N'no')
SET IDENTITY_INSERT [dbo].[TeethingRecord] OFF
GO
SET IDENTITY_INSERT [dbo].[Tooth] ON 

INSERT [dbo].[Tooth] ([id], [number_of_teeth], [teething_period], [name]) VALUES (1, 1, 25, N'A')
INSERT [dbo].[Tooth] ([id], [number_of_teeth], [teething_period], [name]) VALUES (3, 1, 228, N'Upper Right Third Molar')
INSERT [dbo].[Tooth] ([id], [number_of_teeth], [teething_period], [name]) VALUES (4, 2, 150, N'Upper Right Second Molar')
INSERT [dbo].[Tooth] ([id], [number_of_teeth], [teething_period], [name]) VALUES (5, 3, 78, N'Upper Right First Molar')
INSERT [dbo].[Tooth] ([id], [number_of_teeth], [teething_period], [name]) VALUES (6, 4, 132, N'Upper Right Second Premolar')
INSERT [dbo].[Tooth] ([id], [number_of_teeth], [teething_period], [name]) VALUES (7, 5, 126, N'Upper Right First Premolar')
INSERT [dbo].[Tooth] ([id], [number_of_teeth], [teething_period], [name]) VALUES (8, 6, 138, N'Upper Right Canine')
INSERT [dbo].[Tooth] ([id], [number_of_teeth], [teething_period], [name]) VALUES (9, 7, 102, N'Upper Right Lateral Incisor')
INSERT [dbo].[Tooth] ([id], [number_of_teeth], [teething_period], [name]) VALUES (10, 8, 90, N'Upper Right Central Incisor')
INSERT [dbo].[Tooth] ([id], [number_of_teeth], [teething_period], [name]) VALUES (11, 9, 90, N'Upper Left Central Incisor')
INSERT [dbo].[Tooth] ([id], [number_of_teeth], [teething_period], [name]) VALUES (12, 10, 102, N'Upper Left Lateral Incisor')
INSERT [dbo].[Tooth] ([id], [number_of_teeth], [teething_period], [name]) VALUES (13, 11, 138, N'Upper Left Canine')
INSERT [dbo].[Tooth] ([id], [number_of_teeth], [teething_period], [name]) VALUES (14, 12, 126, N'Upper Left First Premolar')
INSERT [dbo].[Tooth] ([id], [number_of_teeth], [teething_period], [name]) VALUES (15, 13, 132, N'Upper Left Second Premolar')
INSERT [dbo].[Tooth] ([id], [number_of_teeth], [teething_period], [name]) VALUES (16, 14, 78, N'Upper Left First Molar')
INSERT [dbo].[Tooth] ([id], [number_of_teeth], [teething_period], [name]) VALUES (17, 15, 150, N'Upper Left Second Molar')
INSERT [dbo].[Tooth] ([id], [number_of_teeth], [teething_period], [name]) VALUES (18, 16, 228, N'Upper Left Third Molar')
INSERT [dbo].[Tooth] ([id], [number_of_teeth], [teething_period], [name]) VALUES (19, 17, 228, N'Lower Left Third Molar')
INSERT [dbo].[Tooth] ([id], [number_of_teeth], [teething_period], [name]) VALUES (20, 18, 144, N'Lower Left Second Molar')
INSERT [dbo].[Tooth] ([id], [number_of_teeth], [teething_period], [name]) VALUES (21, 19, 78, N'Lower Left First Molar')
INSERT [dbo].[Tooth] ([id], [number_of_teeth], [teething_period], [name]) VALUES (22, 20, 138, N'Lower Left Second Premolar')
INSERT [dbo].[Tooth] ([id], [number_of_teeth], [teething_period], [name]) VALUES (23, 21, 132, N'Lower Left First Premolar')
INSERT [dbo].[Tooth] ([id], [number_of_teeth], [teething_period], [name]) VALUES (24, 22, 114, N'Lower Left Canine')
INSERT [dbo].[Tooth] ([id], [number_of_teeth], [teething_period], [name]) VALUES (25, 23, 90, N'Lower Left Lateral Incisor')
INSERT [dbo].[Tooth] ([id], [number_of_teeth], [teething_period], [name]) VALUES (26, 24, 78, N'Lower Left Central Incisor')
INSERT [dbo].[Tooth] ([id], [number_of_teeth], [teething_period], [name]) VALUES (27, 25, 78, N'Lower Right Central Incisor')
INSERT [dbo].[Tooth] ([id], [number_of_teeth], [teething_period], [name]) VALUES (28, 26, 90, N'Lower Right Lateral Incisor')
INSERT [dbo].[Tooth] ([id], [number_of_teeth], [teething_period], [name]) VALUES (29, 27, 114, N'Lower Right Canine')
INSERT [dbo].[Tooth] ([id], [number_of_teeth], [teething_period], [name]) VALUES (30, 28, 132, N'Lower Right First Premolar')
INSERT [dbo].[Tooth] ([id], [number_of_teeth], [teething_period], [name]) VALUES (31, 29, 138, N'Lower Right Second Premolar')
INSERT [dbo].[Tooth] ([id], [number_of_teeth], [teething_period], [name]) VALUES (32, 30, 78, N'Lower Right First Molar')
INSERT [dbo].[Tooth] ([id], [number_of_teeth], [teething_period], [name]) VALUES (33, 31, 144, N'Lower Right Second Molar')
INSERT [dbo].[Tooth] ([id], [number_of_teeth], [teething_period], [name]) VALUES (34, 32, 228, N'Lower Right Third Molar')
SET IDENTITY_INSERT [dbo].[Tooth] OFF
GO

SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (1, N'a', N'nguyentrunghung03@gmail.com', NULL, N'12345678', N'Nguyen Trung Hung ', N'http://res.cloudinary.com/dbgdwk1jo/image/upload/v1741097079/plant.png', N'admin', N'active', CAST(N'2025-02-17T19:08:06.730' AS DateTime), 1, N'activated', N'123', N'123', N'123', N'Hankuk', NULL, NULL, N'từ dũ')
INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (2, N'a', N'nibohon111@noomlocs.com', NULL, N'12345678', N'nibohon111 Bảo', N'https://4.bp.blogspot.com/-cvjeZMIgcJQ/VzD8PkZvO2I/AAAAAAAA_2k/LaSQWXMFG1A1VMm0wSK0MVppDsOGs_s-wCKgB/s1600/doraemon.png', N'member', N'active', CAST(N'2025-02-17T15:08:51.910' AS DateTime), 1, N'unactivated', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (3, N'a', N'tvq05112003@gmail.com', N'0989 966 565', N'12345678', N'Admin  Nè', N'https://img.freepik.com/premium-vector/magic-owl_655829-65.jpg?w=826', N'admin', N'active', CAST(N'2025-02-17T15:24:50.053' AS DateTime), 1, N'unactivated', N'Quận 7, TP.HCM', N'', N'', N'', N'', NULL, N'')
INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (4, N'a', N'thean10088@gmail.com', NULL, N'string', N'thean10088', N'https://img.freepik.com/free-vector/hand-drawn-valentines-day-animal-couple_23-2148796097.jpg?t=st=1739854051~exp=1739857651~hmac=77cb5fa6de1353e3f29534f0280da75ebd61049af52e81f6e8278e9949ff42fd&w=826', N'member', N'active', CAST(N'2025-02-17T23:50:09.153' AS DateTime), 3, N'activated', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (5, N'a', N'flutteraccount@gmail.com', NULL, N'Matkhaula1', N'flutteraccount', N'https://img.freepik.com/free-vector/hand-drawn-owl-outline-illustration_23-2149285219.jpg?t=st=1739854071~exp=1739857671~hmac=5da5e7096a9957354fc558b54cfd6de11950218ab3efdfa62eb5b4d1ca1866ce&w=826', N'member', N'active', CAST(N'2025-02-18T01:51:07.130' AS DateTime), 1, N'unactivated', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (6, N'a', N'sangtruong2804.work@gmail.com', N'0397627499', N'Matkhaula2', N'Truong Sanggg', N'https://img.freepik.com/free-vector/illustration-drawing-style-set-wildlife_53876-36868.jpg?t=st=1739854093~exp=1739857693~hmac=1da0027b5cf427cdd9bcff908c0c061e0bd2d05e76cec952701eb9bc984286be&w=826', N'member', N'active', CAST(N'2025-02-18T02:38:55.657' AS DateTime), 1, N'activated', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (7, N'a', N'unnamedguyontheinternet@gmail.com', NULL, N'string', N'unnamedguyontheinternet', N'https://img.freepik.com/free-vector/vintage-owl-pole-vector-art-print-remix-from-artworks-by-theo-van-hoytema_53876-127748.jpg?t=st=1739854107~exp=1739857707~hmac=5fce859a5f5c66ae396c4330a51a6a880b7ef0c2ad8e5a5b154f46dc026766c9&w=826', N'admin', N'active', CAST(N'2025-02-18T09:53:31.343' AS DateTime), 1, N'activated', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (8, N'a', N'freedomtohongkong@gmail.com', NULL, N'12345678', N'freedomtohongkong', N'https://img.freepik.com/free-vector/hand-drawn-cartoon-owl-illustration_23-2150391988.jpg?t=st=1739854126~exp=1739857726~hmac=c6853ab1518e77208c0fe0067d85a35d2eb6f2476d0e4b2ac851f4f23d7ac1f2&w=826', N'doctor', N'active', CAST(N'2025-02-18T09:58:50.297' AS DateTime), 1, N'activated', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (9, N'a', N'truongsang280403@gmail.com', NULL, N'Matkhaula1', N'truongsang280403', N'https://img.freepik.com/premium-vector/adorable-owl-with-moonlit-background-cartoon-vector-design_1080480-51236.jpg?w=826', N'member', N'active', CAST(N'2025-02-18T02:59:03.063' AS DateTime), 1, N'unactivated', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (10, N'a', N'test3@gmail.com', NULL, N'11111111', N'Nguyen Anh Khoa', N'https://img.freepik.com/premium-vector/big-boss-man-owl_53876-2641.jpg?w=826', N'member', N'active', CAST(N'2025-02-18T02:59:23.330' AS DateTime), 1, N'unactivated', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (11, N'a', N'ngkhoa1610@gmail.com', NULL, N'11111111', N'Nguyen Anh Khoa', N'https://img.freepik.com/free-vector/hand-drawn-cartoon-owl-illustration_23-2150375096.jpg?t=st=1739854199~exp=1739857799~hmac=32c0f9feb50173958a72b8bab31fa19417e2490cbff0408e7faadcb1513803a9&w=826', N'admin', N'active', CAST(N'2025-02-18T04:16:24.413' AS DateTime), 1, N'unactivated', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (12, N'a', N'normal@gmail.com', NULL, N'12345678', N'normal', N'', N'member', N'active', CAST(N'2025-02-18T04:27:14.170' AS DateTime), 1, N'unactivated', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (13, N'a', N'sangtruong280403@gmail.com', NULL, N'Matkhaula1', N'sangtruong280403', N'', N'member', N'active', CAST(N'2025-02-18T06:31:27.343' AS DateTime), 1, N'unactivated', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (14, N'a', N'gidol30426@prorsd.com', N'0987 654 322', N'12345678', N'Trương Quyến ', N'http://res.cloudinary.com/dbgdwk1jo/image/upload/v1741403009/j97.jpg', N'member', N'active', CAST(N'2025-02-19T17:59:33.923' AS DateTime), 3, N'unactivated', N'Quận 9, TP.HCM', N'', N'', N'', N'', NULL, N'')
INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (15, N'a', N'something@example.com', NULL, N'string', N'something', N'', N'member', N'active', CAST(N'2025-02-20T19:38:12.943' AS DateTime), 1, N'unactivated', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (16, N'a', N'string@example.com', NULL, N'string1231233123123', N'string', N'', N'admin', N'active', CAST(N'2025-02-20T12:39:12.633' AS DateTime), 1, N'unactivated', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (17, N'a', N'test4@gmail.com', N'0909933402', N'11111111', N'Nguyen Khoa', N'http://res.cloudinary.com/dbgdwk1jo/image/upload/v1741598887/191163-ghibli-wallpaper-1920x1080-mobile.jpg', N'member', N'active', CAST(N'2025-02-20T21:37:35.357' AS DateTime), 1, N'unactivated', N'59 Huhuhuh', N'312312', N'Thu Duc City', N'bangladesh', NULL, NULL, NULL)
INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (18, N'a', N'test5@gmail.com', NULL, N'11111111', N'test5', N'', N'doctor', N'active', CAST(N'2025-02-20T21:39:08.643' AS DateTime), 1, N'unactivated', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (19, N'a', N'test6@gmail.com', NULL, N'11111111', N'test6', N'', N'doctor', N'active', CAST(N'2025-02-20T21:39:52.160' AS DateTime), 1, N'unactivated', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (20, N'a', N'ahahah@gmail.com', NULL, N'11111111', N'ahahah', N'', N'doctor', N'active', CAST(N'2025-02-20T21:40:58.453' AS DateTime), 1, N'unactivated', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (21, N'a', N'lancuoi@gmail.com', NULL, N'11111111', N'lancuoi', N'', N'doctor', N'active', CAST(N'2025-02-20T21:47:53.563' AS DateTime), 1, N'unactivated', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (22, N'a', N'lancuoicuoi@gmail.com', NULL, N'12345678', N'lancuoicuoi', N'', N'doctor', N'active', CAST(N'2025-02-20T21:52:51.180' AS DateTime), 1, N'unactivated', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (23, N'a', N'lancuoi2@gmail.com', NULL, N'11111111', N'lancuoi2', N'', N'doctor', N'active', CAST(N'2025-02-20T21:54:20.647' AS DateTime), 1, N'unactivated', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (24, N'a', N'test45@gmail.com', NULL, N'1111111', N'test45', N'', N'doctor', N'active', CAST(N'2025-02-20T21:54:43.417' AS DateTime), 1, N'unactivated', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (25, N'a', N'test46@gmail.com', NULL, N'11111111', N'test46', N'', N'member', N'active', CAST(N'2025-02-20T21:55:15.590' AS DateTime), 1, N'unactivated', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (26, N'a', N'test61@gmail.com', NULL, N'11111111', N'test61', N'', N'member', N'active', CAST(N'2025-02-20T21:55:42.037' AS DateTime), 3, N'unactivated', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (27, N'a', N'showtoast@gmail.com', NULL, N'11111111', N'showtoast', N'', N'member', N'active', CAST(N'2025-02-20T21:58:06.230' AS DateTime), 1, N'unactivated', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (28, N'a', N'hungntse182394@fpt.edu.vn', NULL, N'string', N'hungntse182394', N'', N'member', N'active', CAST(N'2025-02-25T15:19:43.183' AS DateTime), 2, N'activated', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (29, N'a', N'bin10082003@gmail.com', NULL, N'string', N'bin10082003', N'', N'member', N'active', CAST(N'2025-03-04T19:13:13.710' AS DateTime), 3, N'unactivated', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (30, N'a', N'taodepchaivcl1008@gmail.com', NULL, N'string', N'taodepchaivcl1008', N'', N'member', N'active', CAST(N'2025-03-04T19:38:41.883' AS DateTime), 3, N'unactivated', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (31, N'a', N'usertest@gmail.com', NULL, N'12345678', N'usertest', N'', N'member', N'active', CAST(N'2025-03-06T16:32:05.177' AS DateTime), 1, N'unactivated', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (32, N'a', N'usertest01@gmail.com', N'0989 966 565', N'12345678', N'Jack J97', N'https://th.bing.com/th/id/OIP.9q1xNavsc5p2CmUsjnsToAHaHa?rs=1&pid=ImgDetMain', N'member', N'active', CAST(N'2025-03-06T16:34:05.147' AS DateTime), 3, N'unactivated', N'Quận 7, TP.HCM', N'', N'', N'', N'', NULL, N'')
INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (33, N'a', N'anntse170505@fpt.edu.vn', NULL, N'string', N'anntse170505', N'', N'member', N'active', CAST(N'2025-03-07T13:51:42.510' AS DateTime), 3, N'activated', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (34, N'a', N'doctor@gmail.com', NULL, N'12345678', N'doctor', N'', N'member', N'active', CAST(N'2025-03-07T11:16:45.943' AS DateTime), 1, N'unactivated', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (35, N'a', N'doctortotest@gmail.com', N'0989 966 565', N'12345678', N'ThsBs Nguyễn Văn Hậu ', N'http://res.cloudinary.com/dbgdwk1jo/image/upload/v1741402944/jack-j97.jpg', N'doctor', N'active', CAST(N'2025-03-07T11:18:35.333' AS DateTime), 1, N'unactivated', N'Qu?n 7, TP.HCM', N'', N'', N'', N'Chuyên khoa dinh dưỡng', NULL, N'Bệnh viện nhi đồng')
INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (36, N'a', N'manion.bergquist@vtdat.com', NULL, N'12345678', N'manion.bergquist', N'', N'member', N'active', CAST(N'2025-03-10T10:59:18.620' AS DateTime), 2, N'unactivated', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (37, N'a', N'consuegra.monnett@vtdat.com', N'123456789', N'12345677', N'Tèo Nguyễn', N'http://res.cloudinary.com/dbgdwk1jo/image/upload/v1741606920/Screenshot_2025-03-10_175930.png', N'member', N'active', CAST(N'2025-03-10T11:16:16.623' AS DateTime), 2, N'activated', N'nhà má mày', N'', N'', N'', N'', NULL, N'')
INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (38, N'a', N'abc@gmail.com', NULL, N'12345678', N'abc', N'', N'member', N'active', CAST(N'2025-03-10T11:33:41.980' AS DateTime), 1, N'unactivated', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([user_id], [uid], [email], [phone_number], [password_hash], [full_name], [avatar], [role], [status], [created_at], [membership_package_id], [email_activation], [address], [zipcode], [state], [country], [specialization], [license_number], [hospital]) VALUES (39, N'a', N'hergenrader.balmir@vtdat.com', NULL, N'12345678', N'hergenrader.balmir', N'', N'member', N'active', CAST(N'2025-03-11T05:55:06.917' AS DateTime), 1, N'activated', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET IDENTITY_INSERT [dbo].[Vaccination_Schedule] ON 

INSERT [dbo].[Vaccination_Schedule] ([id], [vaccine_id], [recommended_age_months]) VALUES (5, 4, 0)
INSERT [dbo].[Vaccination_Schedule] ([id], [vaccine_id], [recommended_age_months]) VALUES (6, 4, 2)
INSERT [dbo].[Vaccination_Schedule] ([id], [vaccine_id], [recommended_age_months]) VALUES (7, 4, 6)
INSERT [dbo].[Vaccination_Schedule] ([id], [vaccine_id], [recommended_age_months]) VALUES (8, 5, 2)
INSERT [dbo].[Vaccination_Schedule] ([id], [vaccine_id], [recommended_age_months]) VALUES (9, 5, 4)
INSERT [dbo].[Vaccination_Schedule] ([id], [vaccine_id], [recommended_age_months]) VALUES (10, 5, 6)
INSERT [dbo].[Vaccination_Schedule] ([id], [vaccine_id], [recommended_age_months]) VALUES (11, 6, 2)
INSERT [dbo].[Vaccination_Schedule] ([id], [vaccine_id], [recommended_age_months]) VALUES (12, 6, 4)
INSERT [dbo].[Vaccination_Schedule] ([id], [vaccine_id], [recommended_age_months]) VALUES (13, 6, 6)
INSERT [dbo].[Vaccination_Schedule] ([id], [vaccine_id], [recommended_age_months]) VALUES (14, 6, 15)
INSERT [dbo].[Vaccination_Schedule] ([id], [vaccine_id], [recommended_age_months]) VALUES (15, 6, 48)
INSERT [dbo].[Vaccination_Schedule] ([id], [vaccine_id], [recommended_age_months]) VALUES (16, 7, 2)
INSERT [dbo].[Vaccination_Schedule] ([id], [vaccine_id], [recommended_age_months]) VALUES (17, 7, 4)
INSERT [dbo].[Vaccination_Schedule] ([id], [vaccine_id], [recommended_age_months]) VALUES (18, 7, 6)
INSERT [dbo].[Vaccination_Schedule] ([id], [vaccine_id], [recommended_age_months]) VALUES (19, 7, 12)
INSERT [dbo].[Vaccination_Schedule] ([id], [vaccine_id], [recommended_age_months]) VALUES (20, 8, 2)
INSERT [dbo].[Vaccination_Schedule] ([id], [vaccine_id], [recommended_age_months]) VALUES (21, 8, 4)
INSERT [dbo].[Vaccination_Schedule] ([id], [vaccine_id], [recommended_age_months]) VALUES (22, 8, 6)
INSERT [dbo].[Vaccination_Schedule] ([id], [vaccine_id], [recommended_age_months]) VALUES (23, 8, 12)
INSERT [dbo].[Vaccination_Schedule] ([id], [vaccine_id], [recommended_age_months]) VALUES (24, 9, 2)
INSERT [dbo].[Vaccination_Schedule] ([id], [vaccine_id], [recommended_age_months]) VALUES (25, 9, 4)
INSERT [dbo].[Vaccination_Schedule] ([id], [vaccine_id], [recommended_age_months]) VALUES (26, 9, 6)
INSERT [dbo].[Vaccination_Schedule] ([id], [vaccine_id], [recommended_age_months]) VALUES (27, 9, 48)
INSERT [dbo].[Vaccination_Schedule] ([id], [vaccine_id], [recommended_age_months]) VALUES (28, 10, 6)
INSERT [dbo].[Vaccination_Schedule] ([id], [vaccine_id], [recommended_age_months]) VALUES (29, 11, 12)
INSERT [dbo].[Vaccination_Schedule] ([id], [vaccine_id], [recommended_age_months]) VALUES (30, 11, 48)
INSERT [dbo].[Vaccination_Schedule] ([id], [vaccine_id], [recommended_age_months]) VALUES (31, 12, 12)
INSERT [dbo].[Vaccination_Schedule] ([id], [vaccine_id], [recommended_age_months]) VALUES (32, 12, 48)
INSERT [dbo].[Vaccination_Schedule] ([id], [vaccine_id], [recommended_age_months]) VALUES (33, 13, 12)
INSERT [dbo].[Vaccination_Schedule] ([id], [vaccine_id], [recommended_age_months]) VALUES (34, 14, 132)
INSERT [dbo].[Vaccination_Schedule] ([id], [vaccine_id], [recommended_age_months]) VALUES (35, 15, 132)
INSERT [dbo].[Vaccination_Schedule] ([id], [vaccine_id], [recommended_age_months]) VALUES (36, 16, 132)
INSERT [dbo].[Vaccination_Schedule] ([id], [vaccine_id], [recommended_age_months]) VALUES (37, 17, 192)
INSERT [dbo].[Vaccination_Schedule] ([id], [vaccine_id], [recommended_age_months]) VALUES (38, 18, 216)
INSERT [dbo].[Vaccination_Schedule] ([id], [vaccine_id], [recommended_age_months]) VALUES (39, 19, 108)
SET IDENTITY_INSERT [dbo].[Vaccination_Schedule] OFF
GO
SET IDENTITY_INSERT [dbo].[Vaccine] ON 

INSERT [dbo].[Vaccine] ([id], [name], [description], [doses_required]) VALUES (4, N'Hepatitis B', N'Contagious viral infection of the liver; spread through contact with infected body fluids such as blood or semen', 3)
INSERT [dbo].[Vaccine] ([id], [name], [description], [doses_required]) VALUES (5, N'Rotavirus', N'Contagious viral infection of the gut; spread through the mouth from hands and food contaminated with stool', 3)
INSERT [dbo].[Vaccine] ([id], [name], [description], [doses_required]) VALUES (6, N'DTaP', N'Contagious bacterial infection of the nose, throat, and sometimes lungs; spread through air and direct contact', 5)
INSERT [dbo].[Vaccine] ([id], [name], [description], [doses_required]) VALUES (7, N'Hib', N'Contagious bacterial infection of the lungs, brain and spinal cord, or bloodstream; spread through air and direct contact', 4)
INSERT [dbo].[Vaccine] ([id], [name], [description], [doses_required]) VALUES (8, N'Pneumococcal', N'Bacterial infections of ears, sinuses, lungs, or bloodstream; spread through direct contact with respiratory droplets like saliva or mucus', 4)
INSERT [dbo].[Vaccine] ([id], [name], [description], [doses_required]) VALUES (9, N'Polio', N'Contagious viral infection of nerves and brain; spread through the mouth from stool on contaminated hands, food or liquid, and by air and direct contact', 4)
INSERT [dbo].[Vaccine] ([id], [name], [description], [doses_required]) VALUES (10, N'COVID-19', N'Contagious viral infection of the nose, throat, or lungs; may feel like a cold or flu. Spread through air and direct contact', 1)
INSERT [dbo].[Vaccine] ([id], [name], [description], [doses_required]) VALUES (11, N'MMR', N'Contagious viral infection that causes high fever, cough, red eyes, runny nose, and rash; spread through air and direct contact', 2)
INSERT [dbo].[Vaccine] ([id], [name], [description], [doses_required]) VALUES (12, N'Chickenpox', N'Contagious viral infection that causes fever, headache, and an itchy, blistering rash; spread through air and direct contact', 2)
INSERT [dbo].[Vaccine] ([id], [name], [description], [doses_required]) VALUES (13, N'Hepatitis A', N'Contagious viral infection of the liver; spread by contaminated food or drink or close contact with an infected person', 2)
INSERT [dbo].[Vaccine] ([id], [name], [description], [doses_required]) VALUES (14, N'HPV', N'Contagious viral infection spread by close skin-to-skin touching, including during sex', 3)
INSERT [dbo].[Vaccine] ([id], [name], [description], [doses_required]) VALUES (15, N'Tdap', N'Infection caused by bacterial spores found in soil and dust everywhere; spores enter the body through wounds or broken skin', 1)
INSERT [dbo].[Vaccine] ([id], [name], [description], [doses_required]) VALUES (16, N'Meningococcal ACWY', N'Contagious bacterial infection of the lining of the brain and spinal cord or the bloodstream; spread through air and direct contact', 2)
INSERT [dbo].[Vaccine] ([id], [name], [description], [doses_required]) VALUES (17, N'Meningococcal B', N'Contagious bacterial infection of the lining of the brain and spinal cord or the bloodstream; spread through air and direct contact', 2)
INSERT [dbo].[Vaccine] ([id], [name], [description], [doses_required]) VALUES (18, N'Mpox', N'Contagious viral infection spread through close, often skin-to-skin contact, including sex; causes a painful rash, fever, headache, tiredness, cough, runny nose, sore throat, swollen lymph nodes', 2)
INSERT [dbo].[Vaccine] ([id], [name], [description], [doses_required]) VALUES (19, N'Dengue', N'Viral infection spread by bite from infected mosquito; causes, fever, headache, pain behind the eyes, rash, joint pain, body ache, nausea, loss of appetite, feeling tired, abdominal pain', 3)
SET IDENTITY_INSERT [dbo].[Vaccine] OFF
GO
SET IDENTITY_INSERT [dbo].[VaccineRecord] ON 

INSERT [dbo].[VaccineRecord] ([id], [child_id], [vaccine_id], [administered_date], [dose], [next_dose_date]) VALUES (15, 13, 4, CAST(N'2025-03-09T00:00:00.000' AS DateTime), 1, CAST(N'2025-05-09T00:00:00.000' AS DateTime))
INSERT [dbo].[VaccineRecord] ([id], [child_id], [vaccine_id], [administered_date], [dose], [next_dose_date]) VALUES (16, 13, 4, CAST(N'2025-03-04T00:00:00.000' AS DateTime), 2, CAST(N'2025-07-04T00:00:00.000' AS DateTime))
INSERT [dbo].[VaccineRecord] ([id], [child_id], [vaccine_id], [administered_date], [dose], [next_dose_date]) VALUES (17, 21, 4, CAST(N'2025-03-08T00:00:00.000' AS DateTime), 1, CAST(N'2025-05-08T00:00:00.000' AS DateTime))
INSERT [dbo].[VaccineRecord] ([id], [child_id], [vaccine_id], [administered_date], [dose], [next_dose_date]) VALUES (18, 22, 4, CAST(N'2025-03-09T00:00:00.000' AS DateTime), 1, CAST(N'2025-05-09T00:00:00.000' AS DateTime))
INSERT [dbo].[VaccineRecord] ([id], [child_id], [vaccine_id], [administered_date], [dose], [next_dose_date]) VALUES (19, 24, 4, CAST(N'2025-03-09T00:00:00.000' AS DateTime), 1, CAST(N'2025-05-09T00:00:00.000' AS DateTime))
INSERT [dbo].[VaccineRecord] ([id], [child_id], [vaccine_id], [administered_date], [dose], [next_dose_date]) VALUES (20, 28, 4, CAST(N'2021-06-18T00:00:00.000' AS DateTime), 1, CAST(N'2021-08-18T00:00:00.000' AS DateTime))
INSERT [dbo].[VaccineRecord] ([id], [child_id], [vaccine_id], [administered_date], [dose], [next_dose_date]) VALUES (21, 28, 4, CAST(N'2021-06-18T00:00:00.000' AS DateTime), 2, CAST(N'2021-10-18T00:00:00.000' AS DateTime))
INSERT [dbo].[VaccineRecord] ([id], [child_id], [vaccine_id], [administered_date], [dose], [next_dose_date]) VALUES (22, 28, 5, CAST(N'2021-06-18T00:00:00.000' AS DateTime), 1, CAST(N'2021-08-18T00:00:00.000' AS DateTime))
INSERT [dbo].[VaccineRecord] ([id], [child_id], [vaccine_id], [administered_date], [dose], [next_dose_date]) VALUES (23, 28, 6, CAST(N'2021-06-18T00:00:00.000' AS DateTime), 1, CAST(N'2021-08-18T00:00:00.000' AS DateTime))
INSERT [dbo].[VaccineRecord] ([id], [child_id], [vaccine_id], [administered_date], [dose], [next_dose_date]) VALUES (24, 28, 7, CAST(N'2021-06-18T00:00:00.000' AS DateTime), 1, CAST(N'2021-08-18T00:00:00.000' AS DateTime))
INSERT [dbo].[VaccineRecord] ([id], [child_id], [vaccine_id], [administered_date], [dose], [next_dose_date]) VALUES (25, 40, 5, CAST(N'2025-03-10T00:00:00.000' AS DateTime), 1, CAST(N'2025-05-10T00:00:00.000' AS DateTime))
INSERT [dbo].[VaccineRecord] ([id], [child_id], [vaccine_id], [administered_date], [dose], [next_dose_date]) VALUES (26, 13, 5, CAST(N'2021-06-18T00:00:00.000' AS DateTime), 1, CAST(N'2021-08-18T00:00:00.000' AS DateTime))
INSERT [dbo].[VaccineRecord] ([id], [child_id], [vaccine_id], [administered_date], [dose], [next_dose_date]) VALUES (27, 13, 6, CAST(N'2021-06-18T00:00:00.000' AS DateTime), 1, CAST(N'2021-08-18T00:00:00.000' AS DateTime))
INSERT [dbo].[VaccineRecord] ([id], [child_id], [vaccine_id], [administered_date], [dose], [next_dose_date]) VALUES (28, 26, 4, CAST(N'2021-06-18T00:00:00.000' AS DateTime), 1, CAST(N'2021-08-18T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[VaccineRecord] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__membersh__53772C87AE70D60A]    Script Date: 3/11/2025 12:58:09 PM ******/
ALTER TABLE [dbo].[membership_packages] ADD UNIQUE NONCLUSTERED 
(
	[membership_package_name] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__permissi__81C0F5A21BDA3AE4]    Script Date: 3/11/2025 12:58:09 PM ******/
ALTER TABLE [dbo].[permissions] ADD UNIQUE NONCLUSTERED 
(
	[permission_name] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__AB6E61648F5CECDA]    Script Date: 3/11/2025 12:58:09 PM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[blog_contents] ADD  DEFAULT ((0)) FOR [views]
GO
ALTER TABLE [dbo].[blog_contents] ADD  DEFAULT ((0)) FOR [likes]
GO
ALTER TABLE [dbo].[blog_contents] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[children] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[children] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[consultation_notes] ADD  DEFAULT (getdate()) FOR [record_time]
GO
ALTER TABLE [dbo].[growth_indicators] ADD  DEFAULT (getdate()) FOR [record_time]
GO
ALTER TABLE [dbo].[membership_packages] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[PaymentTransactions] ADD  DEFAULT (getdate()) FOR [TransactionDate]
GO
ALTER TABLE [dbo].[TeethingRecord] ADD  DEFAULT (getdate()) FOR [record_time]
GO
ALTER TABLE [dbo].[user_memberships] ADD  DEFAULT (getdate()) FOR [start_date]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ('unactivated') FOR [email_activation]
GO
ALTER TABLE [dbo].[blog_categories]  WITH CHECK ADD  CONSTRAINT [FK_blog_categories_blog_contents] FOREIGN KEY([blog_content_id])
REFERENCES [dbo].[blog_contents] ([blog_content_id])
GO
ALTER TABLE [dbo].[blog_categories] CHECK CONSTRAINT [FK_blog_categories_blog_contents]
GO
ALTER TABLE [dbo].[blog_categories]  WITH CHECK ADD  CONSTRAINT [FK_blog_categories_categories] FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([category_id])
GO
ALTER TABLE [dbo].[blog_categories] CHECK CONSTRAINT [FK_blog_categories_categories]
GO
ALTER TABLE [dbo].[blog_contents]  WITH CHECK ADD  CONSTRAINT [FK_blog_contents_admin] FOREIGN KEY([admin_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[blog_contents] CHECK CONSTRAINT [FK_blog_contents_admin]
GO
ALTER TABLE [dbo].[children]  WITH CHECK ADD  CONSTRAINT [FK_children_users] FOREIGN KEY([member_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[children] CHECK CONSTRAINT [FK_children_users]
GO
ALTER TABLE [dbo].[consultation_notes]  WITH CHECK ADD  CONSTRAINT [FK_consultation_notes_children] FOREIGN KEY([children_id])
REFERENCES [dbo].[children] ([children_id])
GO
ALTER TABLE [dbo].[consultation_notes] CHECK CONSTRAINT [FK_consultation_notes_children]
GO
ALTER TABLE [dbo].[consultation_notes]  WITH CHECK ADD  CONSTRAINT [FK_consultation_notes_doctor] FOREIGN KEY([doctor_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[consultation_notes] CHECK CONSTRAINT [FK_consultation_notes_doctor]
GO
ALTER TABLE [dbo].[consultation_notes]  WITH CHECK ADD  CONSTRAINT [FK_consultation_notes_member] FOREIGN KEY([member_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[consultation_notes] CHECK CONSTRAINT [FK_consultation_notes_member]
GO
ALTER TABLE [dbo].[Deviation_Analysis]  WITH CHECK ADD FOREIGN KEY([growth_record_id])
REFERENCES [dbo].[growth_indicators] ([growth_indicators_id])
GO
ALTER TABLE [dbo].[feedbacks]  WITH CHECK ADD  CONSTRAINT [FK_feedbacks_users] FOREIGN KEY([member_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[feedbacks] CHECK CONSTRAINT [FK_feedbacks_users]
GO
ALTER TABLE [dbo].[growth_indicators]  WITH CHECK ADD  CONSTRAINT [FK_growth_indicators_children] FOREIGN KEY([children_id])
REFERENCES [dbo].[children] ([children_id])
GO
ALTER TABLE [dbo].[growth_indicators] CHECK CONSTRAINT [FK_growth_indicators_children]
GO
ALTER TABLE [dbo].[package_permissions]  WITH CHECK ADD  CONSTRAINT [FK_package_permissions_membership_packages] FOREIGN KEY([membership_package_id])
REFERENCES [dbo].[membership_packages] ([membership_package_id])
GO
ALTER TABLE [dbo].[package_permissions] CHECK CONSTRAINT [FK_package_permissions_membership_packages]
GO
ALTER TABLE [dbo].[package_permissions]  WITH CHECK ADD  CONSTRAINT [FK_package_permissions_permissions] FOREIGN KEY([permission_id])
REFERENCES [dbo].[permissions] ([permission_id])
GO
ALTER TABLE [dbo].[package_permissions] CHECK CONSTRAINT [FK_package_permissions_permissions]
GO
ALTER TABLE [dbo].[PaymentTransactions]  WITH CHECK ADD  CONSTRAINT [FK_PaymentTransactions_MembershipPackages] FOREIGN KEY([MembershipPackageId])
REFERENCES [dbo].[membership_packages] ([membership_package_id])
GO
ALTER TABLE [dbo].[PaymentTransactions] CHECK CONSTRAINT [FK_PaymentTransactions_MembershipPackages]
GO
ALTER TABLE [dbo].[PaymentTransactions]  WITH CHECK ADD  CONSTRAINT [FK_PaymentTransactions_UserMembership] FOREIGN KEY([user_membership_id])
REFERENCES [dbo].[user_memberships] ([user_membership_id])
GO
ALTER TABLE [dbo].[PaymentTransactions] CHECK CONSTRAINT [FK_PaymentTransactions_UserMembership]
GO
ALTER TABLE [dbo].[PaymentTransactions]  WITH CHECK ADD  CONSTRAINT [FK_PaymentTransactions_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[PaymentTransactions] CHECK CONSTRAINT [FK_PaymentTransactions_Users]
GO
ALTER TABLE [dbo].[replies]  WITH CHECK ADD  CONSTRAINT [FK_replies_admin] FOREIGN KEY([admin_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[replies] CHECK CONSTRAINT [FK_replies_admin]
GO
ALTER TABLE [dbo].[replies]  WITH CHECK ADD  CONSTRAINT [FK_replies_feedbacks] FOREIGN KEY([feedback_id])
REFERENCES [dbo].[feedbacks] ([feedback_id])
GO
ALTER TABLE [dbo].[replies] CHECK CONSTRAINT [FK_replies_feedbacks]
GO
ALTER TABLE [dbo].[TeethingRecord]  WITH CHECK ADD FOREIGN KEY([child_id])
REFERENCES [dbo].[children] ([children_id])
GO
ALTER TABLE [dbo].[TeethingRecord]  WITH CHECK ADD FOREIGN KEY([tooth_id])
REFERENCES [dbo].[Tooth] ([id])
GO
ALTER TABLE [dbo].[user_memberships]  WITH CHECK ADD  CONSTRAINT [FK_user_memberships_membership_packages] FOREIGN KEY([membership_package_id])
REFERENCES [dbo].[membership_packages] ([membership_package_id])
GO
ALTER TABLE [dbo].[user_memberships] CHECK CONSTRAINT [FK_user_memberships_membership_packages]
GO
ALTER TABLE [dbo].[user_memberships]  WITH CHECK ADD  CONSTRAINT [FK_user_memberships_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[user_memberships] CHECK CONSTRAINT [FK_user_memberships_users]
GO
ALTER TABLE [dbo].[user_memberships]  WITH CHECK ADD  CONSTRAINT [FK_UserMemberships_PaymentTransactions] FOREIGN KEY([PaymentTransactionId])
REFERENCES [dbo].[PaymentTransactions] ([PaymentTransactionId])
GO
ALTER TABLE [dbo].[user_memberships] CHECK CONSTRAINT [FK_UserMemberships_PaymentTransactions]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_membership_packages] FOREIGN KEY([membership_package_id])
REFERENCES [dbo].[membership_packages] ([membership_package_id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_membership_packages]
GO
ALTER TABLE [dbo].[Vaccination_Schedule]  WITH CHECK ADD FOREIGN KEY([vaccine_id])
REFERENCES [dbo].[Vaccine] ([id])
GO
ALTER TABLE [dbo].[VaccineRecord]  WITH CHECK ADD FOREIGN KEY([child_id])
REFERENCES [dbo].[children] ([children_id])
GO
ALTER TABLE [dbo].[VaccineRecord]  WITH CHECK ADD  CONSTRAINT [FK_VaccineRecord_Vaccine] FOREIGN KEY([vaccine_id])
REFERENCES [dbo].[Vaccine] ([id])
GO
ALTER TABLE [dbo].[VaccineRecord] CHECK CONSTRAINT [FK_VaccineRecord_Vaccine]
GO
ALTER TABLE [dbo].[blog_contents]  WITH CHECK ADD CHECK  (([status]='archived' OR [status]='draft' OR [status]='published'))
GO
ALTER TABLE [dbo].[membership_packages]  WITH CHECK ADD CHECK  (([status]='inactive' OR [status]='active'))
GO
ALTER TABLE [dbo].[PaymentTransactions]  WITH CHECK ADD CHECK  (([Status]='failed' OR [Status]='success' OR [Status]='pending'))
GO
ALTER TABLE [dbo].[user_memberships]  WITH CHECK ADD  CONSTRAINT [CK__user_memb__status] CHECK  (([status]='pending' OR [status]='active' OR [status]='expired' OR [status]='cancelled'))
GO
ALTER TABLE [dbo].[user_memberships] CHECK CONSTRAINT [CK__user_memb__status]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD CHECK  (([email_activation]='failed' OR [email_activation]='activated' OR [email_activation]='unactivated'))
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD CHECK  (([role]='doctor' OR [role]='member' OR [role]='admin'))
GO 
ALTER TABLE [dbo].[users]  WITH CHECK ADD CHECK  (([status]='inactive' OR [status]='active'))
GO

