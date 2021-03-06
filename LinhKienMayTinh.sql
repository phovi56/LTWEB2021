USE [master]
GO
/****** Object:  Database [LinhKienMayTinh]    Script Date: 11/1/2021 9:06:27 PM ******/
CREATE DATABASE [LinhKienMayTinh]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LinhKienMayTinh', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\LinhKienMayTinh.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LinhKienMayTinh_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\LinhKienMayTinh_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LinhKienMayTinh] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LinhKienMayTinh].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LinhKienMayTinh] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LinhKienMayTinh] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LinhKienMayTinh] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LinhKienMayTinh] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LinhKienMayTinh] SET ARITHABORT OFF 
GO
ALTER DATABASE [LinhKienMayTinh] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LinhKienMayTinh] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LinhKienMayTinh] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LinhKienMayTinh] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LinhKienMayTinh] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LinhKienMayTinh] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LinhKienMayTinh] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LinhKienMayTinh] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LinhKienMayTinh] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LinhKienMayTinh] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LinhKienMayTinh] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LinhKienMayTinh] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LinhKienMayTinh] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LinhKienMayTinh] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LinhKienMayTinh] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LinhKienMayTinh] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LinhKienMayTinh] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LinhKienMayTinh] SET RECOVERY FULL 
GO
ALTER DATABASE [LinhKienMayTinh] SET  MULTI_USER 
GO
ALTER DATABASE [LinhKienMayTinh] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LinhKienMayTinh] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LinhKienMayTinh] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LinhKienMayTinh] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [LinhKienMayTinh] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'LinhKienMayTinh', N'ON'
GO
USE [LinhKienMayTinh]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 11/1/2021 9:06:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[Id_User] [int] NOT NULL,
	[Id_Product] [int] NOT NULL,
	[Ten] [nvarchar](255) NULL,
	[GiaTien] [float] NULL,
	[HinhAnh] [nvarchar](255) NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[Id_User] ASC,
	[Id_Product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Catalog]    Script Date: 11/1/2021 9:06:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalog](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Id_Parent] [int] NULL,
 CONSTRAINT [PK_Catalog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/1/2021 9:06:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id_Trans] [bigint] NOT NULL,
	[Id_Product] [int] NOT NULL,
	[SoLuong] [int] NOT NULL CONSTRAINT [DF_Order_SoLuong]  DEFAULT ((0)),
	[TongTien] [int] NOT NULL,
	[ThoiGian] [nvarchar](255) NOT NULL,
	[TrangThai] [text] NOT NULL,
	[HinhAnh] [nvarchar](255) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id_Trans] ASC,
	[Id_Product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/1/2021 9:06:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] NOT NULL,
	[Id_Catalog] [int] NULL CONSTRAINT [DF_Product_Id_Catalog]  DEFAULT ((0)),
	[Ten] [nvarchar](255) NOT NULL,
	[GiaTien] [int] NULL CONSTRAINT [DF_Product_GiaTien]  DEFAULT ((0)),
	[SoLuong] [int] NOT NULL,
	[NoiDung] [nvarchar](max) NULL,
	[GiamGia] [int] NULL CONSTRAINT [DF_Product_GiamGia]  DEFAULT ((0)),
	[HinhAnh] [varchar](255) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 11/1/2021 9:06:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[Id_Trans] [bigint] NOT NULL,
	[TrangThai] [tinyint] NOT NULL,
	[Id_User] [int] NOT NULL,
	[Ten_User] [nvarchar](50) NOT NULL,
	[Email_User] [nvarchar](50) NOT NULL,
	[SoDT_User] [nvarchar](15) NOT NULL,
	[TongTien] [decimal](15, 4) NOT NULL,
	[ThanhToan] [nvarchar](50) NOT NULL,
	[TinNhan] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[Id_Trans] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 11/1/2021 9:06:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] NOT NULL,
	[Ten] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[SoDT] [nvarchar](15) NOT NULL,
	[DiaChi] [nvarchar](255) NULL CONSTRAINT [DF_User_DiaChi]  DEFAULT (NULL),
	[Username] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[VaiTro] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Cart] ([Id_User], [Id_Product], [Ten], [GiaTien], [HinhAnh]) VALUES (24, 2, N'CPU Intel Pentium G5400', 1469400, N'templates/web/images/collection-trending-cpu-items/g5400.jpg')
INSERT [dbo].[Cart] ([Id_User], [Id_Product], [Ten], [GiaTien], [HinhAnh]) VALUES (24, 3, N'CPU Intel I3-9100f 9th GEN', 3044820, N'templates/web/images/collection-trending-cpu-items/i3-9100f.jpg')
INSERT [dbo].[Cart] ([Id_User], [Id_Product], [Ten], [GiaTien], [HinhAnh]) VALUES (24, 4, N'CPU Intel I5-10400 9th GEN', 2551910, N'templates/web/images/collection-trending-cpu-items/i5-10400.jpg')
INSERT [dbo].[Cart] ([Id_User], [Id_Product], [Ten], [GiaTien], [HinhAnh]) VALUES (24, 16, N'Card màn hình Galax RTX 2080ti', 2791150, N'templates/web/images/collection-trending-Vga-items/galax-rtx-2080ti.jpg')
INSERT [dbo].[Cart] ([Id_User], [Id_Product], [Ten], [GiaTien], [HinhAnh]) VALUES (25, 11, N'Mainboard Gigabyte A320M S2', 3646580, N'templates/web/images/collection-treding-mainboard-items/gigabyte_a320m_s2h-a.jpg')
INSERT [dbo].[Catalog] ([Id], [Name], [Id_Parent]) VALUES (0, N'CPU - Bộ vi xử lí', 0)
INSERT [dbo].[Catalog] ([Id], [Name], [Id_Parent]) VALUES (1, N'Main Board - Bo mạch chủ', 0)
INSERT [dbo].[Catalog] ([Id], [Name], [Id_Parent]) VALUES (2, N'VGA - Card màn hình', 0)
INSERT [dbo].[Catalog] ([Id], [Name], [Id_Parent]) VALUES (3, N'Bộ nhớ RAM', 0)
INSERT [dbo].[Catalog] ([Id], [Name], [Id_Parent]) VALUES (4, N'Ổ cứng', 0)
INSERT [dbo].[Catalog] ([Id], [Name], [Id_Parent]) VALUES (5, N'Tai Nghe', 0)
INSERT [dbo].[Catalog] ([Id], [Name], [Id_Parent]) VALUES (6, N'Bàn Phím', 0)
INSERT [dbo].[Catalog] ([Id], [Name], [Id_Parent]) VALUES (7, N'Chuột', 0)
INSERT [dbo].[Catalog] ([Id], [Name], [Id_Parent]) VALUES (60, N'PSU - Nguồn máy tính', 0)
INSERT [dbo].[Catalog] ([Id], [Name], [Id_Parent]) VALUES (101, N'Case - Vỏ máy tính', 0)
INSERT [dbo].[Order] ([Id_Trans], [Id_Product], [SoLuong], [TongTien], [ThoiGian], [TrangThai], [HinhAnh]) VALUES (1, 2, 2, 1469396, N'20/11/2020', N'none', N'templates/web/images/collection-trending-cpu-items/g5400.jpg')
INSERT [dbo].[Order] ([Id_Trans], [Id_Product], [SoLuong], [TongTien], [ThoiGian], [TrangThai], [HinhAnh]) VALUES (1, 5, 2, 4970784, N'20/11/2020', N'none', N'templates/web/images/collection-trending-cpu-items/g5400.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (1, 0, N'CPU Intel I8-8400 8th GEN', 1282988, 29, N'sửa nè', 0, N'templates/web/images/collection-trending-cpu-items/cpu-i5-8400.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (2, 0, N'CPU Intel Pentium G5400', 1469396, 329, N'sửa luôn nè', 0, N'templates/web/images/collection-trending-cpu-items/g5400.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (3, 0, N'CPU Intel I3-9100f 9th GEN', 3044821, 391, N'khong co gi', 0, N'templates/web/images/collection-trending-cpu-items/i3-9100f.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (4, 0, N'CPU Intel I5-10400 9th GEN', 2551909, 486, N'khong co gi', 0, N'templates/web/images/collection-trending-cpu-items/i5-10400.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (5, 0, N'CPU AMD Ryzen 3', 4970784, 459, N'khong co gi', 0, N'templates/web/images/collection-trending-cpu-items/ryzen3_3.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (6, 0, N'CPU AMD Ryzen 5 ', 2866407, 490, N'khong co gi', 0, N'templates/web/images/collection-trending-cpu-items/ryzen5.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (7, 0, N'CPU Intel I5-8400 8th GEN', 3588935, 440, N'khong co gi', 0, N'templates/web/images/collection-trending-cpu-items/cpu-i5-8400.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (9, 1, N'MainBoard Asus ROG Strix B460G', 2612313, 167, N'khong co gi', 0, N'templates/web/images/collection-treding-mainboard-items/asus_rog_strix_b460g_gaming-a.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (10, 1, N'Mainboard Asus ROG Strix X570 Gaming', 1300268, 478, N'khong co gi', 0, N'templates/web/images/collection-treding-mainboard-items/asus_rog_strix_x570_f_gaming-a.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (11, 1, N'Mainboard Gigabyte A320M S2', 3646582, 3, N'khong co gi', 0, N'templates/web/images/collection-treding-mainboard-items/gigabyte_a320m_s2h-a.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (12, 1, N'Mainboard Gigabyte B365M Gaming', 4394264, 292, N'khong co gi', 0, N'templates/web/images/collection-treding-mainboard-items/gigabyte_b365m_gaming_hd-a.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (13, 1, N'Mainboard Gigabyte H410M', 2131898, 456, N'khong co gi', 0, N'templates/web/images/collection-treding-mainboard-items/gigabyte_h410m-a.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (14, 1, N'Mainboard Gigabyte X570 X', 696101, 441, N'khong co gi', 0, N'templates/web/images/collection-treding-mainboard-items/gigabyte_x570_gaming_x-a.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (15, 1, N'Mainboard Gigabyte Z400 GamingX', 341286, 458, N'khong co gi', 0, N'templates/web/images/collection-treding-mainboard-items/gigabyte_z490_GamingX-a.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (16, 2, N'Card màn hình Galax RTX 2080ti', 2791146, 327, N'khong co gi', 0, N'templates/web/images/collection-trending-Vga-items/galax-rtx-2080ti.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (17, 2, N'Card màn hình Geforce RTX 2080ti', 3731604, 292, N'khong co gi', 0, N'templates/web/images/collection-trending-Vga-items/geforce_rtx_2080ti.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (18, 2, N'Card màn hình Gigatbyte RX570', 1626684, 264, N'khong co gi', 0, N'templates/web/images/collection-trending-Vga-items/gigabyte-rx570.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (19, 2, N'Card màn hình Leadtek Quadro', 1905442, 442, N'khong co gi', 0, N'templates/web/images/collection-trending-Vga-items/leadtek_quadro.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (20, 2, N'Card màn hình MSI GTX 1660Ti', 1460642, 265, N'khong co gi', 0, N'templates/web/images/collection-trending-Vga-items/msi_gtx1650.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (22, 3, N'Ram Corsair Vengeance LPX 16GB', 3468524, 439, N'khong co gi', 0, N'templates/web/images/collection-trending-ram-items/corsair_vengeance_lpx_16gb.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (23, 3, N'Ram G Skill 4GB', 2311591, 41, N'khong co gi', 0, N'templates/web/images/collection-trending-ram-items/g.skill_4gb.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (24, 3, N'Ram G Skill Aegis 8GB', 2957593, 364, N'khong co gi', 0, N'templates/web/images/collection-trending-ram-items/g.skill_aegis_8gb.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (25, 3, N'Ram G Skill Ripjaws V 8GB', 4827274, 446, N'khong co gi', 0, N'templates/web/images/collection-trending-ram-items/g.skill_ripjaws_v_8gb.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (26, 3, N'Ram Kington Hyper Fury 16GB', 3331214, 385, N'khong co gi', 0, N'templates/web/images/collection-trending-ram-items/kingston_hyperx_fury_rgb_16gb.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (28, 4, N'SSD Gigabyte 128GB M2', 4871597, 388, N'khong co gi', 0, N'templates/web/images/collectiion-trending-ssd-items/gigabyte_128g_m.2.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (29, 4, N'SSD Gigabyte 480GB M2', 4486758, 328, N'khong co gi', 0, N'templates/web/images/collectiion-trending-ssd-items/gigabyte_480gb_sata.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (30, 4, N'SSD Kingston 256GB Sata', 2868521, 476, N'khong co gi', 0, N'templates/web/images/collectiion-trending-ssd-items/kingston_256gb_sata.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (31, 4, N'SSD Samsung 970 1TB', 3731949, 180, N'khong co gi', 0, N'templates/web/images/collectiion-trending-ssd-items/samsung970_1TB.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (32, 4, N'SSD Seagate Barracuda120 500GB', 490754, 269, N'khong co gi', 0, N'templates/web/images/collectiion-trending-ssd-items/seagate_barracuda120_500gb.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (33, 4, N'SSD Samsung M2 Sata', 2257815, 156, N'khong co gi', 0, N'templates/web/images/collectiion-trending-ssd-items/ssd_samsung_m.2_sata.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (34, 4, N'SSD WB Blue 250GB', 4832284, 111, N'khong co gi', 0, N'templates/web/images/collectiion-trending-ssd-items/wd_blue_250gb.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (35, 4, N'SSD WB Green 240GB', 3141447, 112, N'khong co gi', 0, N'templates/web/images/collectiion-trending-ssd-items/wd_green_240gb.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (36, 5, N'Tai nghe Asus ROG DELTA ', 2402939, 269, N'khong co gi', 0, N'templates/web/images/collection-trending-gear-items/Asus ROG DELTA.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (37, 6, N'Bàn Phím Cơ E-DRA EK387 Dream Pink ', 2862988, 412, N'khong co gi', 0, N'templates/web/images/collection-trending-gear-items/Bàn Phím Co E-DRA EK387 Dream Pink.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (38, 7, N'Chuột Asus ROG Chakram ', 3209802, 205, N'khong co gi', 0, N'templates/web/images/collection-trending-gear-items-page2/unnamed (34).webp')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (39, 6, N'Bàn phím Newmen T260 ', 1017344, 338, N'khong co gi', 0, N'templates/web/images/collection-trending-gear-items/Bàn phím Newmen T260.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (40, 7, N'Chuột Corsair DarkCore RGB Pro SE Wireless', 4867705, 365, N'khong co gi', 0, N'templates/web/images/collection-trending-gear-items/Chu?t Corsair DarkCore RGB Pro SE Wireless.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (41, 5, N'Tai nghe SteelSeries Arctis Pro Wireless', 4908656, 57, N'khong co gi', 0, N'templates/web/images/collection-trending-gear-items/Tai nghe SteelSeries Arctis Pro Wireless.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (42, 7, N'Chuột Razer Basilisk Ultimate', 3045337, 488, N'khong co gi', 0, N'templates/web/images/collection-trending-gear-items/Chu?t Razer Basilisk Ultimate.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (43, 5, N'Tai nghe Asus ROG Cetra Core', 2005796, 226, N'khong co gi', 0, N'templates/web/images/collection-hot-items/Tai nghe Asus ROG Cetra Core.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (45, 4, N'SSD Samsung 970 1TB', 4936416, 285, N'khong co gi', 0, N'templates/web/images/collectiion-trending-ssd-items/samsung970_1TB.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (46, 5, N'Tai nghe RAZER HAMMERHEAD PRO V2', 2305472, 367, N'khong co gi', 0, N'templates/web/images/collection-hot-items/TAI NGHE RAZER HAMMERHEAD PRO V2.jpg')
INSERT [dbo].[Product] ([Id], [Id_Catalog], [Ten], [GiaTien], [SoLuong], [NoiDung], [GiamGia], [HinhAnh]) VALUES (48, 7, N'Chuột Akko Hamster Wireless', 1602886, 38, N'khong co gi', 0, N'templates/web/images/collection-hot-items/Chu?t Akko Hamster Wireless.jpg')
INSERT [dbo].[User] ([Id], [Ten], [Email], [SoDT], [DiaChi], [Username], [Password], [VaiTro]) VALUES (24, N'Tô Thảo Nhã', N'thiensubanphuc000@gmail.com', N'0398991023', NULL, N'nha', N'123', 0)
INSERT [dbo].[User] ([Id], [Ten], [Email], [SoDT], [DiaChi], [Username], [Password], [VaiTro]) VALUES (25, N'Ðoàn Quang Anh', N'anhdq.1999@gmail.com', N'000021122', NULL, N'anhquang', N'123', 1)
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF_Transaction_TrangThai]  DEFAULT ((0)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF_Transaction_Id_User]  DEFAULT ((0)) FOR [Id_User]
GO
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF_Transaction_TongTien]  DEFAULT ((0.0000)) FOR [TongTien]
GO
USE [master]
GO
ALTER DATABASE [LinhKienMayTinh] SET  READ_WRITE 
GO
