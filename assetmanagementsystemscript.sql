USE [master]
GO
/****** Object:  Database [Asset Management System]    Script Date: 30-09-2024 17:41:24 ******/
CREATE DATABASE [Asset Management System]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Asset Management System', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Asset Management System.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Asset Management System_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Asset Management System_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Asset Management System] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Asset Management System].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Asset Management System] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Asset Management System] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Asset Management System] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Asset Management System] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Asset Management System] SET ARITHABORT OFF 
GO
ALTER DATABASE [Asset Management System] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Asset Management System] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Asset Management System] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Asset Management System] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Asset Management System] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Asset Management System] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Asset Management System] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Asset Management System] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Asset Management System] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Asset Management System] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Asset Management System] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Asset Management System] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Asset Management System] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Asset Management System] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Asset Management System] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Asset Management System] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Asset Management System] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Asset Management System] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Asset Management System] SET  MULTI_USER 
GO
ALTER DATABASE [Asset Management System] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Asset Management System] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Asset Management System] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Asset Management System] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Asset Management System] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Asset Management System] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Asset Management System] SET QUERY_STORE = ON
GO
ALTER DATABASE [Asset Management System] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Asset Management System]
GO
/****** Object:  Table [dbo].[AssetDefinition]    Script Date: 30-09-2024 17:41:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetDefinition](
	[ad_id] [int] IDENTITY(1,1) NOT NULL,
	[ad_name] [varchar](100) NOT NULL,
	[ad_class] [varchar](50) NULL,
	[ad_type_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ad_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetMaster]    Script Date: 30-09-2024 17:41:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetMaster](
	[am_id] [int] IDENTITY(1,1) NOT NULL,
	[am_atypeid] [int] NULL,
	[am_makeid] [int] NULL,
	[am_ad_id] [int] NULL,
	[am_model] [varchar](40) NULL,
	[am_snnumber] [varchar](20) NULL,
	[am_myyear] [varchar](10) NULL,
	[am_pdate] [date] NOT NULL,
	[am_warranty] [varchar](1) NULL,
	[am_from_date] [date] NULL,
	[am_to_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[am_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetType]    Script Date: 30-09-2024 17:41:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetType](
	[at_id] [int] IDENTITY(1,1) NOT NULL,
	[at_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[at_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[login]    Script Date: 30-09-2024 17:41:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login](
	[login_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[usertype] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[login_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseOrder]    Script Date: 30-09-2024 17:41:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrder](
	[pd_id] [int] IDENTITY(1,1) NOT NULL,
	[pd_order_no] [varchar](50) NOT NULL,
	[pd_ad_id] [int] NULL,
	[pd_type_id] [int] NULL,
	[pd_qty] [int] NOT NULL,
	[pd_vendor_id] [int] NULL,
	[pd_date] [date] NOT NULL,
	[pd_ddate] [date] NOT NULL,
	[pd_status] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[pd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_registration]    Script Date: 30-09-2024 17:41:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_registration](
	[u_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[age] [int] NULL,
	[gender] [varchar](10) NOT NULL,
	[address] [varchar](255) NULL,
	[phone_number] [varchar](15) NULL,
	[login_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[u_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 30-09-2024 17:41:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendor](
	[vd_id] [int] IDENTITY(1,1) NOT NULL,
	[vd_name] [varchar](100) NOT NULL,
	[vd_addr] [varchar](255) NULL,
	[vd_from_date] [date] NOT NULL,
	[vd_to_date] [date] NOT NULL,
	[vd_type] [varchar](50) NULL,
	[vd_atype_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[vd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AssetDefinition] ON 

INSERT [dbo].[AssetDefinition] ([ad_id], [ad_name], [ad_class], [ad_type_id]) VALUES (1, N'iPhone 13', N'Smartphone', 1)
INSERT [dbo].[AssetDefinition] ([ad_id], [ad_name], [ad_class], [ad_type_id]) VALUES (2, N'Epson TM-T88V', N'Printer', 2)
SET IDENTITY_INSERT [dbo].[AssetDefinition] OFF
GO
SET IDENTITY_INSERT [dbo].[AssetMaster] ON 

INSERT [dbo].[AssetMaster] ([am_id], [am_atypeid], [am_makeid], [am_ad_id], [am_model], [am_snnumber], [am_myyear], [am_pdate], [am_warranty], [am_from_date], [am_to_date]) VALUES (1, 1, 1, 1, N'Lava z61', N'SN123456', N'2023', CAST(N'2023-09-05' AS Date), N'Y', CAST(N'2024-09-05' AS Date), CAST(N'2025-09-05' AS Date))
INSERT [dbo].[AssetMaster] ([am_id], [am_atypeid], [am_makeid], [am_ad_id], [am_model], [am_snnumber], [am_myyear], [am_pdate], [am_warranty], [am_from_date], [am_to_date]) VALUES (2, 2, 2, 2, N'Redmi Pro p', N'FRN12D2', N'2022', CAST(N'2023-09-05' AS Date), N'Y', CAST(N'2023-09-05' AS Date), CAST(N'2024-09-05' AS Date))
INSERT [dbo].[AssetMaster] ([am_id], [am_atypeid], [am_makeid], [am_ad_id], [am_model], [am_snnumber], [am_myyear], [am_pdate], [am_warranty], [am_from_date], [am_to_date]) VALUES (3, 2, 2, 2, N'I phone 15 pr0', N'IP15N69', N'2023', CAST(N'2022-09-05' AS Date), N'Y', CAST(N'2024-09-05' AS Date), CAST(N'2026-09-05' AS Date))
SET IDENTITY_INSERT [dbo].[AssetMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[AssetType] ON 

INSERT [dbo].[AssetType] ([at_id], [at_name]) VALUES (1, N'Mobile')
INSERT [dbo].[AssetType] ([at_id], [at_name]) VALUES (2, N'Thermal Printer')
SET IDENTITY_INSERT [dbo].[AssetType] OFF
GO
SET IDENTITY_INSERT [dbo].[login] ON 

INSERT [dbo].[login] ([login_id], [username], [password], [usertype]) VALUES (1, N'admin_user', N'hashed_password123', N'Admin')
INSERT [dbo].[login] ([login_id], [username], [password], [usertype]) VALUES (2, N'purchase_manager_user', N'hashed_password456', N'Purchase Manager')
SET IDENTITY_INSERT [dbo].[login] OFF
GO
SET IDENTITY_INSERT [dbo].[PurchaseOrder] ON 

INSERT [dbo].[PurchaseOrder] ([pd_id], [pd_order_no], [pd_ad_id], [pd_type_id], [pd_qty], [pd_vendor_id], [pd_date], [pd_ddate], [pd_status]) VALUES (1, N'PO12345', 1, 1, 50, 1, CAST(N'2023-09-01' AS Date), CAST(N'2023-09-10' AS Date), N'Pending')
INSERT [dbo].[PurchaseOrder] ([pd_id], [pd_order_no], [pd_ad_id], [pd_type_id], [pd_qty], [pd_vendor_id], [pd_date], [pd_ddate], [pd_status]) VALUES (2, N'PO67890', 2, 2, 30, 2, CAST(N'2023-09-02' AS Date), CAST(N'2023-09-12' AS Date), N'Shipped')
SET IDENTITY_INSERT [dbo].[PurchaseOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[user_registration] ON 

INSERT [dbo].[user_registration] ([u_id], [first_name], [last_name], [age], [gender], [address], [phone_number], [login_id]) VALUES (1, N'John', N'Doe', 35, N'Male', N'123 Main St, Cityville', N'9876543210', 1)
INSERT [dbo].[user_registration] ([u_id], [first_name], [last_name], [age], [gender], [address], [phone_number], [login_id]) VALUES (2, N'Jane', N'Smith', 29, N'Female', N'456 Maple St, Townsville', N'8765432109', 2)
INSERT [dbo].[user_registration] ([u_id], [first_name], [last_name], [age], [gender], [address], [phone_number], [login_id]) VALUES (8, N'Ann', N'Maria', 22, N'FeMale', N'123 Main St, Cityville', N'6381762994', 1)
INSERT [dbo].[user_registration] ([u_id], [first_name], [last_name], [age], [gender], [address], [phone_number], [login_id]) VALUES (9, N'Rose', N'Maria', 22, N'FeMale', N'Alapuzha', N'7373081508', 2)
SET IDENTITY_INSERT [dbo].[user_registration] OFF
GO
SET IDENTITY_INSERT [dbo].[Vendor] ON 

INSERT [dbo].[Vendor] ([vd_id], [vd_name], [vd_addr], [vd_from_date], [vd_to_date], [vd_type], [vd_atype_id]) VALUES (1, N'Apple Inc.', N'1 Infinite Loop, Cupertino', CAST(N'2023-01-01' AS Date), CAST(N'2025-12-31' AS Date), N'Electronics', 1)
INSERT [dbo].[Vendor] ([vd_id], [vd_name], [vd_addr], [vd_from_date], [vd_to_date], [vd_type], [vd_atype_id]) VALUES (2, N'Epson America', N'3840 Kilroy Airport Way, Long Beach', CAST(N'2023-01-01' AS Date), CAST(N'2025-12-31' AS Date), N'Printer', 2)
SET IDENTITY_INSERT [dbo].[Vendor] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__login__F3DBC5723F7C7CBF]    Script Date: 30-09-2024 17:41:24 ******/
ALTER TABLE [dbo].[login] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AssetDefinition]  WITH CHECK ADD FOREIGN KEY([ad_type_id])
REFERENCES [dbo].[AssetType] ([at_id])
GO
ALTER TABLE [dbo].[AssetMaster]  WITH CHECK ADD FOREIGN KEY([am_ad_id])
REFERENCES [dbo].[AssetDefinition] ([ad_id])
GO
ALTER TABLE [dbo].[AssetMaster]  WITH CHECK ADD FOREIGN KEY([am_atypeid])
REFERENCES [dbo].[AssetType] ([at_id])
GO
ALTER TABLE [dbo].[AssetMaster]  WITH CHECK ADD FOREIGN KEY([am_makeid])
REFERENCES [dbo].[Vendor] ([vd_id])
GO
ALTER TABLE [dbo].[PurchaseOrder]  WITH CHECK ADD FOREIGN KEY([pd_ad_id])
REFERENCES [dbo].[AssetDefinition] ([ad_id])
GO
ALTER TABLE [dbo].[PurchaseOrder]  WITH CHECK ADD FOREIGN KEY([pd_type_id])
REFERENCES [dbo].[AssetType] ([at_id])
GO
ALTER TABLE [dbo].[PurchaseOrder]  WITH CHECK ADD FOREIGN KEY([pd_vendor_id])
REFERENCES [dbo].[Vendor] ([vd_id])
GO
ALTER TABLE [dbo].[user_registration]  WITH CHECK ADD FOREIGN KEY([login_id])
REFERENCES [dbo].[login] ([login_id])
GO
ALTER TABLE [dbo].[Vendor]  WITH CHECK ADD FOREIGN KEY([vd_atype_id])
REFERENCES [dbo].[AssetType] ([at_id])
GO
ALTER TABLE [dbo].[AssetType]  WITH CHECK ADD CHECK  (([at_name]='Thermal Printer' OR [at_name]='Mobile'))
GO
ALTER TABLE [dbo].[login]  WITH CHECK ADD CHECK  (([usertype]='Purchase Manager' OR [usertype]='Admin'))
GO
ALTER TABLE [dbo].[user_registration]  WITH CHECK ADD CHECK  (([age]>(0)))
GO
USE [master]
GO
ALTER DATABASE [Asset Management System] SET  READ_WRITE 
GO
