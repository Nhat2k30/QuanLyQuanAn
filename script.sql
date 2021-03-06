USE [QuanLyQuanNhau]
GO
/****** Object:  StoredProcedure [dbo].[USP_SwitchTable]    Script Date: 12/28/2020 11:41:47 AM ******/
DROP PROCEDURE [dbo].[USP_SwitchTable]
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBillInfo]    Script Date: 12/28/2020 11:41:47 AM ******/
DROP PROCEDURE [dbo].[USP_InsertBillInfo]
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBill]    Script Date: 12/28/2020 11:41:47 AM ******/
DROP PROCEDURE [dbo].[USP_InsertBill]
GO
/****** Object:  StoredProcedure [dbo].[USP_GetTableList]    Script Date: 12/28/2020 11:41:47 AM ******/
DROP PROCEDURE [dbo].[USP_GetTableList]
GO
/****** Object:  StoredProcedure [dbo].[USP_GetListBillAndPage]    Script Date: 12/28/2020 11:41:47 AM ******/
DROP PROCEDURE [dbo].[USP_GetListBillAndPage]
GO
/****** Object:  StoredProcedure [dbo].[USP_GetListBill]    Script Date: 12/28/2020 11:41:47 AM ******/
DROP PROCEDURE [dbo].[USP_GetListBill]
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAccountByUserName]    Script Date: 12/28/2020 11:41:47 AM ******/
DROP PROCEDURE [dbo].[USP_GetAccountByUserName]
GO
ALTER TABLE [dbo].[Food] DROP CONSTRAINT [FK__Food__price__31EC6D26]
GO
ALTER TABLE [dbo].[BillInfo] DROP CONSTRAINT [FK__BillInfo__idFood__3B75D760]
GO
ALTER TABLE [dbo].[BillInfo] DROP CONSTRAINT [FK__BillInfo__count__3A81B327]
GO
ALTER TABLE [dbo].[Bill] DROP CONSTRAINT [FK__Bill__status__36B12243]
GO
ALTER TABLE [dbo].[TableFood] DROP CONSTRAINT [DF__TableFood__statu__25869641]
GO
ALTER TABLE [dbo].[TableFood] DROP CONSTRAINT [DF__TableFood__name__24927208]
GO
ALTER TABLE [dbo].[FoodCategory] DROP CONSTRAINT [DF__FoodCatego__name__2D27B809]
GO
ALTER TABLE [dbo].[Food] DROP CONSTRAINT [DF__Food__price__30F848ED]
GO
ALTER TABLE [dbo].[Food] DROP CONSTRAINT [DF__Food__name__300424B4]
GO
ALTER TABLE [dbo].[BillInfo] DROP CONSTRAINT [DF__BillInfo__count__398D8EEE]
GO
ALTER TABLE [dbo].[Bill] DROP CONSTRAINT [DF__Bill__status__35BCFE0A]
GO
ALTER TABLE [dbo].[Bill] DROP CONSTRAINT [DF__Bill__DateCheckI__34C8D9D1]
GO
ALTER TABLE [dbo].[Account] DROP CONSTRAINT [DF__Account__type__2A4B4B5E]
GO
ALTER TABLE [dbo].[Account] DROP CONSTRAINT [DF__Account__passwor__29572725]
GO
ALTER TABLE [dbo].[Account] DROP CONSTRAINT [DF__Account__display__286302EC]
GO
/****** Object:  Table [dbo].[TableFood]    Script Date: 12/28/2020 11:41:47 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TableFood]') AND type in (N'U'))
DROP TABLE [dbo].[TableFood]
GO
/****** Object:  Table [dbo].[FoodCategory]    Script Date: 12/28/2020 11:41:47 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FoodCategory]') AND type in (N'U'))
DROP TABLE [dbo].[FoodCategory]
GO
/****** Object:  Table [dbo].[Food]    Script Date: 12/28/2020 11:41:47 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Food]') AND type in (N'U'))
DROP TABLE [dbo].[Food]
GO
/****** Object:  Table [dbo].[BillInfo]    Script Date: 12/28/2020 11:41:47 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BillInfo]') AND type in (N'U'))
DROP TABLE [dbo].[BillInfo]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 12/28/2020 11:41:47 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bill]') AND type in (N'U'))
DROP TABLE [dbo].[Bill]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/28/2020 11:41:47 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Account]') AND type in (N'U'))
DROP TABLE [dbo].[Account]
GO
USE [master]
GO
/****** Object:  Database [QuanLyQuanNhau]    Script Date: 12/28/2020 11:41:47 AM ******/
DROP DATABASE [QuanLyQuanNhau]
GO
/****** Object:  Database [QuanLyQuanNhau]    Script Date: 12/28/2020 11:41:47 AM ******/
CREATE DATABASE [QuanLyQuanNhau]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyQuanNhau', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QuanLyQuanNhau.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyQuanNhau_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QuanLyQuanNhau_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QuanLyQuanNhau] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyQuanNhau].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyQuanNhau] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyQuanNhau] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyQuanNhau] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyQuanNhau] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyQuanNhau] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyQuanNhau] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QuanLyQuanNhau] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyQuanNhau] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyQuanNhau] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyQuanNhau] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyQuanNhau] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyQuanNhau] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyQuanNhau] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyQuanNhau] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyQuanNhau] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLyQuanNhau] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyQuanNhau] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyQuanNhau] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyQuanNhau] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyQuanNhau] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyQuanNhau] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyQuanNhau] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyQuanNhau] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyQuanNhau] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyQuanNhau] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyQuanNhau] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyQuanNhau] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyQuanNhau] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyQuanNhau] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLyQuanNhau] SET QUERY_STORE = OFF
GO
USE [QuanLyQuanNhau]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/28/2020 11:41:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [nvarchar](100) NOT NULL,
	[displayname] [nvarchar](100) NOT NULL,
	[password] [nvarchar](1000) NOT NULL,
	[type] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 12/28/2020 11:41:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DateCheckIn] [date] NOT NULL,
	[DateCheckOut] [date] NULL,
	[idTable] [int] NOT NULL,
	[status] [int] NOT NULL,
	[totalprice] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillInfo]    Script Date: 12/28/2020 11:41:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idBill] [int] NOT NULL,
	[idFood] [int] NOT NULL,
	[count] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Food]    Script Date: 12/28/2020 11:41:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[idCategory] [int] NOT NULL,
	[price] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodCategory]    Script Date: 12/28/2020 11:41:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TableFood]    Script Date: 12/28/2020 11:41:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableFood](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[status] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([username], [displayname], [password], [type]) VALUES (N'H', N'Boss', N'1', 1)
INSERT [dbo].[Account] ([username], [displayname], [password], [type]) VALUES (N'staff', N'staff', N'1', 0)
GO
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [totalprice]) VALUES (42, CAST(N'2020-12-15' AS Date), CAST(N'2020-12-15' AS Date), 1, 1, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [totalprice]) VALUES (43, CAST(N'2020-12-20' AS Date), CAST(N'2020-12-20' AS Date), 1, 1, 50)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [totalprice]) VALUES (44, CAST(N'2020-12-20' AS Date), CAST(N'2020-12-20' AS Date), 1, 1, 10)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [totalprice]) VALUES (45, CAST(N'2020-12-21' AS Date), CAST(N'2020-12-21' AS Date), 1, 1, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [totalprice]) VALUES (46, CAST(N'2020-12-22' AS Date), CAST(N'2020-12-22' AS Date), 1, 1, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [totalprice]) VALUES (47, CAST(N'2020-12-28' AS Date), CAST(N'2020-12-28' AS Date), 2, 1, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [totalprice]) VALUES (48, CAST(N'2020-12-28' AS Date), CAST(N'2020-12-28' AS Date), 1, 1, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [totalprice]) VALUES (49, CAST(N'2020-12-28' AS Date), CAST(N'2020-12-28' AS Date), 2, 1, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [totalprice]) VALUES (50, CAST(N'2020-12-28' AS Date), CAST(N'2020-12-28' AS Date), 1, 1, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [totalprice]) VALUES (51, CAST(N'2020-12-28' AS Date), CAST(N'2020-12-28' AS Date), 2, 1, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [totalprice]) VALUES (52, CAST(N'2020-12-28' AS Date), CAST(N'2020-12-28' AS Date), 1, 1, 0)
SET IDENTITY_INSERT [dbo].[Bill] OFF
GO
SET IDENTITY_INSERT [dbo].[BillInfo] ON 

INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (58, 42, 1, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (59, 43, 1, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (60, 44, 1, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (61, 44, 14, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (62, 45, 1, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (63, 46, 1, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (64, 47, 1, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (65, 48, 1, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (66, 49, 1, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (67, 50, 1, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (68, 51, 1, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (69, 51, 1, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (70, 52, 1, 1)
SET IDENTITY_INSERT [dbo].[BillInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[Food] ON 

INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (1, N'Bạch tuộc xào cay', 1, 100000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (2, N'Cua rang me', 1, 110000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (3, N'Ngêu nướng mỡ hành', 1, 90000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (4, N'Mực sốt tỏi ớt', 1, 100000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (5, N'Mực hấp hành gừng', 1, 120000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (6, N'Lẩu thái hải sản', 1, 400000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (7, N'Súp cua', 1, 50000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (8, N'Tôm hấp thái', 1, 80000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (9, N'Sò huyết xào tỏi', 1, 150000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (10, N'Tôm nướng muối ớt', 1, 50000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (11, N'Ốc hương hấp gừng sả ớt', 1, 200000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (12, N'Tôm hùm Bình Ba', 1, 250000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (13, N'Ghẹ hấp bia', 1, 140000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (14, N'Mực nhảy', 1, 240000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (15, N'Cá ngừ đại dương', 1, 300000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (16, N'Bào ngư sốt dầu hào', 1, 100000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (17, N'Mực một nắng', 1, 170000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (18, N'Sò lông nướng mỡ hành', 1, 130000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (20, N'Bia 333', 2, 10000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (21, N'Bia Tiger', 2, 15000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (22, N'Bia Heineken', 2, 20000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (23, N'Coca Cola', 2, 15000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (24, N'Pepsi', 2, 15000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (25, N'7UP', 2, 10000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (26, N'Xá xị', 2, 10000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (27, N'Nước suối Aquafina', 2, 8000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (28, N'Trà đá', 2, 5000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (31, N'aaa', 1, 150000)
SET IDENTITY_INSERT [dbo].[Food] OFF
GO
SET IDENTITY_INSERT [dbo].[FoodCategory] ON 

INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (1, N'Hải sản')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (2, N'Nước')
SET IDENTITY_INSERT [dbo].[FoodCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[TableFood] ON 

INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (1, N'Bàn 0', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (2, N'Bàn 1', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (3, N'Bàn 2', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (4, N'Bàn 3', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (5, N'Bàn 4', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (6, N'Bàn 5', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (7, N'Bàn 6', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (8, N'Bàn 7', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (9, N'Bàn 8', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (10, N'Bàn 9', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (11, N'Bàn 10', N'Trống')
SET IDENTITY_INSERT [dbo].[TableFood] OFF
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT (N'ok') FOR [displayname]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((0)) FOR [password]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((0)) FOR [type]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT (getdate()) FOR [DateCheckIn]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[BillInfo] ADD  DEFAULT ((0)) FOR [count]
GO
ALTER TABLE [dbo].[Food] ADD  DEFAULT (N'Chưa đặt tên') FOR [name]
GO
ALTER TABLE [dbo].[Food] ADD  DEFAULT ((0)) FOR [price]
GO
ALTER TABLE [dbo].[FoodCategory] ADD  DEFAULT (N'Chưa đặt tên') FOR [name]
GO
ALTER TABLE [dbo].[TableFood] ADD  DEFAULT (N'Chưa đặt tên') FOR [name]
GO
ALTER TABLE [dbo].[TableFood] ADD  DEFAULT (N'Trống') FOR [status]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([idTable])
REFERENCES [dbo].[TableFood] ([id])
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD FOREIGN KEY([idBill])
REFERENCES [dbo].[Bill] ([id])
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD FOREIGN KEY([idFood])
REFERENCES [dbo].[Food] ([id])
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD FOREIGN KEY([idCategory])
REFERENCES [dbo].[FoodCategory] ([id])
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAccountByUserName]    Script Date: 12/28/2020 11:41:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GetAccountByUserName]
@username nvarchar(100)
as
begin
     select * from dbo.Account where username = @username
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetListBill]    Script Date: 12/28/2020 11:41:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GetListBill]
@checkin date, @checkout date
as
begin
	select TableFood.name, DateCheckIn, DateCheckOut 
	from Bill, TableFood 
	where DateCheckIn >= @checkin and DateCheckOut <= @checkout and Bill.status = 1 
	and TableFood.id = Bill.idTable
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetListBillAndPage]    Script Date: 12/28/2020 11:41:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GetListBillAndPage]
@checkin date, @checkout date, @page int
as
begin
	declare @pageRows int = 10
	declare @selectRows int = @pageRows * @page
	declare @exceptRows int = (@page - 1) * @pageRows

	;with BillShow as (select TableFood.name, DateCheckIn, DateCheckOut 
	from Bill, TableFood 
	where DateCheckIn >= @checkin and DateCheckOut <= @checkout and Bill.status = 1 
	and TableFood.id = Bill.idTable)

	select top (@selectRows) * from BillShow
	except
	select top (@exceptRows) * from BillShow
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetTableList]    Script Date: 12/28/2020 11:41:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GetTableList]
as select * from dbo.TableFood
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBill]    Script Date: 12/28/2020 11:41:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_InsertBill]
@idtable int
AS
BEGIN
    INSERT dbo.Bill
	VALUES ( GETDATE() ,
	         NULL ,
	         @idtable ,
	         0,
			 0
	        )
END
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBillInfo]    Script Date: 12/28/2020 11:41:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_InsertBillInfo]
@idbill int, @idfood int, @count int
as
begin
declare @existsBillinfo int
declare @foodcount int  = 1
select @existsBillinfo = id, @foodcount = count from BillInfo where id = @idbill and idFood = @idfood
if(@existsBillinfo > 0)
begin
declare @newcount int = @foodcount + @count
if(@newcount > 0)
update BillInfo set count = @foodcount + @count where idFood = @idfood
else delete BillInfo where idBill = @idbill and idFood = @idfood
end
else
begin

insert BillInfo
values
(
@idbill ,
@idfood ,
@count
)
end

end
GO
/****** Object:  StoredProcedure [dbo].[USP_SwitchTable]    Script Date: 12/28/2020 11:41:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_SwitchTable]
@id1 int, @id2 int
AS
BEGIN
	DECLARE @idBill1 int
	DECLARE @idBill2 int

	SELECT @idBill1 = id FROM dbo.Bill WHERE dbo.Bill.idTable = @id1 AND STATUS = 0
	SELECT @idBill2 = id FROM dbo.Bill WHERE dbo.Bill.idTable = @id2 AND STATUS = 0

	UPDATE dbo.Bill SET dbo.Bill.idTable = @id2 WHERE id = @idBill1
	UPDATE dbo.Bill SET dbo.Bill.idTable = @id1 WHERE id = @idBill2
END
GO
USE [master]
GO
ALTER DATABASE [QuanLyQuanNhau] SET  READ_WRITE 
GO
