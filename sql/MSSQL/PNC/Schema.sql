CREATE DATABASE [PNCRMS] ON  PRIMARY 
( NAME = N'PNCRMS_Data', FILENAME = N'D:\MSSQL\DB\PNCRMS.MDF' , SIZE = 5224000KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'PNCRMS_Log', FILENAME = N'D:\MSSQL\DB\PNCRMS_1.LDF' , SIZE = 5184KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
GO
ALTER DATABASE [PNCRMS] SET COMPATIBILITY_LEVEL = 80
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PNCRMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PNCRMS] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [PNCRMS] SET ANSI_NULLS OFF
GO
ALTER DATABASE [PNCRMS] SET ANSI_PADDING OFF
GO
ALTER DATABASE [PNCRMS] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [PNCRMS] SET ARITHABORT OFF
GO
ALTER DATABASE [PNCRMS] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [PNCRMS] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [PNCRMS] SET AUTO_SHRINK ON
GO
ALTER DATABASE [PNCRMS] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [PNCRMS] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [PNCRMS] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [PNCRMS] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [PNCRMS] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [PNCRMS] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [PNCRMS] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [PNCRMS] SET  ENABLE_BROKER
GO
ALTER DATABASE [PNCRMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [PNCRMS] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [PNCRMS] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [PNCRMS] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [PNCRMS] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [PNCRMS] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [PNCRMS] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [PNCRMS] SET  READ_WRITE
GO
ALTER DATABASE [PNCRMS] SET RECOVERY FULL
GO
ALTER DATABASE [PNCRMS] SET  MULTI_USER
GO
ALTER DATABASE [PNCRMS] SET PAGE_VERIFY TORN_PAGE_DETECTION
GO
ALTER DATABASE [PNCRMS] SET DB_CHAINING OFF
GO
USE [PNCRMS]
GO
/****** Object:  Table [dbo].[Forms_Ctrl]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Forms_Ctrl](
	[Code] [int] NOT NULL,
	[Description] [varchar](50) NULL,
	[Screen_Type] [char](1) NULL,
	[Is_Add] [bit] NOT NULL,
	[Is_Edit] [bit] NOT NULL,
	[Is_Delete] [bit] NOT NULL,
	[Is_View] [bit] NOT NULL,
	[Is_Print] [bit] NOT NULL,
	[Is_Preview] [bit] NOT NULL,
 CONSTRAINT [PK_Forms_Ctrl] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Fee_Type_Ctrl]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Fee_Type_Ctrl](
	[Code] [numeric](18, 0) NULL,
	[Description] [varchar](50) NULL,
	[Active] [varchar](1) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Fee_Transaction_Information]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Fee_Transaction_Information](
	[Registration_Record_No] [numeric](18, 0) NOT NULL,
	[Document_Number] [varchar](10) NOT NULL,
	[Active] [varchar](1) NULL,
 CONSTRAINT [PK_Fee_Transaction_Information] PRIMARY KEY CLUSTERED 
(
	[Registration_Record_No] ASC,
	[Document_Number] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [Fee_Transaction_Information] ON [dbo].[Fee_Transaction_Information] 
(
	[Registration_Record_No] ASC,
	[Document_Number] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fee_Transaction_Detail]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fee_Transaction_Detail](
	[Registration_Record_No] [numeric](18, 0) NOT NULL,
	[Fee_Code] [numeric](18, 0) NOT NULL,
	[Late_Years] [numeric](18, 0) NULL,
	[Fee_Amount] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Fee_Transaction_Detail] PRIMARY KEY CLUSTERED 
(
	[Fee_Code] ASC,
	[Registration_Record_No] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fee_Detail]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Fee_Detail](
	[Code] [numeric](18, 0) NOT NULL,
	[Registration_Type] [varchar](1) NULL,
	[Fee_Type_Code] [numeric](18, 0) NULL,
	[Registration_Category_Code] [numeric](18, 0) NULL,
	[Fee_Amount] [money] NULL,
	[Default_Optional] [varchar](1) NULL,
	[Active] [varchar](1) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Fee_Detail] ON [dbo].[Fee_Detail] 
(
	[Registration_Type] ASC,
	[Registration_Category_Code] ASC,
	[Fee_Type_Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Division_Ctrl]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Division_Ctrl](
	[Code] [numeric](18, 0) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Province_Code] [numeric](18, 0) NULL,
	[Active] [varchar](1) NOT NULL,
 CONSTRAINT [PK_Division_Ctrl] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[District_Ctrl]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[District_Ctrl](
	[Code] [numeric](18, 0) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Division_Code] [numeric](18, 0) NULL,
	[Active] [varchar](50) NOT NULL,
 CONSTRAINT [PK_District_Ctrl] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Designation_Ctrl]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Designation_Ctrl](
	[Code] [numeric](18, 0) NOT NULL,
	[Description] [varchar](50) NULL,
	[Active] [varchar](1) NULL,
 CONSTRAINT [PK_Designation_Ctrl] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Country_Ctrl]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Country_Ctrl](
	[Code] [numeric](18, 0) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Active] [varchar](1) NOT NULL,
 CONSTRAINT [PK_Country_Ctrl] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[City_Ctrl]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[City_Ctrl](
	[Code] [numeric](18, 0) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[District_Code] [numeric](18, 0) NULL,
	[Active] [varchar](1) NOT NULL,
 CONSTRAINT [PK_City_Ctrl] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Board_ctrl]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Board_ctrl](
	[Code] [numeric](18, 0) NOT NULL,
	[Description] [varchar](150) NOT NULL,
	[Active] [varchar](1) NOT NULL,
 CONSTRAINT [PK_Board_ctrl] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bank_Draft_Information]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bank_Draft_Information](
	[Document_Number] [varchar](11) NOT NULL,
	[Bank_Draft_No] [varchar](50) NOT NULL,
	[Bank_Code] [numeric](18, 0) NULL,
	[Bank_Branch] [varchar](75) NOT NULL,
	[Draft_Type] [char](1) NOT NULL,
	[Transaction_Type] [char](1) NOT NULL,
	[Institution_Code] [numeric](18, 0) NULL,
	[Serial_Number] [numeric](18, 0) NULL,
	[Bank_Draft_Date] [datetime] NOT NULL,
	[Total_Amount] [money] NOT NULL,
	[Balance_Amount] [money] NULL,
	[Created_By] [numeric](18, 0) NOT NULL,
	[Created_On] [datetime] NOT NULL,
	[Amended_By] [numeric](18, 0) NULL,
	[Amended_On] [datetime] NULL,
 CONSTRAINT [PK_Bank_Draft_Information] PRIMARY KEY CLUSTERED 
(
	[Document_Number] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Bank_Draft_Information] ON [dbo].[Bank_Draft_Information] 
(
	[Bank_Draft_No] ASC,
	[Bank_Draft_Date] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bank_Ctrl]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bank_Ctrl](
	[Code] [numeric](18, 0) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Active] [char](1) NOT NULL,
 CONSTRAINT [PK_Bank_Ctrl] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Application_Status_Ctrl]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Application_Status_Ctrl](
	[Code] [numeric](18, 0) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Active] [varchar](1) NOT NULL,
 CONSTRAINT [PK_Application_Status_Ctrl] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Applicant_Verification_Refund_Fee_Information]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Applicant_Verification_Refund_Fee_Information](
	[Record_No] [numeric](18, 0) NOT NULL,
	[Document_Number] [varchar](11) NOT NULL,
	[Reference_Doucment_No] [varchar](11) NULL,
	[Checque_No] [varchar](15) NULL,
	[Bank_Code] [numeric](18, 0) NULL,
	[Receival_Type] [varchar](1) NULL,
	[Transaction_Date] [datetime] NULL,
	[Refundable_Amount] [money] NULL,
	[Created_By] [numeric](18, 0) NULL,
	[Created_On] [datetime] NULL,
	[Amended_By] [numeric](18, 0) NULL,
	[Amended_On] [datetime] NULL,
 CONSTRAINT [PK_Applicant_Verification_Refund_Fee_Information] PRIMARY KEY CLUSTERED 
(
	[Record_No] ASC,
	[Document_Number] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Applicant_Speciality_Information]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applicant_Speciality_Information](
	[Serial_No] [numeric](18, 0) NOT NULL,
	[Speciality_Code] [numeric](18, 0) NOT NULL,
	[Organization_Code] [numeric](18, 0) NULL,
	[Speciality_Starting_Date] [datetime] NULL,
	[Speciality_Ending_Date] [datetime] NULL
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Applicant_Speciality_Information] ON [dbo].[Applicant_Speciality_Information] 
(
	[Serial_No] ASC,
	[Speciality_Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Applicant_Registration_Information]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Applicant_Registration_Information](
	[Registration_Record_No] [numeric](18, 0) NOT NULL,
	[Serial_No] [numeric](18, 0) NULL,
	[Registration_No] [varchar](14) NULL,
	[Registration_Type] [varchar](1) NULL,
	[Registration_Category_Code] [numeric](18, 0) NULL,
	[Registration_Initial_Category] [varchar](1) NULL,
	[Registration_Date] [datetime] NULL,
	[Issue_Date] [datetime] NULL,
	[Expiry_Date] [datetime] NULL,
	[Transaction_Amount] [money] NULL,
	[Created_By] [numeric](18, 0) NULL,
	[Created_On] [datetime] NULL,
	[Amended_By] [numeric](18, 0) NULL,
	[Amended_On] [datetime] NULL,
	[First_Reminder_Date] [datetime] NULL,
	[Last_Reminder_Date] [datetime] NULL,
	[Receipt_Status] [varchar](1) NULL,
 CONSTRAINT [PK_Applicant_Registration_Information] PRIMARY KEY CLUSTERED 
(
	[Registration_Record_No] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Applicant_Registration_History]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Applicant_Registration_History](
	[Serial_No] [numeric](18, 0) NULL,
	[Old_Registration_No] [varchar](10) NULL,
	[Old_Registration_Category_Code] [numeric](18, 0) NULL,
	[New_Registration_Category_Code] [numeric](18, 0) NULL,
	[New_Registration_No] [varchar](10) NULL,
	[Created_By] [numeric](18, 0) NULL,
	[Created_On] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Applicant_Refund_Fee_Information]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Applicant_Refund_Fee_Information](
	[Registration_Record_No] [numeric](18, 0) NOT NULL,
	[Document_Number] [varchar](11) NOT NULL,
	[Reference_Doucment_No] [varchar](11) NULL,
	[Checque_No] [varchar](15) NULL,
	[Bank_Code] [numeric](18, 0) NULL,
	[Receival_Type] [varchar](1) NULL,
	[Transaction_Date] [datetime] NULL,
	[Refundable_Amount] [money] NULL,
	[Created_By] [numeric](18, 0) NULL,
	[Created_On] [datetime] NULL,
	[Amended_By] [numeric](18, 0) NULL,
	[Amended_On] [datetime] NULL,
 CONSTRAINT [PK_Applicant_Refund_Fee_Information] PRIMARY KEY CLUSTERED 
(
	[Registration_Record_No] ASC,
	[Document_Number] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Applicant_Receipt_Serial_No]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applicant_Receipt_Serial_No](
	[User_ID] [numeric](18, 0) NOT NULL,
	[Serial_No] [numeric](18, 0) NOT NULL,
	[Record_No] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Applicant_Receipt_Serial_No] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC,
	[Serial_No] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Applicant_Qualification_Information]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Applicant_Qualification_Information](
	[Serial_No] [numeric](18, 0) NOT NULL,
	[Qualification_Code] [numeric](18, 0) NOT NULL,
	[Board_Code] [numeric](18, 0) NULL,
	[Institution_Code] [numeric](18, 0) NULL,
	[Passing_Year] [varchar](4) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Applicant_Qualification_Information] ON [dbo].[Applicant_Qualification_Information] 
(
	[Serial_No] ASC,
	[Qualification_Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Applicant_Personal_Information]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Applicant_Personal_Information](
	[Serial_No] [numeric](18, 0) NOT NULL,
	[Applicant_Full_Name] [varchar](50) NULL,
	[Applicant_Matriculation_Name] [varchar](50) NULL,
	[Applicant_Father_Name] [varchar](50) NULL,
	[Marital_Status_Code] [numeric](18, 0) NULL,
	[SDH] [varchar](1) NULL,
	[Gender] [varchar](1) NULL,
	[Ever_Register] [char](1) NULL,
	[Old_Serial_No] [numeric](18, 0) NULL,
	[Old_Reg_No] [varchar](15) NULL,
	[Date_Of_Birth] [datetime] NULL,
	[Place_Of_Birth] [varchar](50) NULL,
	[NIC_No] [varchar](20) NULL,
	[Passport_No] [varchar](20) NULL,
	[Application_Status] [varchar](1) NULL,
	[Religion_Code] [numeric](18, 0) NULL,
	[Applicant_Picture] [image] NULL,
	[Applicant_Signature] [image] NULL,
	[Nationality_Code] [numeric](18, 0) NULL,
	[Domicile_Code] [numeric](18, 0) NULL,
	[Permanent_Address] [varchar](128) NULL,
	[Permanent_City_Code] [numeric](18, 0) NULL,
	[Permanent_Ph_No] [varchar](20) NULL,
	[Permanent_Fax_No] [varchar](20) NULL,
	[Present_Address] [varchar](128) NULL,
	[Present_City_Code] [numeric](18, 0) NULL,
	[Present_Ph_No] [varchar](20) NULL,
	[Present_Fax_No] [varchar](20) NULL,
	[Mobile_No] [varchar](25) NULL,
	[EMail_Address] [varchar](35) NULL,
	[Is_Currently_Employeed] [varchar](1) NULL,
	[Over_Age] [varchar](12) NULL,
	[Block_Profile] [varchar](1) NULL,
	[Reason] [varchar](100) NULL,
	[Registration_No] [varchar](10) NULL,
	[Created_By] [numeric](18, 0) NOT NULL,
	[Created_On] [datetime] NULL,
	[Amended_By] [numeric](18, 0) NULL,
	[Amended_On] [datetime] NULL,
	[Initial_Registration_Date] [datetime] NULL,
 CONSTRAINT [PK_Applicant_Personal_Information] PRIMARY KEY CLUSTERED 
(
	[Serial_No] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Applicant_Personal_Information] ON [dbo].[Applicant_Personal_Information] 
(
	[Serial_No] ASC,
	[Applicant_Full_Name] ASC,
	[Applicant_Matriculation_Name] ASC,
	[Applicant_Father_Name] ASC,
	[NIC_No] ASC,
	[Gender] ASC,
	[Registration_No] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Applicant_Personal_Informaiton_Lost_Data]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Applicant_Personal_Informaiton_Lost_Data](
	[Serial_No] [numeric](18, 0) NOT NULL,
	[Applicant_Full_Name] [varchar](50) NULL,
	[Applicant_Matriculation_Name] [varchar](50) NULL,
	[Applicant_Father_Name] [varchar](50) NULL,
	[Marital_Status_Code] [numeric](18, 0) NULL,
	[SDH] [varchar](1) NULL,
	[Gender] [varchar](1) NULL,
	[Ever_Register] [char](1) NULL,
	[Old_Serial_No] [numeric](18, 0) NULL,
	[Old_Reg_No] [varchar](15) NULL,
	[Date_Of_Birth] [datetime] NULL,
	[Place_Of_Birth] [varchar](50) NULL,
	[NIC_No] [varchar](20) NULL,
	[Passport_No] [varchar](20) NULL,
	[Application_Status] [varchar](1) NULL,
	[Religion_Code] [numeric](18, 0) NULL,
	[Applicant_Picture] [image] NULL,
	[Applicant_Signature] [image] NULL,
	[Nationality_Code] [numeric](18, 0) NULL,
	[Domicile_Code] [numeric](18, 0) NULL,
	[Permanent_Address] [varchar](128) NULL,
	[Permanent_City_Code] [numeric](18, 0) NULL,
	[Permanent_Ph_No] [varchar](20) NULL,
	[Permanent_Fax_No] [varchar](20) NULL,
	[Present_Address] [varchar](128) NULL,
	[Present_City_Code] [numeric](18, 0) NULL,
	[Present_Ph_No] [varchar](20) NULL,
	[Present_Fax_No] [varchar](20) NULL,
	[Mobile_No] [varchar](25) NULL,
	[EMail_Address] [varchar](35) NULL,
	[Is_Currently_Employeed] [varchar](1) NULL,
	[Over_Age] [varchar](12) NULL,
	[Block_Profile] [varchar](1) NULL,
	[Reason] [varchar](100) NULL,
	[Registration_No] [varchar](10) NULL,
	[Created_By] [numeric](18, 0) NOT NULL,
	[Created_On] [datetime] NULL,
	[Amended_By] [numeric](18, 0) NULL,
	[Amended_On] [datetime] NULL,
	[Initial_Registration_Date] [datetime] NULL,
	[Domicilestatus] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[Get_Applicant_Data]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_Applicant_Data] AS
	DECLARE Applicant_Perosnal_Information_Cursor CURSOR FOR
	SELECT * FROM PNCRMS.dbo.Applicant_Perosnal_Information
		OPEN Applicant_Perosnal_Information_Cursor
		FETCH NEXT FROM Applicant_Perosnal_Information_Cursor
WHILE @@FETCH_STATUS = 0
BEGIN
   FETCH NEXT FROM Applicant_Perosnal_Information_Cursor
END

CLOSE Applicant_Perosnal_Information_Cursor
DEALLOCATE Applicant_Perosnal_Information_Cursor
GO
/****** Object:  Table [dbo].[Applicant_Order_By_Ctrl]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applicant_Order_By_Ctrl](
	[Serial_No] [numeric](18, 0) NOT NULL,
	[Record_No] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Applicant_Order_By_Ctrl] PRIMARY KEY CLUSTERED 
(
	[Serial_No] ASC,
	[Record_No] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Applicant_NIC_No]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Applicant_NIC_No](
	[NIC_No] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Applicant_New_Entry_Information]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Applicant_New_Entry_Information](
	[Serial_No] [numeric](18, 0) NULL,
	[Registration_Record_No] [numeric](18, 0) NOT NULL,
	[Registration_Category_Code] [numeric](18, 0) NOT NULL,
	[Draft_Type] [varchar](1) NULL,
	[Document_No] [varchar](11) NULL,
	[New_Entry_Date] [datetime] NULL,
	[New_Entry_Fee] [money] NULL,
	[Created_By] [numeric](18, 0) NOT NULL,
	[Created_On] [datetime] NOT NULL,
	[Amended_By] [numeric](18, 0) NULL,
	[Amended_On] [datetime] NULL,
 CONSTRAINT [PK_Applicant_New_Entry_Information] PRIMARY KEY CLUSTERED 
(
	[Registration_Record_No] ASC,
	[Registration_Category_Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Applicant_New_Entry_Information] ON [dbo].[Applicant_New_Entry_Information] 
(
	[Registration_Record_No] ASC,
	[Registration_Category_Code] ASC,
	[Document_No] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Applicant_Lost_Data_Recovery]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Applicant_Lost_Data_Recovery](
	[SerialNo] [numeric](18, 0) NULL,
	[RegistrationCategory] [numeric](18, 0) NULL,
	[RegistrationNo] [varchar](10) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Applicant_Job_History_Information]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Applicant_Job_History_Information](
	[Serial_No] [numeric](18, 0) NOT NULL,
	[Code] [numeric](18, 0) NOT NULL,
	[Job_Type_Code] [numeric](18, 0) NULL,
	[Organization_Code] [numeric](18, 0) NULL,
	[Designation_Code] [numeric](18, 0) NULL,
	[Job_Starting_Date] [datetime] NULL,
	[Job_Ending_Date] [datetime] NULL,
	[Active] [char](1) NULL,
 CONSTRAINT [PK_Applicant_Job_History_Information] PRIMARY KEY CLUSTERED 
(
	[Serial_No] ASC,
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Applicant_Basic_Qualification_Information]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applicant_Basic_Qualification_Information](
	[Serial_No] [numeric](18, 0) NOT NULL,
	[Basic_Qualification_Code] [numeric](18, 0) NOT NULL,
	[Basic_Board_Code] [numeric](18, 0) NULL,
	[Institution_Code] [numeric](18, 0) NULL,
	[Period_From] [datetime] NULL,
	[Period_To] [datetime] NULL,
	[Created_By] [numeric](18, 0) NULL,
	[Created_On] [datetime] NULL,
	[Amended_By] [numeric](18, 0) NULL,
	[Amended_On] [datetime] NULL,
 CONSTRAINT [PK_Application_Basic_Qualification_Information] PRIMARY KEY CLUSTERED 
(
	[Serial_No] ASC,
	[Basic_Qualification_Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Speciality_Storage]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Speciality_Storage](
	[Serial_No] [numeric](18, 0) NULL,
	[Speciality_Code] [numeric](18, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Speciality_Ctrl]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Speciality_Ctrl](
	[Code] [numeric](18, 0) NOT NULL,
	[Abbreviation] [varchar](12) NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[Active] [varchar](1) NOT NULL,
 CONSTRAINT [PK_Speciality_Ctrl] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Security_Privileges]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Security_Privileges](
	[Code] [numeric](10, 0) NOT NULL,
	[User_Code] [numeric](10, 0) NOT NULL,
	[Form_Code] [numeric](10, 0) NOT NULL,
	[Is_Add] [bit] NOT NULL,
	[Is_Edit] [bit] NOT NULL,
	[Is_Delete] [bit] NOT NULL,
	[Is_View] [bit] NOT NULL,
	[Is_Print] [bit] NOT NULL,
	[Is_Preview] [bit] NOT NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Security_Privileges] ON [dbo].[Security_Privileges] 
(
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rptApplicant_Registration_Information]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rptApplicant_Registration_Information](
	[User_ID] [numeric](18, 0) NOT NULL,
	[Registration_Record_No] [numeric](18, 0) NOT NULL,
	[Serial_No] [numeric](18, 0) NULL,
	[Registration_No] [varchar](9) NULL,
	[Registration_Type] [varchar](1) NULL,
	[Registration_Category_Code] [numeric](18, 0) NULL,
	[Registration_Initial_Category] [varchar](1) NULL,
	[Registration_Date] [datetime] NULL,
	[Issue_Date] [datetime] NULL,
	[Expiry_Date] [datetime] NULL,
	[Transaction_Amount] [money] NULL,
	[Created_By] [numeric](18, 0) NULL,
	[Created_On] [datetime] NULL,
	[Amended_By] [numeric](18, 0) NULL,
	[Amended_On] [datetime] NULL,
	[First_Reminder_Date] [datetime] NULL,
	[Last_Reminder_Date] [datetime] NULL,
	[Receipt_Status] [varchar](1) NULL,
 CONSTRAINT [PK_rptApplicant_Registration_Information] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC,
	[Registration_Record_No] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rpt_Registration_Statistics]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rpt_Registration_Statistics](
	[Registration_Record_No] [numeric](18, 0) NOT NULL,
	[Serial_No] [numeric](18, 0) NULL,
	[Registration_No] [varchar](9) NULL,
	[Registration_Type] [varchar](1) NULL,
	[Registration_Category_Code] [numeric](18, 0) NULL,
	[Registration_Initial_Category] [varchar](1) NULL,
	[Registration_Date] [datetime] NULL,
	[Issue_Date] [datetime] NULL,
	[Expiry_Date] [datetime] NULL,
	[Transaction_Amount] [money] NULL,
	[Created_By] [numeric](18, 0) NULL,
	[Created_On] [datetime] NULL,
	[Amended_By] [numeric](18, 0) NULL,
	[Amended_On] [datetime] NULL,
	[First_Reminder_Date] [datetime] NULL,
	[Last_Reminder_Date] [datetime] NULL,
	[Receipt_Status] [varchar](1) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rpt_Registration_Cards]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rpt_Registration_Cards](
	[Serial_No] [numeric](18, 0) NOT NULL,
	[User_ID] [numeric](18, 0) NOT NULL,
	[Front_Serial] [numeric](18, 0) NULL,
	[Back_Serial] [numeric](18, 0) NULL,
	[Registration_Record_No] [numeric](18, 0) NULL,
 CONSTRAINT [PK_rpt_Registration_Cards] PRIMARY KEY CLUSTERED 
(
	[Serial_No] ASC,
	[User_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rpt_Missing_Registration_No_Manual_Nurse]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rpt_Missing_Registration_No_Manual_Nurse](
	[Serial_No] [numeric](18, 0) NOT NULL,
	[Registration_No] [varchar](15) NULL,
	[Applicant_Father_Name] [varchar](100) NULL,
 CONSTRAINT [PK_rpt_Missing_Registration_No_Manual_Nurse] PRIMARY KEY CLUSTERED 
(
	[Serial_No] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rpt_Missing_Registration_No_Manual]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rpt_Missing_Registration_No_Manual](
	[Registration_No] [varchar](15) NOT NULL,
	[Serial_No] [numeric](18, 0) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Religion_Ctrl]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Religion_Ctrl](
	[Code] [smallint] NOT NULL,
	[Description] [varchar](35) NOT NULL,
	[Active] [varchar](1) NOT NULL,
 CONSTRAINT [PK_Religion_Ctrl] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Registration_Category_Ctrl]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Registration_Category_Ctrl](
	[Code] [numeric](18, 0) NOT NULL,
	[Description] [varchar](50) NULL,
	[Abbreviation] [varchar](1) NULL,
	[Next_Number] [numeric](18, 0) NULL,
	[Is_Basic_Qualification] [varchar](1) NULL,
	[Active] [varchar](1) NULL,
 CONSTRAINT [PK_Registration_Category_Ctrl] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Qualification_Ctrl]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Qualification_Ctrl](
	[Code] [numeric](18, 0) NOT NULL,
	[Description] [varchar](50) NULL,
	[Active] [varchar](1) NULL,
 CONSTRAINT [PK_Qualification_Ctrl] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Province_Ctrl]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Province_Ctrl](
	[Code] [numeric](18, 0) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Country_Code] [numeric](18, 0) NULL,
	[Active] [varchar](1) NOT NULL,
 CONSTRAINT [PK_Province_Ctrl] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Parameters_Ctrl]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Parameters_Ctrl](
	[Record_No] [numeric](18, 0) NOT NULL,
	[Organization_Title] [varchar](150) NOT NULL,
	[Address] [varchar](150) NULL,
	[Phone_No] [varchar](30) NULL,
	[Fax_No] [varchar](30) NULL,
	[Mobile_No] [varchar](30) NULL,
	[Email] [varchar](50) NULL,
	[Report_Footer] [varchar](150) NULL,
	[Logo] [image] NOT NULL,
	[Minimum_Age] [numeric](18, 0) NULL,
	[Company_URL] [varchar](50) NULL,
	[Signatory] [varchar](150) NULL,
	[RIC_Yes] [tinyint] NULL,
	[RIC_No] [tinyint] NULL,
	[No_Of_Days] [numeric](3, 0) NULL,
	[Registrar_Name] [varchar](50) NULL,
	[First_Reminder_Days] [tinyint] NULL,
	[Last_Reminder_Days] [tinyint] NULL,
 CONSTRAINT [PK_Parameters_Ctrl] PRIMARY KEY CLUSTERED 
(
	[Record_No] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Organization_Type_Ctrl]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Organization_Type_Ctrl](
	[Code] [numeric](18, 0) NOT NULL,
	[Description] [varchar](50) NULL,
	[Active] [varchar](1) NULL,
 CONSTRAINT [PK_Organization_Type_Ctrl] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Organization_Ctrl]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Organization_Ctrl](
	[Code] [numeric](18, 0) NOT NULL,
	[Description] [varchar](50) NULL,
	[Organization_Type_Code] [numeric](18, 0) NULL,
	[City_Code] [numeric](18, 0) NULL,
	[Ph_No] [varchar](20) NULL,
	[Fax_No] [varchar](20) NULL,
	[EMail_Address] [varchar](35) NULL,
	[Address] [varchar](120) NULL,
	[Active] [varchar](1) NULL,
 CONSTRAINT [PK_Organization_Ctrl] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Nationality_Ctrl]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Nationality_Ctrl](
	[Code] [numeric](5, 0) NOT NULL,
	[Description] [varchar](50) NULL,
	[Active] [varchar](1) NULL,
 CONSTRAINT [PK_Nationality_Ctrl] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Marital_Status_Ctrl]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Marital_Status_Ctrl](
	[Code] [numeric](18, 0) NOT NULL,
	[Description] [varchar](50) NULL,
	[Active] [varchar](1) NULL,
 CONSTRAINT [PK_Marital_Status_Ctrl] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Job_Type_Ctrl]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Job_Type_Ctrl](
	[Code] [numeric](18, 0) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Active] [varchar](1) NOT NULL,
 CONSTRAINT [PK_Job_Type_Ctrl] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Institution_Type_Ctrl]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Institution_Type_Ctrl](
	[Code] [numeric](18, 0) NOT NULL,
	[Description] [varchar](50) NULL,
	[Institution_Type] [varchar](1) NULL,
	[Active] [varchar](1) NULL,
 CONSTRAINT [PK_Institution_Type_Ctrl] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Institution_Ctrl]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Institution_Ctrl](
	[Code] [numeric](18, 0) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Institution_Detail_Code] [numeric](18, 0) NULL,
	[Institution_Type_Code] [numeric](18, 0) NULL,
	[Institution_Category] [varchar](1) NULL,
	[City_Code] [numeric](18, 0) NULL,
	[Ph_No] [varchar](20) NULL,
	[Fax_No] [varchar](20) NULL,
	[EMail_Address] [varchar](35) NULL,
	[Address] [varchar](120) NULL,
	[Active] [varchar](1) NULL,
 CONSTRAINT [PK_Institution_Ctrl] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Verification_Transaction_Information]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Verification_Transaction_Information](
	[Serial_No] [numeric](18, 0) NOT NULL,
	[Document_Number] [varchar](50) NOT NULL,
	[Transaction_Amount] [money] NULL,
	[Record_No] [numeric](18, 0) NOT NULL,
	[Created_On] [datetime] NULL,
	[Created_By] [numeric](18, 0) NULL,
	[Amended_On] [datetime] NULL,
	[Amended_By] [char](10) NULL,
	[Active] [varchar](1) NULL,
	[Verified_Unverified] [varchar](1) NULL,
	[Receipt_Status] [varchar](1) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Verification_Fee_Transaction_Detail]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Verification_Fee_Transaction_Detail](
	[Record_No] [numeric](18, 0) NOT NULL,
	[Fee_Code] [numeric](18, 0) NOT NULL,
	[Fee_Amount] [money] NULL,
	[Late_Fee] [numeric](18, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Info]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User_Info](
	[Code] [numeric](18, 0) NOT NULL,
	[Login_Name] [varchar](35) NOT NULL,
	[Full_Name] [varchar](100) NOT NULL,
	[Password] [varchar](20) NULL,
	[Administrator] [char](1) NOT NULL,
	[Is_Logged_In] [char](1) NOT NULL,
	[Machine_Name] [varchar](50) NULL,
	[User_Name] [varchar](50) NULL,
	[Login_Time] [datetime] NULL,
 CONSTRAINT [PK_User_Info] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Total_Amount_Balance_Amount_Not_Equal]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Total_Amount_Balance_Amount_Not_Equal](
	[Bank_Draft_No] [varchar](20) NULL,
	[Document_Number] [varchar](20) NULL,
	[Total_Amount] [money] NULL,
	[Balance_Amount] [money] NULL,
	[Created_On] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Test_Ctrl]    Script Date: 03/22/2016 17:12:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Test_Ctrl](
	[Code] [numeric](18, 0) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Institution_Detail_Code] [numeric](18, 0) NULL,
	[Institution_Type_Code] [numeric](18, 0) NULL,
	[Institution_Category] [varchar](1) NULL,
	[City_Code] [numeric](18, 0) NOT NULL,
	[Ph_No] [varchar](20) NULL,
	[Fax_No] [varchar](20) NULL,
	[EMail_Address] [varchar](35) NULL,
	[Address] [varchar](120) NULL,
	[Active] [varchar](1) NULL,
 CONSTRAINT [PK_Test_Ctrl] PRIMARY KEY CLUSTERED 
(
	[Description] ASC,
	[City_Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[vuw_Get_Applicant_Receipt_Data]    Script Date: 03/22/2016 17:12:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[vuw_Get_Applicant_Receipt_Data] as
Select Serial_No From Applicant_Registration_Information Where Serial_No Is Not Null
Union
Select Serial_No From Applicant_New_Entry_Information Where Serial_No Is Not Null
GO
/****** Object:  StoredProcedure [dbo].[Test]    Script Date: 03/22/2016 17:12:34 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Test] @User_ID as varchar(10), @Serial_No as varchar(10) AS

DECLARE @Sr_No as varchar(10)

Delete from rptApplicant_Registration_Information Where User_ID= @User_ID

DECLARE Applicant_Detail_Cursor CURSOR FOR
SELECT  Serial_No FROM PNCRMS.dbo.Applicant_Personal_Information Where Serial_no=@Serial_No



OPEN  Applicant_Detail_Cursor

FETCH FROM  Applicant_Detail_Cursor into @Sr_No

WHILE @@FETCH_STATUS = 0
	BEGIN
		Insert Into rptApplicant_Registration_Information Select Top 1 @User_ID, * from Applicant_Registration_Information Where Serial_No=@Sr_No Order by Registration_Date Desc
	    	FETCH NEXT FROM  Applicant_Detail_Cursor into @Sr_No
	END

CLOSE Applicant_Detail_Cursor

DEALLOCATE  Applicant_Detail_Cursor
GO
/****** Object:  View [dbo].[uvw_Speciality_Basic_Qualification]    Script Date: 03/22/2016 17:12:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE View [dbo].[uvw_Speciality_Basic_Qualification] as 
SELECT     'B' AS Type, [Applicant_Basic_Qualification_Information].[Serial_No], [Registration_Category_Ctrl].[Is_Basic_Qualification], 
                      [Registration_Category_Ctrl].[Description]
FROM          [Applicant_Basic_Qualification_Information] [Applicant_Basic_Qualification_Information] LEFT OUTER JOIN
                       [Registration_Category_Ctrl] [Registration_Category_Ctrl] ON 
                      [Applicant_Basic_Qualification_Information].[Basic_Qualification_Code] = [Registration_Category_Ctrl].[Code]
WHERE     [Registration_Category_Ctrl].[Is_Basic_Qualification] = 'N'  

UNION

SELECT     'S' AS Type, [Applicant_Personal_Information].[Serial_No], Cast([Applicant_Speciality_Information].[Serial_No] AS Varchar(10)), 
                      [Speciality_Ctrl].[Description]
FROM         ( [Applicant_Personal_Information] [Applicant_Personal_Information] LEFT OUTER JOIN
                       [Applicant_Speciality_Information] [Applicant_Speciality_Information] ON 
                      [Applicant_Personal_Information].[Serial_No] = [Applicant_Speciality_Information].[Serial_No]) LEFT OUTER JOIN
                       [Speciality_Ctrl] [Speciality_Ctrl] ON [Applicant_Speciality_Information].[Speciality_Code] = [Speciality_Ctrl].[Code]

Where [Speciality_Ctrl].[Description] Is Not Null
GO
/****** Object:  View [dbo].[uvw_Serial_No_Receipt_Data]    Script Date: 03/22/2016 17:12:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[uvw_Serial_No_Receipt_Data] As 
Select Serial_No From rptApplicant_Registration_Information
Union
Select Serial_No From Applicant_New_Entry_Information
GO
/****** Object:  View [dbo].[uvw_rpt_Country_Detail]    Script Date: 03/22/2016 17:12:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[uvw_rpt_Country_Detail]
AS
SELECT     dbo.Country_Ctrl.Code AS Country_Code, dbo.Country_Ctrl.Description AS Country_Desc, dbo.Province_Ctrl.Code AS Province_Code, 
                      dbo.Province_Ctrl.Description AS Province_Desc, dbo.Division_Ctrl.Code AS Division_Code, dbo.Division_Ctrl.Description AS Division_Desc, 
                      dbo.District_Ctrl.Code AS District_Code, dbo.District_Ctrl.Description AS District_Desc, dbo.City_Ctrl.Code AS City_Code, 
                      dbo.City_Ctrl.Description AS City_Desc
FROM         dbo.District_Ctrl LEFT OUTER JOIN
                      dbo.City_Ctrl ON dbo.District_Ctrl.Code = dbo.City_Ctrl.District_Code LEFT OUTER JOIN
                      dbo.Division_Ctrl ON dbo.District_Ctrl.Division_Code = dbo.Division_Ctrl.Code RIGHT OUTER JOIN
                      dbo.Province_Ctrl ON dbo.Division_Ctrl.Province_Code = dbo.Province_Ctrl.Code RIGHT OUTER JOIN
                      dbo.Country_Ctrl ON dbo.Province_Ctrl.Country_Code = dbo.Country_Ctrl.Code
GO
/****** Object:  View [dbo].[uvw_Registered_Applicant_Domicile_Wise]    Script Date: 03/22/2016 17:12:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[uvw_Registered_Applicant_Domicile_Wise]
AS
SELECT     TOP 100 PERCENT dbo.Applicant_Personal_Information.Serial_No, dbo.District_Ctrl.Code AS Domicile_Code, 
                      dbo.District_Ctrl.Description AS Domicile_Name, dbo.Division_Ctrl.Code AS Division_Code, dbo.Division_Ctrl.Description AS Division_Name, 
                      dbo.Province_Ctrl.Code AS Province_Code, dbo.Province_Ctrl.Description AS Province_Name, dbo.Country_Ctrl.Code AS Country_Code, 
                      dbo.Country_Ctrl.Description AS Country_NAme
FROM         dbo.Province_Ctrl LEFT OUTER JOIN
                      dbo.Country_Ctrl ON dbo.Province_Ctrl.Country_Code = dbo.Country_Ctrl.Code RIGHT OUTER JOIN
                      dbo.Division_Ctrl ON dbo.Province_Ctrl.Code = dbo.Division_Ctrl.Province_Code RIGHT OUTER JOIN
                      dbo.District_Ctrl ON dbo.Division_Ctrl.Code = dbo.District_Ctrl.Division_Code RIGHT OUTER JOIN
                      dbo.Applicant_Personal_Information ON dbo.District_Ctrl.Code = dbo.Applicant_Personal_Information.Domicile_Code
ORDER BY dbo.Applicant_Personal_Information.Serial_No
GO
/****** Object:  View [dbo].[uvw_Receipt_Detail]    Script Date: 03/22/2016 17:12:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[uvw_Receipt_Detail] As 
Select Serial_No From Applicant_Registration_Information Where Serial_No Is Not Null
Union
Select Serial_No From Applicant_New_Entry_Information  Where Serial_No Is Not Null
GO
/****** Object:  View [dbo].[uvw_Latest_Verification_Specialities]    Script Date: 03/22/2016 17:12:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[uvw_Latest_Verification_Specialities]
AS
SELECT     dbo.Applicant_Speciality_Information.Serial_No, dbo.Applicant_Speciality_Information.Speciality_Starting_Date, 
                      dbo.Applicant_Speciality_Information.Speciality_Ending_Date, dbo.Speciality_Ctrl.Description
FROM         dbo.Speciality_Ctrl RIGHT OUTER JOIN
                      dbo.Applicant_Speciality_Information ON dbo.Speciality_Ctrl.Code = dbo.Applicant_Speciality_Information.Speciality_Code
GO
/****** Object:  View [dbo].[uvw_Latest_Applicant_Verification]    Script Date: 03/22/2016 17:12:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[uvw_Latest_Applicant_Verification]
AS
SELECT     dbo.rptApplicant_Registration_Information.Serial_No, dbo.Applicant_Personal_Information.Applicant_Full_Name AS Applicant_Name, 
                      dbo.Applicant_Personal_Information.Applicant_Father_Name, dbo.Applicant_Personal_Information.SDH, 
                      dbo.Applicant_Personal_Information.Date_Of_Birth AS DOB, dbo.Applicant_Personal_Information.NIC_No AS NIC, 
                      dbo.Applicant_Personal_Information.Initial_Registration_Date AS Initial_Reg_Date, dbo.rptApplicant_Registration_Information.Issue_Date, 
                      dbo.rptApplicant_Registration_Information.Expiry_Date, dbo.Verification_Transaction_Information.Transaction_Amount, 
                      dbo.Bank_Draft_Information.Bank_Draft_No AS Draft_No, dbo.Bank_Ctrl.Description AS Bank_Name, dbo.Fee_Type_Ctrl.Description AS Fee_Desc, 
                      dbo.Bank_Draft_Information.Total_Amount, dbo.Fee_Detail.Fee_Amount, dbo.Verification_Transaction_Information.Active
FROM         dbo.Fee_Type_Ctrl INNER JOIN
                      dbo.Applicant_Personal_Information INNER JOIN
                      dbo.rptApplicant_Registration_Information INNER JOIN
                      dbo.Bank_Ctrl INNER JOIN
                      dbo.Verification_Transaction_Information INNER JOIN
                      dbo.Bank_Draft_Information ON dbo.Verification_Transaction_Information.Document_Number = dbo.Bank_Draft_Information.Document_Number ON 
                      dbo.Bank_Ctrl.Code = dbo.Bank_Draft_Information.Bank_Code ON 
                      dbo.rptApplicant_Registration_Information.Serial_No = dbo.Verification_Transaction_Information.Serial_No ON 
                      dbo.Applicant_Personal_Information.Serial_No = dbo.Verification_Transaction_Information.Serial_No AND 
                      dbo.Applicant_Personal_Information.Serial_No = dbo.rptApplicant_Registration_Information.Serial_No INNER JOIN
                      dbo.Verification_Fee_Transaction_Detail ON 
                      dbo.Verification_Transaction_Information.Record_No = dbo.Verification_Fee_Transaction_Detail.Record_No INNER JOIN
                      dbo.Fee_Detail ON dbo.Verification_Fee_Transaction_Detail.Fee_Code = dbo.Fee_Detail.Code ON 
                      dbo.Fee_Type_Ctrl.Code = dbo.Fee_Detail.Fee_Type_Code
GO
/****** Object:  View [dbo].[uvw_Institution_Listing]    Script Date: 03/22/2016 17:12:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[uvw_Institution_Listing]
AS
SELECT     dbo.Institution_Ctrl.Code, dbo.Institution_Ctrl.Description AS Institution_Name, dbo.Institution_Type_Ctrl.Description AS Instiution_Detail_Type, 
                      dbo.Organization_Type_Ctrl.Description, dbo.City_Ctrl.Description AS City
FROM         dbo.Institution_Ctrl LEFT OUTER JOIN
                      dbo.Organization_Type_Ctrl ON dbo.Institution_Ctrl.Institution_Type_Code = dbo.Organization_Type_Ctrl.Code LEFT OUTER JOIN
                      dbo.Institution_Type_Ctrl ON dbo.Institution_Ctrl.Institution_Detail_Code = dbo.Institution_Type_Ctrl.Code LEFT OUTER JOIN
                      dbo.City_Ctrl ON dbo.Institution_Ctrl.City_Code = dbo.City_Ctrl.Code
GO
/****** Object:  View [dbo].[uvw_Get_Verification_Daliy_rpt]    Script Date: 03/22/2016 17:12:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[uvw_Get_Verification_Daliy_rpt]
AS
SELECT     TOP 100 PERCENT dbo.Applicant_Personal_Information.Serial_No, dbo.Applicant_Personal_Information.Applicant_Full_Name, 
                      dbo.Applicant_Personal_Information.Applicant_Matriculation_Name, dbo.Applicant_Personal_Information.Applicant_Father_Name, 
                      dbo.Applicant_Personal_Information.Marital_Status_Code, dbo.Applicant_Personal_Information.SDH, 
                      dbo.Applicant_Personal_Information.Date_Of_Birth, dbo.Applicant_Personal_Information.NIC_No, 
                      dbo.Applicant_Personal_Information.Applicant_Picture, dbo.Applicant_Personal_Information.Registration_No, 
                      dbo.Verification_Transaction_Information.Created_On, dbo.Verification_Transaction_Information.Active, 
                      dbo.Verification_Transaction_Information.Verified_Unverified, dbo.Verification_Transaction_Information.Record_No
FROM         dbo.Verification_Transaction_Information LEFT OUTER JOIN
                      dbo.Applicant_Personal_Information ON dbo.Verification_Transaction_Information.Serial_No = dbo.Applicant_Personal_Information.Serial_No
ORDER BY dbo.Verification_Transaction_Information.Serial_No
GO
/****** Object:  View [dbo].[uvw_Get_Insitition_Names]    Script Date: 03/22/2016 17:12:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[uvw_Get_Insitition_Names]
AS
SELECT     dbo.Institution_Ctrl.Code, dbo.Institution_Ctrl.Description, dbo.City_Ctrl.Description AS City
FROM         dbo.Province_Ctrl LEFT OUTER JOIN
                      dbo.Country_Ctrl ON dbo.Province_Ctrl.Country_Code = dbo.Country_Ctrl.Code RIGHT OUTER JOIN
                      dbo.Division_Ctrl ON dbo.Province_Ctrl.Code = dbo.Division_Ctrl.Province_Code RIGHT OUTER JOIN
                      dbo.City_Ctrl LEFT OUTER JOIN
                      dbo.District_Ctrl ON dbo.City_Ctrl.District_Code = dbo.District_Ctrl.Code RIGHT OUTER JOIN
                      dbo.Institution_Ctrl ON dbo.City_Ctrl.Code = dbo.Institution_Ctrl.City_Code ON dbo.Division_Ctrl.Code = dbo.District_Ctrl.Division_Code
GO
/****** Object:  View [dbo].[uvw_Get_Expiry_Date]    Script Date: 03/22/2016 17:12:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[uvw_Get_Expiry_Date]
AS
SELECT     TOP 1 Expiry_Date, Serial_No
FROM         dbo.Applicant_Registration_Information
ORDER BY Registration_Date DESC
GO
/****** Object:  View [dbo].[uvw_Get_Domicile_Data]    Script Date: 03/22/2016 17:12:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[uvw_Get_Domicile_Data]
AS
SELECT     dbo.City_Ctrl.Code AS City_Code, dbo.City_Ctrl.Description AS City_Name, dbo.District_Ctrl.Code AS District_Code, 
                      dbo.District_Ctrl.Description AS District_Name, dbo.Division_Ctrl.Code AS Division_Code, dbo.Division_Ctrl.Description AS Division_Name, 
                      dbo.Province_Ctrl.Code AS Province_Code, dbo.Province_Ctrl.Description AS Province_Name, dbo.Country_Ctrl.Code AS Country_Code, 
                      dbo.Country_Ctrl.Description AS Country_Name
FROM         dbo.Division_Ctrl LEFT OUTER JOIN
                      dbo.Country_Ctrl RIGHT OUTER JOIN
                      dbo.Province_Ctrl ON dbo.Country_Ctrl.Code = dbo.Province_Ctrl.Country_Code ON 
                      dbo.Division_Ctrl.Province_Code = dbo.Province_Ctrl.Code RIGHT OUTER JOIN
                      dbo.District_Ctrl ON dbo.Division_Ctrl.Code = dbo.District_Ctrl.Division_Code FULL OUTER JOIN
                      dbo.City_Ctrl ON dbo.District_Ctrl.Code = dbo.City_Ctrl.District_Code
GO
/****** Object:  View [dbo].[uvw_Country_Listing]    Script Date: 03/22/2016 17:12:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[uvw_Country_Listing]
AS
SELECT     dbo.Country_Ctrl.Code AS Country_Code, dbo.Country_Ctrl.Description AS Country_Name, dbo.Province_Ctrl.Code AS Province_Code, 
                      dbo.Province_Ctrl.Description AS Province_Name, dbo.Division_Ctrl.Code AS Division_Code, dbo.Division_Ctrl.Description AS Division_Name, 
                      dbo.District_Ctrl.Code AS District_Code, dbo.District_Ctrl.Description AS District_Name, dbo.City_Ctrl.Code AS City_Code, 
                      dbo.City_Ctrl.Description AS City_Name
FROM         dbo.Province_Ctrl LEFT OUTER JOIN
                      dbo.Division_Ctrl LEFT OUTER JOIN
                      dbo.District_Ctrl LEFT OUTER JOIN
                      dbo.City_Ctrl ON dbo.District_Ctrl.Code = dbo.City_Ctrl.District_Code ON dbo.Division_Ctrl.Code = dbo.District_Ctrl.Division_Code ON 
                      dbo.Province_Ctrl.Code = dbo.Division_Ctrl.Province_Code RIGHT OUTER JOIN
                      dbo.Country_Ctrl ON dbo.Province_Ctrl.Code = dbo.Country_Ctrl.Code
GO
/****** Object:  View [dbo].[uvw_Country_Detail]    Script Date: 03/22/2016 17:12:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[uvw_Country_Detail]
AS
SELECT     dbo.District_Ctrl.Code AS District_Code, dbo.District_Ctrl.Description AS District_Name, dbo.Division_Ctrl.Code AS Division_Code, 
                      dbo.Division_Ctrl.Description AS Division_Name, dbo.Province_Ctrl.Code AS Province_Code, dbo.Province_Ctrl.Description AS Province_Name, 
                      dbo.Country_Ctrl.Code AS Country_Code, dbo.Country_Ctrl.Description AS Country_Name, dbo.City_Ctrl.Code AS City_Code, 
                      dbo.City_Ctrl.Description AS City_Name, dbo.Institution_Ctrl.Code AS Institution_Code, dbo.Institution_Ctrl.Description AS Institution_Name, 
                      dbo.Organization_Ctrl.Code AS Organization_Code, dbo.Organization_Ctrl.Description AS Organization_Name
FROM         dbo.City_Ctrl LEFT OUTER JOIN
                      dbo.Institution_Ctrl ON dbo.City_Ctrl.Code = dbo.Institution_Ctrl.City_Code LEFT OUTER JOIN
                      dbo.Organization_Ctrl ON dbo.City_Ctrl.Code = dbo.Organization_Ctrl.City_Code LEFT OUTER JOIN
                      dbo.District_Ctrl ON dbo.City_Ctrl.District_Code = dbo.District_Ctrl.Code LEFT OUTER JOIN
                      dbo.Country_Ctrl RIGHT OUTER JOIN
                      dbo.Province_Ctrl ON dbo.Country_Ctrl.Code = dbo.Province_Ctrl.Country_Code RIGHT OUTER JOIN
                      dbo.Division_Ctrl ON dbo.Province_Ctrl.Code = dbo.Division_Ctrl.Province_Code ON dbo.District_Ctrl.Division_Code = dbo.Division_Ctrl.Code
GO
/****** Object:  View [dbo].[uvw_Basic_Qualification]    Script Date: 03/22/2016 17:12:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE View [dbo].[uvw_Basic_Qualification] As 
Select Serial_no,Registration_Category_Ctrl.Description,Registration_Category_Ctrl.Code From Applicant_Basic_Qualification_Information,
Registration_Category_Ctrl
 Where  Applicant_Basic_Qualification_Information.Basic_Qualification_Code=Registration_Category_Ctrl.Code And Registration_Category_Ctrl.Is_Basic_Qualification='Y'
Union
Select Serial_No,Registration_Category_Ctrl.Description,Registration_Category_Ctrl.Code From Applicant_New_Entry_Information,
Registration_Category_Ctrl 
Where  Applicant_New_Entry_Information.Registration_Category_Code=Registration_Category_Ctrl.Code  And Registration_Category_Ctrl.Is_Basic_Qualification='Y'
GO
/****** Object:  View [dbo].[uvw_Applicant_Specialities_Information]    Script Date: 03/22/2016 17:12:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[uvw_Applicant_Specialities_Information]
AS
SELECT     dbo.Applicant_Speciality_Information.Serial_No, dbo.Speciality_Ctrl.Description AS Speciality_Desc, 
                      dbo.Applicant_Speciality_Information.Speciality_Starting_Date, dbo.Applicant_Speciality_Information.Speciality_Ending_Date
FROM         dbo.Applicant_Speciality_Information LEFT OUTER JOIN
                      dbo.Speciality_Ctrl ON dbo.Applicant_Speciality_Information.Speciality_Code = dbo.Speciality_Ctrl.Code
GO
/****** Object:  View [dbo].[uvw_Applicant_Registration_No]    Script Date: 03/22/2016 17:12:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[uvw_Applicant_Registration_No]
AS
SELECT     TOP 1 *
FROM         dbo.Applicant_Registration_Information
ORDER BY Registration_Date DESC
GO
/****** Object:  View [dbo].[uvw_Applicant_Complete_Address]    Script Date: 03/22/2016 17:12:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[uvw_Applicant_Complete_Address]
As
SELECT     dbo.Applicant_Personal_Information.Serial_No AS Serial_No, dbo.Applicant_Personal_Information.Registration_No AS Registration_No, 
                      dbo.Applicant_Personal_Information.Applicant_Full_Name AS Applicant_Name, 
                      CASE dbo.Applicant_Personal_Information.SDH WHEN 'S' THEN 'S/o' WHEN 'D' THEN 'D/o' ELSE 'W/o' END AS Applicant_Title, 
                      Applicant_Personal_Information.Applicant_Father_Name AS Father_Name, Upper(dbo.Applicant_Personal_Information.Present_Address) 
                      AS Present_Address, Upper(City_Ctrl.Description) AS City_Desc, Upper(District_Ctrl.Description) AS District_Desc, UPPER(Country_Ctrl.Description) 
                      AS Country_Desc, UPPER(Province_Ctrl.Description) AS Province_Desc, Applicant_Personal_Information.Present_Ph_No AS Ph, 
                      Applicant_Personal_Information.Present_Fax_No AS Fax_No
FROM         dbo.Applicant_Personal_Information LEFT OUTER JOIN
                      dbo.District_Ctrl LEFT OUTER JOIN
                      dbo.Country_Ctrl RIGHT OUTER JOIN
                      dbo.Province_Ctrl ON dbo.Country_Ctrl.Code = dbo.Province_Ctrl.Country_Code RIGHT OUTER JOIN
                      dbo.Division_Ctrl ON dbo.Province_Ctrl.Code = dbo.Division_Ctrl.Province_Code ON 
                      dbo.District_Ctrl.Division_Code = dbo.Division_Ctrl.Code RIGHT OUTER JOIN
                      dbo.City_Ctrl ON dbo.District_Ctrl.Code = dbo.City_Ctrl.District_Code ON dbo.Applicant_Personal_Information.Present_City_Code = dbo.City_Ctrl.Code
GO
/****** Object:  View [dbo].[uvw_Applicant_Basic_Qualification_Information]    Script Date: 03/22/2016 17:12:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[uvw_Applicant_Basic_Qualification_Information]
AS
SELECT     dbo.Applicant_Basic_Qualification_Information.Serial_No, dbo.Registration_Category_Ctrl.Description, dbo.Institution_Ctrl.Code, 
                      dbo.Institution_Ctrl.Description AS Insitution_Name, dbo.Applicant_Basic_Qualification_Information.Period_From, 
                      dbo.Applicant_Basic_Qualification_Information.Period_To
FROM         dbo.rptApplicant_Registration_Information INNER JOIN
                      dbo.Applicant_Basic_Qualification_Information ON 
                      dbo.rptApplicant_Registration_Information.Serial_No = dbo.Applicant_Basic_Qualification_Information.Serial_No LEFT OUTER JOIN
                      dbo.Institution_Ctrl ON dbo.Applicant_Basic_Qualification_Information.Institution_Code = dbo.Institution_Ctrl.Code LEFT OUTER JOIN
                      dbo.Registration_Category_Ctrl ON dbo.Applicant_Basic_Qualification_Information.Basic_Qualification_Code = dbo.Registration_Category_Ctrl.Code
GO
/****** Object:  View [dbo].[GetApplicantProfile]    Script Date: 03/22/2016 17:12:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[GetApplicantProfile]
As

Select * From Applicant_Personal_Information Where Serial_No=10
GO
/****** Object:  StoredProcedure [dbo].[Get_Registered_Nurses_Domicile_Wise]    Script Date: 03/22/2016 17:12:34 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Get_Registered_Nurses_Domicile_Wise]  @User_ID as varchar(10)  AS

DECLARE @Sr_No as varchar(10)

Delete from rpt_Registration_Statistics Where User_ID= @User_ID

DECLARE Applicant_Detail_Cursor CURSOR FOR
SELECT  Serial_No FROM PNCRMS.dbo.Applicant_Personal_Information  Where Domicile_Code Is Not Null




OPEN  Applicant_Detail_Cursor

FETCH FROM  Applicant_Detail_Cursor into @Sr_No

WHILE @@FETCH_STATUS = 0
	BEGIN
---		Insert Into rptApplicant_Registration_Information Select Top 1 @User_ID, * from Applicant_Registration_Information Where Serial_No=@Sr_No Order by Registration_Date Desc
Insert Into rpt_Registration_Statistics Select Top 1 @User_ID, * from Applicant_Registration_Information Where Serial_No=@Sr_No  Order by Expiry_Date Desc

	    	FETCH NEXT FROM  Applicant_Detail_Cursor into @Sr_No
	END

CLOSE Applicant_Detail_Cursor

DEALLOCATE  Applicant_Detail_Cursor
GO
/****** Object:  StoredProcedure [dbo].[Get_Registered_Nurses]    Script Date: 03/22/2016 17:12:34 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Get_Registered_Nurses]  @User_ID as varchar(10)  AS

DECLARE @Sr_No as varchar(10)

Delete from rpt_Registration_Statistics Where User_ID= @User_ID

DECLARE Applicant_Detail_Cursor CURSOR FOR
SELECT  Serial_No FROM PNCRMS.dbo.Applicant_Personal_Information 




OPEN  Applicant_Detail_Cursor

FETCH FROM  Applicant_Detail_Cursor into @Sr_No

WHILE @@FETCH_STATUS = 0
	BEGIN
---		Insert Into rptApplicant_Registration_Information Select Top 1 @User_ID, * from Applicant_Registration_Information Where Serial_No=@Sr_No Order by Registration_Date Desc
Insert Into rpt_Registration_Statistics Select Top 1 @User_ID, * from Applicant_Registration_Information Where Serial_No=@Sr_No  Order by Expiry_Date Desc

	    	FETCH NEXT FROM  Applicant_Detail_Cursor into @Sr_No
	END

CLOSE Applicant_Detail_Cursor

DEALLOCATE  Applicant_Detail_Cursor
GO
/****** Object:  StoredProcedure [dbo].[Get_Registered_Applicant_Detail_Count]    Script Date: 03/22/2016 17:12:34 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Get_Registered_Applicant_Detail_Count] @User_ID as varchar(10) ,@Reg_Date as DateTime AS

DECLARE @Sr_No as varchar(10)

Delete from rpt_Registration_Statistics Where User_ID= @User_ID

DECLARE Applicant_Detail_Cursor CURSOR FOR
SELECT  Serial_No FROM PNCRMS.dbo.Applicant_Personal_Information Where Serial_No In (Select Serial_No From Applicant_Registration_Information)
---SELECT  Serial_No FROM PNCRMS.dbo.Applicant_Registration_Information  Where Registration_Record_No Is Not Null And  Registration_Record_No In (Select Registration_Record_No From Fee_Transaction_Detail Where Registration_Record_No Is Not Null )



OPEN  Applicant_Detail_Cursor

FETCH FROM  Applicant_Detail_Cursor into @Sr_No

WHILE @@FETCH_STATUS = 0
	BEGIN
---		Insert Into rptApplicant_Registration_Information Select Top 1 @User_ID, * from Applicant_Registration_Information Where Serial_No=@Sr_No Order by Registration_Date Desc
Insert Into rpt_Registration_Statistics Select Top 1 @User_ID, * from Applicant_Registration_Information Where Serial_No=@Sr_No And Expiry_Date>= @Reg_Date Order by Registration_Date Desc

	    	FETCH NEXT FROM  Applicant_Detail_Cursor into @Sr_No
	END

CLOSE Applicant_Detail_Cursor

DEALLOCATE  Applicant_Detail_Cursor
GO
/****** Object:  StoredProcedure [dbo].[Get_Registered_Applicant_Detail]    Script Date: 03/22/2016 17:12:34 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Get_Registered_Applicant_Detail] @User_ID as varchar(10) AS

DECLARE @Sr_No as varchar(10)

Delete from rpt_Registration_Statistics Where User_ID= @User_ID

DECLARE Applicant_Detail_Cursor CURSOR FOR
SELECT  Serial_No FROM PNCRMS.dbo.Applicant_Personal_Information Where Serial_No In (Select Serial_No From Applicant_Registration_Information Where Registration_Record_No In (Select Registration_Record_No From Fee_Transaction_Information Where Registration_Record_No In (Select Registration_Record_No From Fee_Transaction_Detail)))
---SELECT  Serial_No FROM PNCRMS.dbo.Applicant_Registration_Information  Where Registration_Record_No Is Not Null And  Registration_Record_No In (Select Registration_Record_No From Fee_Transaction_Detail Where Registration_Record_No Is Not Null )



OPEN  Applicant_Detail_Cursor

FETCH FROM  Applicant_Detail_Cursor into @Sr_No

WHILE @@FETCH_STATUS = 0
	BEGIN
---		Insert Into rptApplicant_Registration_Information Select Top 1 @User_ID, * from Applicant_Registration_Information Where Serial_No=@Sr_No Order by Registration_Date Desc
Insert Into rpt_Registration_Statistics Select Top 1 @User_ID, * from Applicant_Registration_Information Where Serial_No=@Sr_No  
And  Registration_Record_No Is Not Null And Registration_Record_No In (Select Registration_Record_No From Fee_Transaction_Information Where Registration_Record_No In (Select Registration_Record_No From Fee_Transaction_Detail)) Order by Registration_Date Desc

	    	FETCH NEXT FROM  Applicant_Detail_Cursor into @Sr_No
	END

CLOSE Applicant_Detail_Cursor

DEALLOCATE  Applicant_Detail_Cursor
GO
/****** Object:  StoredProcedure [dbo].[Get_Initial_Registration_Category]    Script Date: 03/22/2016 17:12:34 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Get_Initial_Registration_Category]  @User_ID as varchar(10)  AS

DECLARE @Sr_No as varchar(10)

Delete from rpt_Registration_Statistics Where User_ID= @User_ID

DECLARE Applicant_Detail_Cursor CURSOR FOR
SELECT  Serial_No FROM PNCRMS.dbo.Applicant_Personal_Information 




OPEN  Applicant_Detail_Cursor

FETCH FROM  Applicant_Detail_Cursor into @Sr_No

WHILE @@FETCH_STATUS = 0
	BEGIN
---		Insert Into rptApplicant_Registration_Information Select Top 1 @User_ID, * from Applicant_Registration_Information Where Serial_No=@Sr_No Order by Registration_Date Desc
Insert Into rpt_Registration_Statistics Select Top 1 @User_ID, * from Applicant_Registration_Information Where Serial_No=@Sr_No And Registration_Initial_Category='N' And Registration_Type='N'  Order by Expiry_Date Desc

	    	FETCH NEXT FROM  Applicant_Detail_Cursor into @Sr_No
	END

CLOSE Applicant_Detail_Cursor

DEALLOCATE  Applicant_Detail_Cursor
GO
/****** Object:  StoredProcedure [dbo].[Get_Generate_Single_Receipt]    Script Date: 03/22/2016 17:12:34 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Get_Generate_Single_Receipt] @User_ID as varchar(10),@Serial_No  As Varchar(15) As

Delete from rptApplicant_Registration_Information Where User_ID= @User_ID

Insert Into rptApplicant_Registration_Information Select Top 1 @User_ID, * from Applicant_Registration_Information Where Serial_No=@Serial_No Order By Expiry_Date Desc
GO
/****** Object:  StoredProcedure [dbo].[Get_Applicant_Verification_Detail]    Script Date: 03/22/2016 17:12:34 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Get_Applicant_Verification_Detail] @User_ID as varchar(10),@Serial_No As Numeric(9)   As
Delete From rptApplicant_Registration_Information Where User_Id=@User_ID
Insert Into rptApplicant_Registration_Information Select Top 1 @User_ID,* From Applicant_Registration_Information Where Serial_No IN (@Serial_No )
Order by Registration_Date Desc
GO
/****** Object:  StoredProcedure [dbo].[Get_Applicant_Verification_Complete_Detail]    Script Date: 03/22/2016 17:12:34 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Get_Applicant_Verification_Complete_Detail] @User_ID as varchar(10)   As

DECLARE @Sr_No as varchar(10)

Delete from rptApplicant_Registration_Information Where User_ID= @User_ID

DECLARE Applicant_Detail_Cursor CURSOR FOR
Select Serial_No From Applicant_Receipt_Serial_No Where User_ID=@User_ID


OPEN  Applicant_Detail_Cursor

FETCH FROM  Applicant_Detail_Cursor into @Sr_No

WHILE @@FETCH_STATUS = 0
	BEGIN
---		Insert Into rptApplicant_Registration_Information Select Top 1 @User_ID, * from Applicant_Registration_Information Where Serial_No=@Sr_No Order by Registration_Date Desc\
	Print @Sr_No
Insert Into rptApplicant_Registration_Information Select Top 1 @User_ID, * from Applicant_Registration_Information Where Serial_No=@Sr_No 
And  Serial_No  In (Select Serial_No From Verification_Transaction_Information Where Active='Y'  And Record_No In  (Select Record_No From Verification_Fee_Transaction_Detail)) Order by Registration_Date Desc

	    	FETCH NEXT FROM  Applicant_Detail_Cursor into @Sr_No
	END

CLOSE Applicant_Detail_Cursor

DEALLOCATE  Applicant_Detail_Cursor
--GO
GO
/****** Object:  StoredProcedure [dbo].[Get_Applicant_Registration_Province_Wise]    Script Date: 03/22/2016 17:12:34 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_Applicant_Registration_Province_Wise] @User_ID as varchar(10),@Registration_Date  As Varchar(15)  As

DECLARE @Sr_No as varchar(10)

Delete from rptApplicant_Registration_Information Where User_ID= @User_ID
---Delete from Applicant_Receipt_Serial_No Where User_ID= @User_ID

DECLARE Applicant_Detail_Cursor CURSOR FOR
---Select Serial_No From rptApplicant_Registration_Information  Where User_ID=9
Select Serial_No From Applicant_Personal_Information  Where Domicile_Code Is Not Null 


OPEN  Applicant_Detail_Cursor

FETCH FROM  Applicant_Detail_Cursor into @Sr_No

WHILE @@FETCH_STATUS = 0
	BEGIN
---		Insert Into rptApplicant_Registration_Information Select Top 1 @User_ID, * from Applicant_Registration_Information Where Serial_No=@Sr_No Order by Registration_Date Desc\
	Print @Sr_No
Insert Into rptApplicant_Registration_Information Select Top 1 @User_ID, * from Applicant_Registration_Information Where Serial_No=@Sr_No  And  Registration_Date>@Registration_Date
--Insert Into rptApplicant_Registration_Information Select Top 1 @User_ID, * from Applicant_Registration_Information Where Serial_No=@Sr_No And  Expiry_Date>=@Expiry_Date
 Order by Expiry_Date Desc

	    	FETCH NEXT FROM  Applicant_Detail_Cursor into @Sr_No
	END

CLOSE Applicant_Detail_Cursor

DEALLOCATE  Applicant_Detail_Cursor
--GO
GO
/****** Object:  StoredProcedure [dbo].[Get_Applicant_Registration_Due]    Script Date: 03/22/2016 17:12:34 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Get_Applicant_Registration_Due] @User_ID as varchar(10),@Expiry_Date As Varchar(15)   As

DECLARE @Sr_No as varchar(10)

Delete from rptApplicant_Registration_Information Where User_ID= @User_ID
---Delete from Applicant_Receipt_Serial_No Where User_ID= @User_ID

DECLARE Applicant_Detail_Cursor CURSOR FOR
---Select Serial_No From rptApplicant_Registration_Information  Where User_ID=9
Select Serial_No From Applicant_Personal_Information 


OPEN  Applicant_Detail_Cursor

FETCH FROM  Applicant_Detail_Cursor into @Sr_No

WHILE @@FETCH_STATUS = 0
	BEGIN
---		Insert Into rptApplicant_Registration_Information Select Top 1 @User_ID, * from Applicant_Registration_Information Where Serial_No=@Sr_No Order by Registration_Date Desc\
	Print @Sr_No
Insert Into rptApplicant_Registration_Information Select Top 1 @User_ID, * from Applicant_Registration_Information Where Serial_No=@Sr_No And  Expiry_Date>=@Expiry_Date
 Order by Expiry_Date Desc

	    	FETCH NEXT FROM  Applicant_Detail_Cursor into @Sr_No
	END

CLOSE Applicant_Detail_Cursor

DEALLOCATE  Applicant_Detail_Cursor
--GO
GO
/****** Object:  StoredProcedure [dbo].[Get_Applicant_Registration_Card_Information]    Script Date: 03/22/2016 17:12:34 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_Applicant_Registration_Card_Information] @User_ID as varchar(10)   As

DECLARE @Sr_No as varchar(10)

Delete from rptApplicant_Registration_Information 
---Delete from Applicant_Receipt_Serial_No Where User_ID= @User_ID

DECLARE Applicant_Detail_Cursor CURSOR FOR
Select Serial_No From Applicant_Receipt_Serial_No Where User_ID=@User_ID


OPEN  Applicant_Detail_Cursor

FETCH FROM  Applicant_Detail_Cursor into @Sr_No

WHILE @@FETCH_STATUS = 0
	BEGIN
---		Insert Into rptApplicant_Registration_Information Select Top 1 @User_ID, * from Applicant_Registration_Information Where Serial_No=@Sr_No Order by Registration_Date Desc\
	Print @Sr_No
Insert Into rptApplicant_Registration_Information Select Top 1 @User_ID, * from Applicant_Registration_Information Where Serial_No=@Sr_No Order by Registration_Date Desc

	    	FETCH NEXT FROM  Applicant_Detail_Cursor into @Sr_No
	END

CLOSE Applicant_Detail_Cursor

DEALLOCATE  Applicant_Detail_Cursor
--GO
GO
/****** Object:  StoredProcedure [dbo].[Get_Applicant_Receipt_Detail]    Script Date: 03/22/2016 17:12:34 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Get_Applicant_Receipt_Detail] @User_ID as varchar(10) ,@Serial_No As Varchar(10)  As

DECLARE @Sr_No as varchar(10)

Delete from rptApplicant_Registration_Information Where User_ID= @User_ID

DECLARE Applicant_Detail_Cursor CURSOR FOR
Select Serial_No From Applicant_Receipt_Serial_No Where User_ID=@User_ID And Serial_No=@Serial_No
---SELECT  Serial_No FROM PNCRMS.dbo.Applicant_Registration_Information  Where Registration_Record_No Is Not Null And  Registration_Record_No In (Select Registration_Record_No From Fee_Transaction_Detail Where Registration_Record_No Is Not Null )
--Insert Into rptApplicant_Registration_Information Select Top 1 @User_ID, * from Applicant_Registration_Information
-- Where Serial_No In  (Select Serial_No From Applicant_Receipt_Serial_No Where User_ID=@User_ID)
-- And  Registration_Record_No Is Not Null And Registration_Record_No In (Select Registration_Record_No From Fee_Transaction_Information Where Registration_Record_No In (Select Registration_Record_No From Fee_Transaction_Detail)) Order by Expiry_Date Desc


OPEN  Applicant_Detail_Cursor

FETCH FROM  Applicant_Detail_Cursor into @Sr_No

WHILE @@FETCH_STATUS = 0
	BEGIN
---		Insert Into rptApplicant_Registration_Information Select Top 1 @User_ID, * from Applicant_Registration_Information Where Serial_No=@Sr_No Order by Registration_Date Desc\
	Print @Sr_No
Insert Into rptApplicant_Registration_Information Select Top 1 @User_ID, * from Applicant_Registration_Information Where Serial_No=@Sr_No 
And  Registration_Record_No Is Not Null And Registration_Record_No In (Select Registration_Record_No From Fee_Transaction_Information Where Registration_Record_No In (Select Registration_Record_No From Fee_Transaction_Detail)) Order by Registration_Date Desc

	    	FETCH NEXT FROM  Applicant_Detail_Cursor into @Sr_No
	END

CLOSE Applicant_Detail_Cursor

DEALLOCATE  Applicant_Detail_Cursor
--GO
GO
/****** Object:  StoredProcedure [dbo].[Get_Applicant_Detail]    Script Date: 03/22/2016 17:12:34 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Get_Applicant_Detail] @User_ID as varchar(10)   As

DECLARE @Sr_No  as varchar(10)


--Delete the Old Records
Delete from rptApplicant_Registration_Information Where User_ID= @User_ID
--Open the Record Set
DECLARE Applicant_Detail_Cursor CURSOR FOR
Select Serial_No  From Applicant_Receipt_Serial_No Where User_ID=@User_ID 


OPEN  Applicant_Detail_Cursor

FETCH FROM  Applicant_Detail_Cursor into @Sr_No

WHILE @@FETCH_STATUS = 0
	BEGIN
		Insert Into rptApplicant_Registration_Information Select Top 1 @User_ID, * from Applicant_Registration_Information Where Serial_No=@Sr_No 
		And  Registration_Record_No Is Not Null And Registration_Record_No In (Select Registration_Record_No From Fee_Transaction_Information Where Registration_Record_No In (Select Registration_Record_No From Fee_Transaction_Detail)) Order by Registration_Date Desc
--New Code Added
--Set @Record_No=@Record_No + 1

--End of the new code
	    	FETCH NEXT FROM  Applicant_Detail_Cursor into @Sr_No
	END

CLOSE Applicant_Detail_Cursor

DEALLOCATE  Applicant_Detail_Cursor
--GO
GO
/****** Object:  Default [DF_Bank_Draft_Information_Balance_Amount]    Script Date: 03/22/2016 17:12:33 ******/
ALTER TABLE [dbo].[Bank_Draft_Information] ADD  CONSTRAINT [DF_Bank_Draft_Information_Balance_Amount]  DEFAULT (0) FOR [Balance_Amount]
GO
/****** Object:  Default [DF_Applicant_Registration_Information_Receipt_Status]    Script Date: 03/22/2016 17:12:33 ******/
ALTER TABLE [dbo].[Applicant_Registration_Information] ADD  CONSTRAINT [DF_Applicant_Registration_Information_Receipt_Status]  DEFAULT ('N') FOR [Receipt_Status]
GO
/****** Object:  Default [DF_rpt_Registration_Statistics_Receipt_Status]    Script Date: 03/22/2016 17:12:33 ******/
ALTER TABLE [dbo].[rpt_Registration_Statistics] ADD  CONSTRAINT [DF_rpt_Registration_Statistics_Receipt_Status]  DEFAULT ('N') FOR [Receipt_Status]
GO
/****** Object:  Default [DF_Verification_Transaction_Information_Receipt_Status]    Script Date: 03/22/2016 17:12:33 ******/
ALTER TABLE [dbo].[Verification_Transaction_Information] ADD  CONSTRAINT [DF_Verification_Transaction_Information_Receipt_Status]  DEFAULT ('N') FOR [Receipt_Status]
GO
/****** Object:  Default [DF_User_Info_Administrator]    Script Date: 03/22/2016 17:12:33 ******/
ALTER TABLE [dbo].[User_Info] ADD  CONSTRAINT [DF_User_Info_Administrator]  DEFAULT ('N') FOR [Administrator]
GO
/****** Object:  Default [DF_User_Info_Is_Logged_In]    Script Date: 03/22/2016 17:12:33 ******/
ALTER TABLE [dbo].[User_Info] ADD  CONSTRAINT [DF_User_Info_Is_Logged_In]  DEFAULT ('N') FOR [Is_Logged_In]
GO
