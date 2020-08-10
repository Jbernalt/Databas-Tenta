USE [master]
GO
/****** Object:  Database [ParkingJonathan]    Script Date: 2019-12-22 21:15:25 ******/
CREATE DATABASE [ParkingJonathan]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ParkingJonathan', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ParkingJonathan.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ParkingJonathan_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ParkingJonathan_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ParkingJonathan] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ParkingJonathan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ParkingJonathan] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ParkingJonathan] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ParkingJonathan] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ParkingJonathan] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ParkingJonathan] SET ARITHABORT OFF 
GO
ALTER DATABASE [ParkingJonathan] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ParkingJonathan] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ParkingJonathan] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ParkingJonathan] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ParkingJonathan] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ParkingJonathan] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ParkingJonathan] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ParkingJonathan] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ParkingJonathan] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ParkingJonathan] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ParkingJonathan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ParkingJonathan] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ParkingJonathan] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ParkingJonathan] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ParkingJonathan] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ParkingJonathan] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ParkingJonathan] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ParkingJonathan] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ParkingJonathan] SET  MULTI_USER 
GO
ALTER DATABASE [ParkingJonathan] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ParkingJonathan] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ParkingJonathan] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ParkingJonathan] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ParkingJonathan] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ParkingJonathan] SET QUERY_STORE = OFF
GO
USE [ParkingJonathan]
GO
/****** Object:  Table [dbo].[History]    Script Date: 2019-12-22 21:15:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[HistoryID] [int] IDENTITY(1,1) NOT NULL,
	[VehicleID] [int] NULL,
	[SpotsID] [int] NULL,
	[VehicleTypeID] [int] NULL,
	[Regnum] [nvarchar](10) NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NULL,
	[CostTotal] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[HistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Spots]    Script Date: 2019-12-22 21:15:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Spots](
	[SpotsID] [int] NOT NULL,
	[Spot] [int] NULL,
	[Regnum] [nvarchar](10) NULL,
	[Size] [int] NULL,
	[UsedSize] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SpotsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicle]    Script Date: 2019-12-22 21:15:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle](
	[VehicleID] [int] IDENTITY(1,1) NOT NULL,
	[SpotsID] [int] NULL,
	[VehicleTypeID] [int] NULL,
	[Regnum] [nvarchar](10) NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NULL,
	[CostTotal] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[VehicleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleType]    Script Date: 2019-12-22 21:15:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleType](
	[VehicleTypeID] [int] NOT NULL,
	[VehicleType] [nvarchar](255) NOT NULL,
	[Cost] [money] NOT NULL,
	[Size] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VehicleTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[History] ON 
GO
INSERT [dbo].[History] ([HistoryID], [VehicleID], [SpotsID], [VehicleTypeID], [Regnum], [StartTime], [EndTime], [CostTotal]) VALUES (1, 20, 15, 2, N'E123', CAST(N'2019-12-22T18:29:50.403' AS DateTime), CAST(N'2019-12-22T18:30:15.690' AS DateTime), 0.0000)
GO
INSERT [dbo].[History] ([HistoryID], [VehicleID], [SpotsID], [VehicleTypeID], [Regnum], [StartTime], [EndTime], [CostTotal]) VALUES (2, 15, 10, 1, N'123E', CAST(N'2019-12-22T18:29:10.783' AS DateTime), CAST(N'2019-12-22T18:30:18.430' AS DateTime), 0.0000)
GO
INSERT [dbo].[History] ([HistoryID], [VehicleID], [SpotsID], [VehicleTypeID], [Regnum], [StartTime], [EndTime], [CostTotal]) VALUES (3, 19, 14, 2, N'D123', CAST(N'2019-12-22T18:29:46.417' AS DateTime), CAST(N'2019-12-22T18:38:13.473' AS DateTime), 40.0000)
GO
INSERT [dbo].[History] ([HistoryID], [VehicleID], [SpotsID], [VehicleTypeID], [Regnum], [StartTime], [EndTime], [CostTotal]) VALUES (4, 14, 10, 1, N'123D', CAST(N'2019-12-22T18:29:05.370' AS DateTime), CAST(N'2019-12-22T18:38:16.617' AS DateTime), 20.0000)
GO
INSERT [dbo].[History] ([HistoryID], [VehicleID], [SpotsID], [VehicleTypeID], [Regnum], [StartTime], [EndTime], [CostTotal]) VALUES (5, 18, 13, 2, N'C123', CAST(N'2019-12-22T18:29:41.373' AS DateTime), CAST(N'2019-12-22T20:16:05.513' AS DateTime), 40.0000)
GO
INSERT [dbo].[History] ([HistoryID], [VehicleID], [SpotsID], [VehicleTypeID], [Regnum], [StartTime], [EndTime], [CostTotal]) VALUES (6, 13, 9, 1, N'123C', CAST(N'2019-12-22T18:28:53.273' AS DateTime), CAST(N'2019-12-22T20:16:10.967' AS DateTime), 20.0000)
GO
INSERT [dbo].[History] ([HistoryID], [VehicleID], [SpotsID], [VehicleTypeID], [Regnum], [StartTime], [EndTime], [CostTotal]) VALUES (7, 17, 12, 2, N'B123', CAST(N'2019-12-22T18:29:32.800' AS DateTime), CAST(N'2019-12-22T20:41:51.660' AS DateTime), 60.0000)
GO
INSERT [dbo].[History] ([HistoryID], [VehicleID], [SpotsID], [VehicleTypeID], [Regnum], [StartTime], [EndTime], [CostTotal]) VALUES (8, 16, 11, 2, N'A123', CAST(N'2019-12-22T18:29:25.240' AS DateTime), CAST(N'2019-12-22T20:41:55.160' AS DateTime), 60.0000)
GO
INSERT [dbo].[History] ([HistoryID], [VehicleID], [SpotsID], [VehicleTypeID], [Regnum], [StartTime], [EndTime], [CostTotal]) VALUES (9, 12, 9, 1, N'123B', CAST(N'2019-12-22T18:28:44.247' AS DateTime), CAST(N'2019-12-22T20:41:58.470' AS DateTime), 30.0000)
GO
INSERT [dbo].[History] ([HistoryID], [VehicleID], [SpotsID], [VehicleTypeID], [Regnum], [StartTime], [EndTime], [CostTotal]) VALUES (10, 11, 7, 1, N'123A', CAST(N'2019-12-22T18:28:33.730' AS DateTime), CAST(N'2019-12-22T20:42:01.000' AS DateTime), 30.0000)
GO
SET IDENTITY_INSERT [dbo].[History] OFF
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (1, 1, NULL, 100, 100)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (2, 2, NULL, 100, 100)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (3, 3, NULL, 100, 100)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (4, 4, NULL, 100, 100)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (5, 5, NULL, 100, 100)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (6, 6, NULL, 100, 100)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (7, 7, NULL, 100, 100)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (8, 8, NULL, 100, 100)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (9, 9, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (10, 10, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (11, 11, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (12, 12, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (13, 13, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (14, 14, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (15, 15, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (16, 16, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (17, 17, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (18, 18, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (19, 19, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (20, 20, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (21, 21, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (22, 22, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (23, 23, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (24, 24, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (25, 25, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (26, 26, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (27, 27, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (28, 28, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (29, 29, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (30, 30, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (31, 31, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (32, 32, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (33, 33, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (34, 34, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (35, 35, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (36, 36, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (37, 37, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (38, 38, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (39, 39, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (40, 40, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (41, 41, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (42, 42, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (43, 43, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (44, 44, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (45, 45, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (46, 46, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (47, 47, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (48, 48, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (49, 49, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (50, 50, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (51, 51, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (52, 52, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (53, 53, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (54, 54, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (55, 55, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (56, 56, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (57, 57, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (58, 58, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (59, 59, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (60, 60, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (61, 61, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (62, 62, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (63, 63, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (64, 64, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (65, 65, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (66, 66, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (67, 67, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (68, 68, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (69, 69, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (70, 70, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (71, 71, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (72, 72, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (73, 73, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (74, 74, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (75, 75, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (76, 76, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (77, 77, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (78, 78, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (79, 79, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (80, 80, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (81, 81, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (82, 82, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (83, 83, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (84, 84, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (85, 85, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (86, 86, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (87, 87, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (88, 88, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (89, 89, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (90, 90, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (91, 91, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (92, 92, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (93, 93, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (94, 94, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (95, 95, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (96, 96, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (97, 97, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (98, 98, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (99, 99, NULL, 100, 0)
GO
INSERT [dbo].[Spots] ([SpotsID], [Spot], [Regnum], [Size], [UsedSize]) VALUES (100, 100, NULL, 100, 0)
GO
SET IDENTITY_INSERT [dbo].[Vehicle] ON 
GO
INSERT [dbo].[Vehicle] ([VehicleID], [SpotsID], [VehicleTypeID], [Regnum], [StartTime], [EndTime], [CostTotal]) VALUES (1, 1, 1, N'ABC1', CAST(N'2019-12-22T18:22:54.040' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Vehicle] ([VehicleID], [SpotsID], [VehicleTypeID], [Regnum], [StartTime], [EndTime], [CostTotal]) VALUES (2, 1, 1, N'ABC2', CAST(N'2019-12-22T18:22:54.070' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Vehicle] ([VehicleID], [SpotsID], [VehicleTypeID], [Regnum], [StartTime], [EndTime], [CostTotal]) VALUES (3, 2, 2, N'1ABC', CAST(N'2019-12-22T18:22:54.080' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Vehicle] ([VehicleID], [SpotsID], [VehicleTypeID], [Regnum], [StartTime], [EndTime], [CostTotal]) VALUES (4, 3, 2, N'2ABC', CAST(N'2019-12-22T18:22:54.090' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Vehicle] ([VehicleID], [SpotsID], [VehicleTypeID], [Regnum], [StartTime], [EndTime], [CostTotal]) VALUES (5, 4, 1, N'ABC3', CAST(N'2019-12-22T18:23:54.300' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Vehicle] ([VehicleID], [SpotsID], [VehicleTypeID], [Regnum], [StartTime], [EndTime], [CostTotal]) VALUES (6, 4, 1, N'ABC4', CAST(N'2019-12-22T18:24:15.520' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Vehicle] ([VehicleID], [SpotsID], [VehicleTypeID], [Regnum], [StartTime], [EndTime], [CostTotal]) VALUES (7, 5, 2, N'3ABC', CAST(N'2019-12-22T18:24:21.417' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Vehicle] ([VehicleID], [SpotsID], [VehicleTypeID], [Regnum], [StartTime], [EndTime], [CostTotal]) VALUES (8, 6, 2, N'4ABC', CAST(N'2019-12-22T18:24:26.970' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Vehicle] ([VehicleID], [SpotsID], [VehicleTypeID], [Regnum], [StartTime], [EndTime], [CostTotal]) VALUES (9, 7, 1, N'ABC5', CAST(N'2019-12-22T18:25:02.953' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Vehicle] ([VehicleID], [SpotsID], [VehicleTypeID], [Regnum], [StartTime], [EndTime], [CostTotal]) VALUES (10, 8, 2, N'5ABC', CAST(N'2019-12-22T18:25:10.753' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Vehicle] ([VehicleID], [SpotsID], [VehicleTypeID], [Regnum], [StartTime], [EndTime], [CostTotal]) VALUES (11, 7, 1, N'123456', CAST(N'2019-12-22T21:13:52.340' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Vehicle] OFF
GO
INSERT [dbo].[VehicleType] ([VehicleTypeID], [VehicleType], [Cost], [Size]) VALUES (1, N'MC', 10.0000, 50)
GO
INSERT [dbo].[VehicleType] ([VehicleTypeID], [VehicleType], [Cost], [Size]) VALUES (2, N'Car', 20.0000, 100)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Vehicle__3C8BC22060FEF3E4]    Script Date: 2019-12-22 21:15:25 ******/
ALTER TABLE [dbo].[Vehicle] ADD UNIQUE NONCLUSTERED 
(
	[Regnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD FOREIGN KEY([SpotsID])
REFERENCES [dbo].[Spots] ([SpotsID])
GO
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD FOREIGN KEY([VehicleTypeID])
REFERENCES [dbo].[VehicleType] ([VehicleTypeID])
GO
ALTER TABLE [dbo].[Spots]  WITH CHECK ADD CHECK  (([UsedSize]<=[Size]))
GO
USE [master]
GO
ALTER DATABASE [ParkingJonathan] SET  READ_WRITE 
GO
