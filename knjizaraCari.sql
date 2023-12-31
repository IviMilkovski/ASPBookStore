USE [master]
GO
/****** Object:  Database [KnjizaraCari]    Script Date: 9/1/2023 8:01:26 AM ******/
CREATE DATABASE [KnjizaraCari]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KnjizaraCari', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\KnjizaraCari.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KnjizaraCari_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\KnjizaraCari_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [KnjizaraCari] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KnjizaraCari].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KnjizaraCari] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KnjizaraCari] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KnjizaraCari] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KnjizaraCari] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KnjizaraCari] SET ARITHABORT OFF 
GO
ALTER DATABASE [KnjizaraCari] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KnjizaraCari] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KnjizaraCari] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KnjizaraCari] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KnjizaraCari] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KnjizaraCari] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KnjizaraCari] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KnjizaraCari] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KnjizaraCari] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KnjizaraCari] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KnjizaraCari] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KnjizaraCari] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KnjizaraCari] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KnjizaraCari] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KnjizaraCari] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KnjizaraCari] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KnjizaraCari] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KnjizaraCari] SET RECOVERY FULL 
GO
ALTER DATABASE [KnjizaraCari] SET  MULTI_USER 
GO
ALTER DATABASE [KnjizaraCari] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KnjizaraCari] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KnjizaraCari] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KnjizaraCari] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KnjizaraCari] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KnjizaraCari] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'KnjizaraCari', N'ON'
GO
ALTER DATABASE [KnjizaraCari] SET QUERY_STORE = ON
GO
ALTER DATABASE [KnjizaraCari] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [KnjizaraCari]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 9/1/2023 8:01:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuditLogs]    Script Date: 9/1/2023 8:01:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[UseCaseName] [nvarchar](max) NULL,
	[Actor] [nvarchar](max) NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_AuditLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 9/1/2023 8:01:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookAuthors]    Script Date: 9/1/2023 8:01:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookAuthors](
	[BookId] [int] NOT NULL,
	[AuthorId] [int] NOT NULL,
 CONSTRAINT [PK_BookAuthors] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC,
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 9/1/2023 8:01:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](150) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[IsHot] [bit] NOT NULL,
	[NumberOfPages] [int] NULL,
	[CategoryId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 9/1/2023 8:01:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NOT NULL,
	[BookId] [int] NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 9/1/2023 8:01:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](450) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderLines]    Script Date: 9/1/2023 8:01:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderLines](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[BookId] [int] NULL,
	[OrderId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_OrderLines] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 9/1/2023 8:01:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[ZipCode] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
	[DeliverDate] [datetime2](7) NOT NULL,
	[UserId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/1/2023 8:01:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](40) NOT NULL,
	[Username] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserUseCases]    Script Date: 9/1/2023 8:01:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUseCases](
	[UserId] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
 CONSTRAINT [PK_UserUseCases] PRIMARY KEY CLUSTERED 
(
	[UseCaseId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230819103448_Initial', N'6.0.21')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230826155622_SecondMigration', N'6.0.21')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230827122213_AddQuantityToBooks', N'6.0.21')
GO
SET IDENTITY_INSERT [dbo].[AuditLogs] ON 

INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (1, CAST(N'2023-08-22T12:00:39.6381365' AS DateTime2), N'5', N'get category query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (2, CAST(N'2023-08-22T12:02:01.6740970' AS DateTime2), N'5', N'get category query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (3, CAST(N'2023-08-22T17:42:55.8318404' AS DateTime2), N'{"Name":"Fantasy","PerPage":6,"Page":1}', N'get categories query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (4, CAST(N'2023-08-22T17:53:04.1894577' AS DateTime2), N'{"Name":"Modern Literature","Id":0}', N'Create New Category', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (5, CAST(N'2023-08-22T17:54:22.3950365' AS DateTime2), N'{"Name":"Modern Literature","PerPage":6,"Page":1}', N'get categories query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (6, CAST(N'2023-08-22T17:54:31.3429275' AS DateTime2), N'{"Name":"M","PerPage":6,"Page":1}', N'get categories query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (7, CAST(N'2023-08-22T18:17:24.4285208' AS DateTime2), N'1002', N'delete category command', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (8, CAST(N'2023-08-23T17:28:54.4553792' AS DateTime2), N'{"Name":"epic fantasy","Id":1}', N'update category command', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (9, CAST(N'2023-08-23T17:29:22.1739951' AS DateTime2), N'{"Name":"Fantasy","Id":1}', N'update category command', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (10, CAST(N'2023-08-26T09:38:29.3634878' AS DateTime2), N'{"FirstName":"Iva","LastName":"Milkovski","Username":"Ivi93","Email":"ivamilkovski44@gmail.com","Password":"Sifra12345","AllowedUseCases":[10],"Id":0}', N'Create user command', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (11, CAST(N'2023-08-26T09:39:51.7837284' AS DateTime2), N'{"Keyword":"iva","PerPage":6,"Page":1}', N'get users query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (12, CAST(N'2023-08-26T09:40:11.7272720' AS DateTime2), N'{"Keyword":"a","PerPage":6,"Page":1}', N'get users query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (13, CAST(N'2023-08-26T09:40:55.9934558' AS DateTime2), N'1', N'Get user query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (14, CAST(N'2023-08-26T09:41:34.9698573' AS DateTime2), N'9', N'Delete user command', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (15, CAST(N'2023-08-26T09:42:58.3601881' AS DateTime2), N'9', N'Delete user command', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (16, CAST(N'2023-08-26T09:43:52.6597444' AS DateTime2), N'5', N'Delete user command', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (17, CAST(N'2023-08-26T09:48:50.0553125' AS DateTime2), N'{"FirstName":"Mile","LastName":"Carter","Username":"NadimakMile12","Email":"Bertram22@example.net","Password":"$2b$10$wLfSpkZQ102vTPX.DpQlHuWGuMr96JoTCobTPhYrtd07JcVeJmX0C","AllowedUseCases":[10],"Id":2}', N'Update user command', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (18, CAST(N'2023-08-26T09:53:38.8978621' AS DateTime2), N'{"FirstName":"Mile","LastName":"Carter","Username":"NadimakMile12","Email":"Bertram22@example.net","Password":"$2b$10$wLfSpkZQ102vTPX.DpQlHuWGuMr96JoTCobTPhYrtd07JcVeJmX0C","AllowedUseCases":[10],"Id":2}', N'Update user command', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (19, CAST(N'2023-08-26T18:15:56.2293053' AS DateTime2), N'{"Name":"a","PerPage":6,"Page":1}', N'get authors query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (20, CAST(N'2023-08-26T18:16:25.8015388' AS DateTime2), N'2', N'Get author query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (21, CAST(N'2023-08-26T18:17:28.2936184' AS DateTime2), N'2', N'Delete author command', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (22, CAST(N'2023-08-26T18:18:48.7135643' AS DateTime2), N'2', N'Delete author command', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (23, CAST(N'2023-08-26T18:20:04.1984315' AS DateTime2), N'{"FirstName":"Emily","LastName":"Brown","BookAuthors":[],"Id":3}', N'Update author command', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (24, CAST(N'2023-08-26T18:20:41.5249800' AS DateTime2), N'{"FirstName":"Emily","LastName":"Dikson","BookAuthors":[],"Id":0}', N'Create New Author', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (25, CAST(N'2023-08-26T18:21:35.4674228' AS DateTime2), N'5', N'Get author query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (26, CAST(N'2023-08-26T18:25:07.2590323' AS DateTime2), N'5', N'Get author query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (27, CAST(N'2023-08-26T18:25:26.4831162' AS DateTime2), N'6', N'Get author query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (28, CAST(N'2023-08-26T18:28:28.8076659' AS DateTime2), N'{"Name":"e","PerPage":6,"Page":1}', N'get authors query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (29, CAST(N'2023-08-26T19:09:31.5764189' AS DateTime2), N'6', N'Get author query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (30, CAST(N'2023-08-26T23:24:51.5286785' AS DateTime2), N'{"Keyword":"a","MinPrice":null,"MaxPrice":null,"CategoryId":null,"IsHot":null,"PerPage":6,"Page":1}', N'get products query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (31, CAST(N'2023-08-26T23:25:41.5912507' AS DateTime2), N'2', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (32, CAST(N'2023-08-26T23:26:02.3298776' AS DateTime2), N'7', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (33, CAST(N'2023-08-26T23:26:38.6289228' AS DateTime2), N'17', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (34, CAST(N'2023-08-26T23:35:08.7390212' AS DateTime2), N'17', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (35, CAST(N'2023-08-26T23:36:25.4022004' AS DateTime2), N'23', N'Delete book command', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (36, CAST(N'2023-08-26T23:37:02.5225573' AS DateTime2), N'17', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (37, CAST(N'2023-08-27T11:09:15.9084849' AS DateTime2), N'{"FirstName":"Emily","LastName":"Charles","BookAuthors":[],"Id":0}', N'Create New Author', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (38, CAST(N'2023-08-27T11:49:26.5500206' AS DateTime2), N'{"Name":"Uspavanka","Description":"Harum distinctio iusto illo consectetur in.","Image":"https://picsum.photos/640/480/?image=548","Price":317.06,"IsHot":false,"NumberOfPages":100,"CategoryId":6,"Id":0}', N'Create book command', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (39, CAST(N'2023-08-27T11:50:25.0161169' AS DateTime2), N'17', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (40, CAST(N'2023-08-27T11:51:00.2571364' AS DateTime2), N'{"Name":"Wooden Gloves","Description":"Harum distinctio iusto illo consectetur in.","Image":"https://picsum.photos/640/480/?image=548","Price":317.06,"IsHot":false,"NumberOfPages":null,"CategoryId":5,"Id":17}', N'Update book command', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (41, CAST(N'2023-08-27T12:25:40.3058021' AS DateTime2), N'21', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (42, CAST(N'2023-08-27T12:26:18.2632247' AS DateTime2), N'{"Name":"Awesome Steel Gloves","Description":"Molestias distinctio nihil voluptatum sint expedita.","Image":"https://picsum.photos/640/480/?image=103","Price":95.21,"Quantity":40,"IsHot":true,"NumberOfPages":null,"CategoryId":3,"Id":21}', N'Update book command', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (43, CAST(N'2023-08-27T12:46:56.6919363' AS DateTime2), N'{"Quantity":5,"Price":95.21,"BookId":21,"BookName":"Awesome Steel Gloves","UserId":2,"Id":0}', N'Create cart command', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (44, CAST(N'2023-08-27T12:48:03.6848948' AS DateTime2), N'1', N'Get cart query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (45, CAST(N'2023-08-27T12:48:39.1478320' AS DateTime2), N'1', N'Get cart query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (46, CAST(N'2023-08-27T12:49:23.2097355' AS DateTime2), N'1', N'Get cart query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (47, CAST(N'2023-08-27T12:51:00.7653149' AS DateTime2), N'1002', N'Get cart query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (48, CAST(N'2023-08-27T12:53:44.2000443' AS DateTime2), N'{"Quantity":6,"Price":100.21,"BookId":20,"BookName":"Generic Soft Sausages","UserId":1002,"Id":0}', N'Create cart command', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (49, CAST(N'2023-08-27T12:54:55.1419783' AS DateTime2), N'{"Quantity":10,"Price":100.21,"BookId":20,"BookName":"Generic Soft Sausages","UserId":1002,"Id":0}', N'Create cart command', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (50, CAST(N'2023-08-27T12:55:25.9268952' AS DateTime2), N'1002', N'Get cart query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (51, CAST(N'2023-08-27T12:56:01.9681858' AS DateTime2), N'{"Quantity":1,"Price":95.21,"BookId":21,"BookName":"Awesome Steel Gloves","UserId":1002,"Id":0}', N'Create cart command', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (52, CAST(N'2023-08-27T14:50:21.5163006' AS DateTime2), N'{"Address":"Nikoliceva 123/23","City":"Beograd","ZipCode":"11000","Phone":"+381234564","Note":"I hope I can also get the free magazin of the bookstore. Thanks.","DeliverDate":"0001-01-01T00:00:00","UserId":1002,"Items":[],"Id":0}', N'Create order', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (53, CAST(N'2023-08-27T14:51:26.3562605' AS DateTime2), N'{"Address":"Nikoliceva 123/23","City":"Beograd","ZipCode":"11000","Phone":"+381234564","Note":"I hope I can also get the free magazin of the bookstore. Thanks.","DeliverDate":"0001-01-01T00:00:00","UserId":1002,"Items":[],"Id":0}', N'Create order', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (54, CAST(N'2023-08-27T14:52:01.9653271' AS DateTime2), N'{"Address":"Nikoliceva 123/23","City":"Beograd","ZipCode":"11000","Phone":"+381234564","Note":"I hope I can also get the free magazin of the bookstore. Thanks.","DeliverDate":"0001-01-01T00:00:00","UserId":1002,"Items":[],"Id":0}', N'Create order', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (55, CAST(N'2023-08-27T14:52:53.6461522' AS DateTime2), N'{"Address":"Nikoliceva 123/23","City":"Beograd","ZipCode":"11000","Phone":"+381234564","Note":"I hope I can also get the free magazin of the bookstore. Thanks.","DeliverDate":"0001-01-01T00:00:00","UserId":1002,"Items":[],"Id":0}', N'Create order', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (56, CAST(N'2023-08-27T14:53:29.8051933' AS DateTime2), N'{"Address":"Nikoliceva 123/23","City":"Beograd","ZipCode":"11000","Phone":"+381234564","Note":"I hope I can also get the free magazin of the bookstore. Thanks.","DeliverDate":"0001-01-01T00:00:00","UserId":1002,"Items":[],"Id":0}', N'Create order', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (57, CAST(N'2023-08-27T14:55:30.5552953' AS DateTime2), N'{"Address":"Nikoliceva 123/23","City":"Beograd","ZipCode":"11000","Phone":"+381234564","Note":"I hope I can also get the free magazin of the bookstore. Thanks.","DeliverDate":"0001-01-01T00:00:00","UserId":1002,"Items":[],"Id":0}', N'Create order', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (58, CAST(N'2023-08-27T14:57:09.0099011' AS DateTime2), N'{"Address":"Nikoliceva 123/23","City":"Beograd","ZipCode":"11000","Phone":"+381234564","Note":"I hope I can also get the free magazin of the bookstore. Thanks.","DeliverDate":"0001-01-01T00:00:00","UserId":1002,"Items":[],"Id":0}', N'Create order', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (59, CAST(N'2023-08-27T14:58:09.6582496' AS DateTime2), N'{"Address":"Nikoliceva 123/23","City":"Beograd","ZipCode":"11000","Phone":"+381234564","Note":"I hope I can also get the free magazin of the bookstore. Thanks.","DeliverDate":"0001-01-01T00:00:00","UserId":1002,"Items":[],"Id":0}', N'Create order', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (60, CAST(N'2023-08-27T15:01:18.2615293' AS DateTime2), N'{"Address":"Nikoliceva 123/23","City":"Beograd","ZipCode":"11000","Phone":"+381234564","Note":"I hope I can also get the free magazin of the bookstore. Thanks.","DeliverDate":"2023-09-09T05:00:00+02:00","UserId":1002,"Items":[],"Id":0}', N'Create order', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (61, CAST(N'2023-08-27T15:01:34.5200180' AS DateTime2), N'{"Address":"Nikoliceva 123/23","City":"Beograd","ZipCode":"11000","Phone":"+381234564","Note":"I hope I can also get the free magazin of the bookstore. Thanks.","DeliverDate":"2023-09-09T12:00:00","UserId":1002,"Items":[],"Id":0}', N'Create order', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (62, CAST(N'2023-08-27T15:02:59.3670631' AS DateTime2), N'1', N'Get order query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (63, CAST(N'2023-08-27T15:03:43.2307172' AS DateTime2), N'1', N'Get order query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (64, CAST(N'2023-08-27T15:06:44.5280517' AS DateTime2), N'{"Keyword":"steel","DeliverDate":"0001-01-01T00:00:00","UserId":0,"PerPage":6,"Page":1}', N'Get orders query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (65, CAST(N'2023-08-28T16:36:43.2678911' AS DateTime2), N'1002', N'Get cart query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (66, CAST(N'2023-08-28T16:42:36.2004423' AS DateTime2), N'{"Actor":"an","UseCaseName":"Get author query","DateFrom":"2023-08-22 17:42:55.8318404","DateTo":"2023-08-26 18:25:26.4831162","PerPage":6,"Page":1}', N'Get logs', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (67, CAST(N'2023-08-28T16:44:46.2710966' AS DateTime2), N'{"Actor":"an","UseCaseName":null,"DateFrom":"2023-08-22 17:42:55.8318404","DateTo":"2023-08-26 18:25:26.4831162","PerPage":6,"Page":1}', N'Get logs', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (68, CAST(N'2023-08-28T16:44:52.3355757' AS DateTime2), N'{"Actor":"an","UseCaseName":null,"DateFrom":null,"DateTo":"2023-08-26 18:25:26.4831162","PerPage":6,"Page":1}', N'Get logs', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (69, CAST(N'2023-08-28T16:45:15.5101934' AS DateTime2), N'{"Actor":"an","UseCaseName":null,"DateFrom":null,"DateTo":null,"PerPage":6,"Page":1}', N'Get logs', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (70, CAST(N'2023-08-28T16:52:02.2202851' AS DateTime2), N'9', N'Get user query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (71, CAST(N'2023-08-28T16:52:17.8471449' AS DateTime2), N'19', N'Get user query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (72, CAST(N'2023-08-28T16:52:52.2098619' AS DateTime2), N'10', N'Get user query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (73, CAST(N'2023-08-28T16:53:49.4135133' AS DateTime2), N'{"FirstName":"Nora","LastName":"Dietrich","Username":"Nora44","Email":"Nora.Herzog@example.net","Password":"sifrica1234","AllowedUseCases":[10],"Id":0}', N'Create user command', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (74, CAST(N'2023-08-28T16:54:14.4201616' AS DateTime2), N'{"FirstName":"Mira","LastName":"Dietrich","Username":"Nora44","Email":"Nora.Herzog@example.net","Password":"sifrica1234","AllowedUseCases":[10],"Id":0}', N'Create user command', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (75, CAST(N'2023-08-28T16:54:30.7779235' AS DateTime2), N'{"FirstName":"Mira","LastName":"Dietrich","Username":"Mira909","Email":"Nora.Herzog@example.net","Password":"sifrica1234","AllowedUseCases":[10],"Id":0}', N'Create user command', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (76, CAST(N'2023-08-28T16:54:52.6615780' AS DateTime2), N'{"FirstName":"Mira","LastName":"Dietrich","Username":"Mira909","Email":"Mira.Herzog@example.net","Password":"sifrica1234","AllowedUseCases":[10],"Id":0}', N'Create user command', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (77, CAST(N'2023-08-28T16:55:12.0864029' AS DateTime2), N'1002', N'Get user query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (78, CAST(N'2023-08-28T16:56:08.1563474' AS DateTime2), N'{"FirstName":"Iva","LastName":"Milkovski","Username":"Ivi93","Email":"ivamilkovski44@gmail.com","Password":"Sifra1234!","AllowedUseCases":[10],"Id":1002}', N'Update user command', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (79, CAST(N'2023-08-28T17:14:25.5653422' AS DateTime2), N'{"Quantity":10,"Price":100.21,"BookId":20,"BookName":"Generic Soft Sausages","UserId":1003,"Id":0}', N'Create cart command', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (80, CAST(N'2023-08-28T17:15:56.4632784' AS DateTime2), N'{"Quantity":6,"Price":100.21,"BookId":21,"BookName":"Awesome Steel Gloves","UserId":1003,"Id":0}', N'Create cart command', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (81, CAST(N'2023-08-28T17:17:33.5690979' AS DateTime2), N'{"Address":"Nikoliceva 123/23","City":"Beograd","ZipCode":"11000","Phone":"+381234564","Note":"I hope I can also get the free magazin of the bookstore. Thanks.","DeliverDate":"2023-09-03T12:00:00","UserId":1002,"Items":[],"Id":0}', N'Create order', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (82, CAST(N'2023-08-28T17:22:04.7618263' AS DateTime2), N'{"Address":"Nikoliceva 123/23","City":"Beograd","ZipCode":"11000","Phone":"+381234564","Note":"I hope I can also get the free magazin of the bookstore. Thanks.","DeliverDate":"2023-09-03T12:00:00","UserId":1002,"Items":[],"Id":0}', N'Create order', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (83, CAST(N'2023-08-28T17:22:46.4801596' AS DateTime2), N'{"Address":"Nikoliceva 123/23","City":"Beograd","ZipCode":"11000","Phone":"+381234564","Note":"I hope I can also get the free magazin of the bookstore. Thanks.","DeliverDate":"2023-09-03T12:00:00","UserId":1002,"Items":[],"Id":0}', N'Create order', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (84, CAST(N'2023-08-28T17:23:11.5407120' AS DateTime2), N'{"Quantity":9,"Price":100.21,"BookId":21,"BookName":"Awesome Steel Gloves","UserId":1002,"Id":0}', N'Create cart command', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (85, CAST(N'2023-08-28T17:23:14.8315040' AS DateTime2), N'{"Quantity":9,"Price":100.21,"BookId":21,"BookName":"Awesome Steel Gloves","UserId":1002,"Id":0}', N'Create cart command', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (86, CAST(N'2023-08-28T17:23:23.8485272' AS DateTime2), N'{"Address":"Nikoliceva 123/23","City":"Beograd","ZipCode":"11000","Phone":"+381234564","Note":"I hope I can also get the free magazin of the bookstore. Thanks.","DeliverDate":"2023-09-03T12:00:00","UserId":1002,"Items":[],"Id":0}', N'Create order', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (87, CAST(N'2023-08-29T06:49:52.6750225' AS DateTime2), N'4', N'Get author query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (88, CAST(N'2023-08-29T06:50:39.3647546' AS DateTime2), N'6', N'Get author query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (89, CAST(N'2023-08-29T06:54:37.0958589' AS DateTime2), N'21', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (90, CAST(N'2023-08-29T06:55:23.7998839' AS DateTime2), N'6', N'Get author query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (91, CAST(N'2023-08-29T09:18:03.9802973' AS DateTime2), N'21', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (92, CAST(N'2023-08-29T09:20:06.1601437' AS DateTime2), N'21', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (93, CAST(N'2023-08-29T09:42:19.8619036' AS DateTime2), N'21', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (94, CAST(N'2023-08-29T09:42:45.0369875' AS DateTime2), N'20', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (95, CAST(N'2023-08-29T09:43:04.5319883' AS DateTime2), N'18', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (96, CAST(N'2023-08-29T09:47:27.8738445' AS DateTime2), N'18', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (97, CAST(N'2023-08-29T09:48:38.5340485' AS DateTime2), N'21', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (98, CAST(N'2023-08-29T10:11:11.2622650' AS DateTime2), N'21', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (99, CAST(N'2023-08-29T10:22:23.4779676' AS DateTime2), N'20', N'Get book query', N'Anonymus', NULL)
GO
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (100, CAST(N'2023-08-29T10:22:46.9120651' AS DateTime2), N'16', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (101, CAST(N'2023-08-29T10:32:53.1826118' AS DateTime2), N'16', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (102, CAST(N'2023-08-29T10:32:59.1400763' AS DateTime2), N'17', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (103, CAST(N'2023-08-29T10:33:03.8519410' AS DateTime2), N'18', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (104, CAST(N'2023-08-29T10:34:13.0800454' AS DateTime2), N'21', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (105, CAST(N'2023-08-29T10:35:06.5387080' AS DateTime2), N'21', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (106, CAST(N'2023-08-29T10:36:43.2642068' AS DateTime2), N'21', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (107, CAST(N'2023-08-29T10:38:59.6736042' AS DateTime2), N'23', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (108, CAST(N'2023-08-29T10:40:25.2035214' AS DateTime2), N'21', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (109, CAST(N'2023-08-29T10:42:01.1302468' AS DateTime2), N'21', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (110, CAST(N'2023-08-29T10:43:15.0579679' AS DateTime2), N'21', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (111, CAST(N'2023-08-29T10:43:16.1910002' AS DateTime2), N'21', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (112, CAST(N'2023-08-29T10:44:23.1027923' AS DateTime2), N'21', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (113, CAST(N'2023-08-29T10:46:59.6677004' AS DateTime2), N'21', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (114, CAST(N'2023-08-29T10:48:02.7190850' AS DateTime2), N'21', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (115, CAST(N'2023-08-29T10:48:47.7675365' AS DateTime2), N'21', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (116, CAST(N'2023-08-29T12:05:43.1689796' AS DateTime2), N'21', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (117, CAST(N'2023-08-29T12:14:26.1611948' AS DateTime2), N'1', N'Get order', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (118, CAST(N'2023-08-29T12:20:23.1902359' AS DateTime2), N'21', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (119, CAST(N'2023-08-29T12:28:40.0304688' AS DateTime2), N'21', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (120, CAST(N'2023-08-29T12:28:42.5649191' AS DateTime2), N'21', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (121, CAST(N'2023-08-29T12:28:43.3432530' AS DateTime2), N'21', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (122, CAST(N'2023-08-29T12:29:20.7034023' AS DateTime2), N'21', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (123, CAST(N'2023-08-29T12:30:56.8481298' AS DateTime2), N'21', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (124, CAST(N'2023-08-29T12:49:27.3849312' AS DateTime2), N'21', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (125, CAST(N'2023-08-29T12:51:04.6266238' AS DateTime2), N'21', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (126, CAST(N'2023-08-29T12:51:21.7187694' AS DateTime2), N'21', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (127, CAST(N'2023-08-29T12:52:10.3520011' AS DateTime2), N'15', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (128, CAST(N'2023-08-29T12:53:36.4669300' AS DateTime2), N'15', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (129, CAST(N'2023-08-29T12:57:07.0607255' AS DateTime2), N'15', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (130, CAST(N'2023-08-29T12:58:26.7656162' AS DateTime2), N'15', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (131, CAST(N'2023-08-29T13:01:39.4380409' AS DateTime2), N'15', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (132, CAST(N'2023-08-29T13:02:04.8795205' AS DateTime2), N'15', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (133, CAST(N'2023-08-29T13:09:10.4074976' AS DateTime2), N'21', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (134, CAST(N'2023-08-29T13:10:00.1789981' AS DateTime2), N'6', N'Get author query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (135, CAST(N'2023-08-29T13:10:08.2768666' AS DateTime2), N'3', N'Get author query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (136, CAST(N'2023-08-29T13:10:21.2269868' AS DateTime2), N'6', N'Get author query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (137, CAST(N'2023-08-29T13:11:09.3795867' AS DateTime2), N'6', N'Get author query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (138, CAST(N'2023-08-29T13:12:13.9898817' AS DateTime2), N'21', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (139, CAST(N'2023-08-29T13:13:26.2591764' AS DateTime2), N'4', N'Get author query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (140, CAST(N'2023-08-29T13:14:24.2727164' AS DateTime2), N'1', N'Get author query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (141, CAST(N'2023-08-29T13:14:31.6145620' AS DateTime2), N'2', N'Get author query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (142, CAST(N'2023-08-29T13:15:16.5428195' AS DateTime2), N'3', N'Get author query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (143, CAST(N'2023-08-29T13:15:48.6275696' AS DateTime2), N'21', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (144, CAST(N'2023-08-29T13:15:50.7771685' AS DateTime2), N'21', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (145, CAST(N'2023-08-29T13:15:58.4708159' AS DateTime2), N'18', N'Get book query', N'Anonymus', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (146, CAST(N'2023-08-29T18:22:12.2754350' AS DateTime2), N'2', N'get category query', N'Anonymous', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (147, CAST(N'2023-08-29T18:24:41.1492498' AS DateTime2), N'{"FirstName":"Mirjana","LastName":"Dietrich","Username":"Mira34909","Email":"Mirj.Herzog@example.net","Password":"sifrica1234","Id":0}', N'Create user command', N'Anonymous', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (148, CAST(N'2023-08-29T18:25:33.6991331' AS DateTime2), N'{"FirstName":"Mana","LastName":"Dirich","Username":"Mira34909","Email":"Mi.Herzog@example.net","Password":"sifrica1234","Id":0}', N'Create user command', N'Anonymous', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (149, CAST(N'2023-08-29T18:25:54.5277037' AS DateTime2), N'{"FirstName":"Mana","LastName":"Dirich","Username":"Mana34909","Email":"Mi.Herzog@example.net","Password":"sifrica1234","Id":0}', N'Create user command', N'Anonymous', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (150, CAST(N'2023-08-29T18:43:36.1677781' AS DateTime2), N'{"Name":"Sci-fi","Id":0}', N'Create New Category', N'Mana34909', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (151, CAST(N'2023-08-29T18:44:55.8840705' AS DateTime2), N'{"Quantity":9,"Price":100.21,"BookId":21,"BookName":"Awesome Steel Gloves","UserId":1007,"Id":0}', N'Create cart command', N'Mana34909', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (152, CAST(N'2023-08-29T18:45:21.5479469' AS DateTime2), N'{"Quantity":1,"Price":100.21,"BookId":21,"BookName":"Awesome Steel Gloves","UserId":0,"Id":0}', N'Create cart command', N'Mana34909', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (153, CAST(N'2023-08-29T18:46:38.2040042' AS DateTime2), N'{"Name":"Sci-fi","Id":0}', N'Create New Category', N'Mana34909', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (154, CAST(N'2023-08-29T19:01:05.8509397' AS DateTime2), N'{"FirstName":"Sara","LastName":"Nikolic","Username":"Sara4332","Email":"sara@ner.te","Password":"sifra12333","Id":0}', N'Create user command', N'Anonymous', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (155, CAST(N'2023-08-29T19:16:20.9996387' AS DateTime2), N'{"FirstName":"Iva","LastName":"Admin","Username":"Admin","Email":"admin@cari.te","Password":"sifra1234","Id":0}', N'Create user command', N'Anonymous', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (156, CAST(N'2023-08-29T19:23:15.1292024' AS DateTime2), N'{"Actor":null,"UseCaseName":"get category query","DateFrom":null,"DateTo":null,"PerPage":6,"Page":1}', N'Get logs', N'Anonymous', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (157, CAST(N'2023-08-29T19:33:34.5498278' AS DateTime2), N'{"Name":"Sci-fi","Id":0}', N'Create New Category', N'Admin', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (158, CAST(N'2023-08-29T19:34:00.1427673' AS DateTime2), N'{"Actor":"an","UseCaseName":null,"DateFrom":null,"DateTo":null,"PerPage":6,"Page":1}', N'Get logs', N'Admin', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (159, CAST(N'2023-08-29T19:34:58.4031636' AS DateTime2), N'17', N'Get book query', N'Admin', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (160, CAST(N'2023-08-29T19:36:31.6499275' AS DateTime2), N'{"Name":"Kids book","Description":"Harum distinctio iusto illo consectetur in.","Image":"https://picsum.photos/640/480/?image=548","UploadedImage":null,"Price":12.06,"Quantity":100,"IsHot":false,"NumberOfPages":125,"CategoryName":null,"CategoryId":5,"BookAuthors":[],"Id":0}', N'Create book command', N'Admin', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (161, CAST(N'2023-08-29T19:36:57.5918636' AS DateTime2), N'{"Name":"Kids book","Description":"Harum distinctio iusto illo consectetur in.","Image":"https://picsum.photos/640/480/?image=548","UploadedImage":null,"Price":12.06,"Quantity":100,"IsHot":false,"NumberOfPages":125,"CategoryName":null,"CategoryId":5,"BookAuthors":[],"Id":0}', N'Create book command', N'Admin', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (162, CAST(N'2023-08-29T19:39:25.8314685' AS DateTime2), N'{"Name":"Kids book","Description":"Harum distinctio iusto illo consectetur in.","Image":"https://picsum.photos/640/480/?image=548","UploadedImage":null,"Price":12.06,"Quantity":100,"IsHot":false,"NumberOfPages":125,"CategoryName":null,"CategoryId":5,"BookAuthors":[],"Id":0}', N'Create book command', N'Admin', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (163, CAST(N'2023-08-29T20:04:40.9377975' AS DateTime2), N'{"Actor":"an","UseCaseName":null,"DateFrom":null,"DateTo":null,"PerPage":6,"Page":1}', N'Get logs', N'Admin', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (164, CAST(N'2023-08-29T20:05:24.0785818' AS DateTime2), N'21', N'Get book query', N'Admin', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (165, CAST(N'2023-08-29T20:09:50.4217737' AS DateTime2), N'{"Name":"Awesome Steel Gloves","Description":"Molestias distinctio nihil voluptatum sint expedita.","Image":"https://picsum.photos/640/480/?image=103","UploadedImage":null,"Price":95.21,"Quantity":0,"IsHot":true,"NumberOfPages":null,"CategoryName":"Contemporary","CategoryId":3,"BookAuthors":[{"BookId":21,"AuthorId":5}],"Id":21}', N'Update book command', N'Admin', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (166, CAST(N'2023-08-29T20:10:14.1347309' AS DateTime2), N'21', N'Get book query', N'Admin', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (167, CAST(N'2023-08-29T20:14:03.3606503' AS DateTime2), N'1007', N'Get cart query', N'Mana34909', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (168, CAST(N'2023-08-29T20:17:54.5986129' AS DateTime2), N'{"Address":"Beogradska 123/23","City":"Beograd","ZipCode":"11000","Phone":"+3877734564","Note":"I hope I can also get the free magazin of the bookstore. Thanks.","DeliverDate":"2023-09-08T12:00:00","UserId":1007,"Items":[],"Id":0}', N'Create order', N'Mana34909', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (169, CAST(N'2023-08-29T20:18:52.2930836' AS DateTime2), N'4', N'Get order', N'Mana34909', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (170, CAST(N'2023-08-29T20:19:19.2552595' AS DateTime2), N'4', N'Get order', N'Mana34909', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (171, CAST(N'2023-08-29T20:26:04.4739409' AS DateTime2), N'{"Actor":"an","UseCaseName":null,"DateFrom":null,"DateTo":null,"PerPage":6,"Page":1}', N'Get logs', N'Admin', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (172, CAST(N'2023-08-29T20:26:31.9883149' AS DateTime2), N'{"Keyword":"steel","DeliverDate":"0001-01-01T00:00:00","UserId":0,"PerPage":6,"Page":1}', N'Get orders query', N'Admin', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (173, CAST(N'2023-08-29T20:26:48.7679890' AS DateTime2), N'4', N'Get order', N'Admin', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (174, CAST(N'2023-08-29T20:27:04.9995716' AS DateTime2), N'3', N'Get author query', N'Admin', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (175, CAST(N'2023-08-30T17:30:36.7551936' AS DateTime2), N'{"Name":"Pride and Prejudise","Description":"A classic love story.\n","Image":"https://picsum.photos/640/480/?image=992","UploadedImage":{"ContentDisposition":"form-data; name=\"UploadedImage\"; filename=\"pizza.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"UploadedImage\"; filename=\"pizza.jpg\""],"Content-Type":["image/jpeg"]},"Length":12980,"Name":"UploadedImage","FileName":"pizza.jpg"},"Price":203.40,"Quantity":100,"IsHot":true,"NumberOfPages":400,"CategoryName":null,"CategoryId":6,"BookAuthors":[],"Id":0}', N'Create book command', N'Anonymous', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (176, CAST(N'2023-08-30T17:31:23.5103301' AS DateTime2), N'{"Name":"Pride and Prejudise","Description":"A classic love story.\n","Image":"https://picsum.photos/640/480/?image=992","UploadedImage":{"ContentDisposition":"form-data; name=\"UploadedImage\"; filename=\"pizza.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"UploadedImage\"; filename=\"pizza.jpg\""],"Content-Type":["image/jpeg"]},"Length":12980,"Name":"UploadedImage","FileName":"pizza.jpg"},"Price":203.40,"Quantity":100,"IsHot":true,"NumberOfPages":400,"CategoryName":null,"CategoryId":6,"BookAuthors":[],"Id":0}', N'Create book command', N'Anonymous', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (177, CAST(N'2023-08-30T18:05:15.3434358' AS DateTime2), N'{"FirstName":"Mana","LastName":"Dirich","Username":"Mira34909","Email":"Mi.Herzog@example.net","Password":"sifrica1234","Id":0}', N'Create User', N'Anonymous', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (178, CAST(N'2023-08-30T18:05:47.6467901' AS DateTime2), N'{"FirstName":"Iva","LastName":"Milkovski","Username":"AdminCari","Email":"adminCari@example.net","Password":"sifrica1234!","Id":0}', N'Create User', N'Anonymous', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (179, CAST(N'2023-08-30T18:13:00.1466674' AS DateTime2), N'{"Name":"Pride and Prejudise","Description":"A classic love story.\n","Image":"https://picsum.photos/640/480/?image=992","UploadedImage":{"ContentDisposition":"form-data; name=\"UploadedImage\"; filename=\"pizza.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"UploadedImage\"; filename=\"pizza.jpg\""],"Content-Type":["image/jpeg"]},"Length":12980,"Name":"UploadedImage","FileName":"pizza.jpg"},"Price":203.40,"Quantity":100,"IsHot":true,"NumberOfPages":400,"CategoryName":null,"CategoryId":6,"BookAuthors":[],"Id":0}', N'Create book command', N'AdminCari', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (180, CAST(N'2023-08-30T18:14:00.1134010' AS DateTime2), N'{"Name":"Pride","Description":"A classic love story.\n","Image":"https://picsum.photos/640/480/?image=992","UploadedImage":{"ContentDisposition":"form-data; name=\"UploadedImage\"; filename=\"pizza.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"UploadedImage\"; filename=\"pizza.jpg\""],"Content-Type":["image/jpeg"]},"Length":12980,"Name":"UploadedImage","FileName":"pizza.jpg"},"Price":203.40,"Quantity":100,"IsHot":true,"NumberOfPages":400,"CategoryName":null,"CategoryId":6,"BookAuthors":[],"Id":0}', N'Create book command', N'AdminCari', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (181, CAST(N'2023-08-30T18:17:39.0560521' AS DateTime2), N'1004', N'Get book query', N'AdminCari', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (182, CAST(N'2023-08-31T06:26:55.2192634' AS DateTime2), N'1004', N'Get book query', N'Anonymous', NULL)
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UseCaseName], [Actor], [UserId]) VALUES (183, CAST(N'2023-08-31T06:38:21.9991970' AS DateTime2), N'{"Name":"Summer time","Description":"A classic love story.\n","Image":"slika.jpg","UploadedImage":{"ContentDisposition":"form-data; name=\"UploadedImage\"; filename=\"inspo7823.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"UploadedImage\"; filename=\"inspo7823.jpg\""],"Content-Type":["image/jpeg"]},"Length":441817,"Name":"UploadedImage","FileName":"inspo7823.jpg"},"Price":203.40,"Quantity":100,"IsHot":true,"NumberOfPages":400,"CategoryName":null,"CategoryId":2,"BookAuthors":[],"Id":1004}', N'Update book command', N'AdminCari', NULL)
SET IDENTITY_INSERT [dbo].[AuditLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Authors] ON 

INSERT [dbo].[Authors] ([Id], [FirstName], [LastName], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1, N'Mila', N'Milic', CAST(N'2023-08-20T16:25:05.3483243' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (2, N'Alice', N'Smith', CAST(N'2023-08-20T16:25:05.3484550' AS DateTime2), CAST(N'2023-08-26T20:18:50.6246028' AS DateTime2), 1, CAST(N'2023-08-26T18:18:50.6142500' AS DateTime2), 0)
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (3, N'Emily', N'Brown', CAST(N'2023-08-20T16:25:05.3484561' AS DateTime2), CAST(N'2023-08-26T20:20:04.2689433' AS DateTime2), 0, NULL, 1)
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (4, N'John', N'Green', CAST(N'2023-08-20T16:25:05.3484564' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (5, N'Stefan', N'Ilic', CAST(N'2023-08-20T16:25:05.3484567' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (6, N'Ivo', N'Andric', CAST(N'2023-08-20T16:25:05.3484571' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (7, N'Mirko', N'Nikolic', CAST(N'2023-08-20T16:25:05.3484575' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1002, N'Emily', N'Dikson', CAST(N'2023-08-26T20:20:41.5483791' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1003, N'Emily', N'Charles', CAST(N'2023-08-27T13:09:18.5014940' AS DateTime2), NULL, 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[Authors] OFF
GO
INSERT [dbo].[BookAuthors] ([BookId], [AuthorId]) VALUES (23, 1)
INSERT [dbo].[BookAuthors] ([BookId], [AuthorId]) VALUES (15, 2)
INSERT [dbo].[BookAuthors] ([BookId], [AuthorId]) VALUES (21, 2)
INSERT [dbo].[BookAuthors] ([BookId], [AuthorId]) VALUES (19, 3)
INSERT [dbo].[BookAuthors] ([BookId], [AuthorId]) VALUES (21, 5)
INSERT [dbo].[BookAuthors] ([BookId], [AuthorId]) VALUES (18, 6)
INSERT [dbo].[BookAuthors] ([BookId], [AuthorId]) VALUES (20, 6)
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([Id], [Name], [Description], [Image], [Price], [IsHot], [NumberOfPages], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity]) VALUES (15, N'Incredible Frozen Chips', N'Placeat ut odit quas est aperiam.', N'https://picsum.photos/640/480/?image=428', CAST(351.60 AS Decimal(18, 2)), 0, NULL, 6, CAST(N'2023-08-20T16:45:03.9810455' AS DateTime2), NULL, 0, NULL, 1, 0)
INSERT [dbo].[Books] ([Id], [Name], [Description], [Image], [Price], [IsHot], [NumberOfPages], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity]) VALUES (16, N'Licensed Metal Tuna', N'Quis dolorem temporibus omnis aut cum.', N'https://picsum.photos/640/480/?image=130', CAST(387.17 AS Decimal(18, 2)), 0, NULL, 2, CAST(N'2023-08-20T16:45:03.9811660' AS DateTime2), NULL, 0, NULL, 1, 0)
INSERT [dbo].[Books] ([Id], [Name], [Description], [Image], [Price], [IsHot], [NumberOfPages], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity]) VALUES (17, N'Wooden Gloves', N'Harum distinctio iusto illo consectetur in.', N'https://picsum.photos/640/480/?image=548', CAST(317.06 AS Decimal(18, 2)), 0, NULL, 5, CAST(N'2023-08-20T16:45:03.9811669' AS DateTime2), CAST(N'2023-08-27T13:51:00.3698796' AS DateTime2), 0, NULL, 1, 0)
INSERT [dbo].[Books] ([Id], [Name], [Description], [Image], [Price], [IsHot], [NumberOfPages], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity]) VALUES (18, N'Sleek Fresh Sausages', N'A expedita fugit qui rerum labore.', N'https://picsum.photos/640/480/?image=992', CAST(203.40 AS Decimal(18, 2)), 0, NULL, 1, CAST(N'2023-08-20T16:45:03.9811675' AS DateTime2), NULL, 0, NULL, 1, 0)
INSERT [dbo].[Books] ([Id], [Name], [Description], [Image], [Price], [IsHot], [NumberOfPages], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity]) VALUES (19, N'Intelligent Fresh Bacon', N'Ut qui natus sunt eius blanditiis.', N'https://picsum.photos/640/480/?image=494', CAST(309.73 AS Decimal(18, 2)), 1, NULL, 5, CAST(N'2023-08-20T16:45:03.9811679' AS DateTime2), NULL, 0, NULL, 1, 0)
INSERT [dbo].[Books] ([Id], [Name], [Description], [Image], [Price], [IsHot], [NumberOfPages], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity]) VALUES (20, N'Generic Soft Sausages', N'Harum illo enim et ratione sequi.', N'https://picsum.photos/640/480/?image=545', CAST(713.67 AS Decimal(18, 2)), 1, NULL, 4, CAST(N'2023-08-20T16:45:03.9811682' AS DateTime2), NULL, 0, NULL, 1, 0)
INSERT [dbo].[Books] ([Id], [Name], [Description], [Image], [Price], [IsHot], [NumberOfPages], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity]) VALUES (21, N'Awesome Steel Gloves', N'Molestias distinctio nihil voluptatum sint expedita.', N'https://picsum.photos/640/480/?image=103', CAST(95.21 AS Decimal(18, 2)), 1, NULL, 3, CAST(N'2023-08-20T16:45:03.9811687' AS DateTime2), CAST(N'2023-08-29T20:45:21.5647012' AS DateTime2), 0, NULL, 1, 0)
INSERT [dbo].[Books] ([Id], [Name], [Description], [Image], [Price], [IsHot], [NumberOfPages], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity]) VALUES (22, N'Refined Plastic Bike', N'Ex qui unde ut fugiat fugit.', N'https://picsum.photos/640/480/?image=1065', CAST(309.69 AS Decimal(18, 2)), 1, NULL, 6, CAST(N'2023-08-20T16:45:03.9811692' AS DateTime2), NULL, 0, NULL, 1, 0)
INSERT [dbo].[Books] ([Id], [Name], [Description], [Image], [Price], [IsHot], [NumberOfPages], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity]) VALUES (23, N'Intelligent Metal Sausages', N'Omnis asperiores maxime est pariatur blanditiis.', N'https://picsum.photos/640/480/?image=68', CAST(267.30 AS Decimal(18, 2)), 0, NULL, 3, CAST(N'2023-08-20T16:45:03.9811698' AS DateTime2), CAST(N'2023-08-27T01:36:25.4228959' AS DateTime2), 1, CAST(N'2023-08-26T23:36:25.4087693' AS DateTime2), 0, 0)
INSERT [dbo].[Books] ([Id], [Name], [Description], [Image], [Price], [IsHot], [NumberOfPages], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity]) VALUES (24, N'Licensed Soft Computer', N'Quia porro ut ut consequatur aliquam.', N'https://picsum.photos/640/480/?image=376', CAST(291.65 AS Decimal(18, 2)), 1, NULL, 2, CAST(N'2023-08-20T16:45:03.9811702' AS DateTime2), NULL, 0, NULL, 1, 0)
INSERT [dbo].[Books] ([Id], [Name], [Description], [Image], [Price], [IsHot], [NumberOfPages], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity]) VALUES (1002, N'Uspavanka', N'Harum distinctio iusto illo consectetur in.', N'https://picsum.photos/640/480/?image=548', CAST(317.06 AS Decimal(18, 2)), 0, 100, 6, CAST(N'2023-08-27T13:49:36.9852408' AS DateTime2), NULL, 0, NULL, 1, 0)
INSERT [dbo].[Books] ([Id], [Name], [Description], [Image], [Price], [IsHot], [NumberOfPages], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity]) VALUES (1003, N'Kids book', N'Harum distinctio iusto illo consectetur in.', NULL, CAST(12.06 AS Decimal(18, 2)), 0, 125, 5, CAST(N'2023-08-29T21:39:27.8498681' AS DateTime2), NULL, 0, NULL, 1, 100)
INSERT [dbo].[Books] ([Id], [Name], [Description], [Image], [Price], [IsHot], [NumberOfPages], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity]) VALUES (1004, N'Summer time', N'A classic love story.
', N'slika.jpg', CAST(203.40 AS Decimal(18, 2)), 1, 400, 2, CAST(N'2023-08-30T20:14:02.2129399' AS DateTime2), CAST(N'2023-08-31T08:38:22.0881846' AS DateTime2), 0, NULL, 1, 100)
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1, N'Fantasy', CAST(N'2023-08-20T16:25:05.3484630' AS DateTime2), CAST(N'2023-08-23T19:29:22.2622983' AS DateTime2), 0, NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (2, N'Romance', CAST(N'2023-08-20T16:25:05.3484634' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (3, N'Contemporary', CAST(N'2023-08-20T16:25:05.3484637' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (4, N'Thriller', CAST(N'2023-08-20T16:25:05.3484640' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (5, N'Children', CAST(N'2023-08-20T16:25:05.3484643' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (6, N'Classic', CAST(N'2023-08-20T16:25:05.3484646' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1002, N'Modern Literature', CAST(N'2023-08-22T19:53:08.3066597' AS DateTime2), CAST(N'2023-08-22T20:17:29.7337879' AS DateTime2), 1, CAST(N'2023-08-22T18:17:29.7075797' AS DateTime2), 0)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1003, N'Sci-fi', CAST(N'2023-08-29T21:33:36.5569110' AS DateTime2), NULL, 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderLines] ON 

INSERT [dbo].[OrderLines] ([Id], [Name], [Price], [Quantity], [BookId], [OrderId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1, N'Awesome Steel Gloves', CAST(95.21 AS Decimal(18, 2)), 6, 21, 1, CAST(N'2023-08-27T17:01:34.7384591' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[OrderLines] ([Id], [Name], [Price], [Quantity], [BookId], [OrderId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (2, N'Awesome Steel Gloves', CAST(95.21 AS Decimal(18, 2)), 6, 21, 2, CAST(N'2023-08-28T19:17:33.6724084' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[OrderLines] ([Id], [Name], [Price], [Quantity], [BookId], [OrderId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (3, N'Awesome Steel Gloves', CAST(95.21 AS Decimal(18, 2)), 18, 21, 3, CAST(N'2023-08-28T19:23:23.9229375' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[OrderLines] ([Id], [Name], [Price], [Quantity], [BookId], [OrderId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (4, N'Awesome Steel Gloves', CAST(95.21 AS Decimal(18, 2)), 10, 21, 4, CAST(N'2023-08-29T22:17:58.5938693' AS DateTime2), NULL, 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[OrderLines] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [Address], [City], [ZipCode], [Phone], [Note], [DeliverDate], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1, N'Nikoliceva 123/23', N'Beograd', N'11000', N'+381234564', N'I hope I can also get the free magazin of the bookstore. Thanks.', CAST(N'2023-09-09T12:00:00.0000000' AS DateTime2), 1002, CAST(N'2023-08-27T17:01:34.7383241' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Orders] ([Id], [Address], [City], [ZipCode], [Phone], [Note], [DeliverDate], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (2, N'Nikoliceva 123/23', N'Beograd', N'11000', N'+381234564', N'I hope I can also get the free magazin of the bookstore. Thanks.', CAST(N'2023-09-03T12:00:00.0000000' AS DateTime2), 1002, CAST(N'2023-08-28T19:17:33.6723045' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Orders] ([Id], [Address], [City], [ZipCode], [Phone], [Note], [DeliverDate], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (3, N'Nikoliceva 123/23', N'Beograd', N'11000', N'+381234564', N'I hope I can also get the free magazin of the bookstore. Thanks.', CAST(N'2023-09-03T12:00:00.0000000' AS DateTime2), 1002, CAST(N'2023-08-28T19:23:23.9228298' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Orders] ([Id], [Address], [City], [ZipCode], [Phone], [Note], [DeliverDate], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (4, N'Beogradska 123/23', N'Beograd', N'11000', N'+3877734564', N'I hope I can also get the free magazin of the bookstore. Thanks.', CAST(N'2023-09-08T12:00:00.0000000' AS DateTime2), 1007, CAST(N'2023-08-29T22:17:58.5937298' AS DateTime2), NULL, 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Username], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1, N'Lilian', N'Spencer', N'Bert63', N'Santina_Pfannerstill51@example.com', N'$2b$10$gy9HoyvzjlgJRnwsuyRNEOE/BA0BM80izUk3HY3OBPV649F5hAVAO', CAST(N'2023-08-20T16:25:05.3484580' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Username], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (2, N'Mile', N'Carter', N'NadimakMile12', N'Bertram22@example.net', N'$2b$10$wLfSpkZQ102vTPX.DpQlHuWGuMr96JoTCobTPhYrtd07JcVeJmX0C', CAST(N'2023-08-20T16:25:05.3484585' AS DateTime2), CAST(N'2023-08-26T11:53:41.0013835' AS DateTime2), 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Username], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (3, N'Afton', N'O''Reilly', N'Leroy.Conn40', N'Orlo_Harris@example.com', N'$2b$10$UhgVQ9OuWeKvPO7S7K1llujD5rKQdVF6BfYSzbkyj5iIVCFS/SFEO', CAST(N'2023-08-20T16:25:05.3484591' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Username], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (4, N'Jamar', N'Volkman', N'Terrence_Labadie14', N'Finn_Feest@example.com', N'$2b$10$nqklWZuX6cdce8PSwb3le.JSJiSybLq.qIcEg0E6B3C.x8k.FWafS', CAST(N'2023-08-20T16:25:05.3484596' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Username], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (5, N'Bertram', N'Haag', N'Dwight_Will5', N'Effie_Ziemann98@example.org', N'$2b$10$iI7d6AU3OfHPvRaA8.TEAOinuxF7wQJ6A7nq5tpdNWCvruQa65gUi', CAST(N'2023-08-20T16:25:05.3484605' AS DateTime2), CAST(N'2023-08-26T11:44:29.5741976' AS DateTime2), 1, CAST(N'2023-08-26T09:44:28.7533466' AS DateTime2), 0)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Username], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (6, N'Rod', N'Leannon', N'Saul_Lesch', N'Haskell.Homenick@example.net', N'$2b$10$oZlsFD4mioLJrDOVH.0kB.l47E7Ie8M.xDK9.oDzoGi1uyhQT2cYu', CAST(N'2023-08-20T16:25:05.3484609' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Username], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (7, N'Kelley', N'Gerlach', N'Charlotte36', N'Maximillian.Price@example.com', N'$2b$10$jklfeLrObSnLzfyxCJgxp.yXR3PYRsB7iAS43wL10YbgCxg5vW6I.', CAST(N'2023-08-20T16:25:05.3484614' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Username], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (8, N'Jaquelin', N'Ebert', N'Alejandro_Walter59', N'Jewell22@example.net', N'$2b$10$Jox6bbx2uHqFHCxPUlHz4ORYYD1Zesqfa6qxQUxotccRjf.8.DN.S', CAST(N'2023-08-20T16:25:05.3484619' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Username], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (9, N'Leone', N'Treutel', N'Paulette5', N'Onie21@example.net', N'$2b$10$Coly4yBIENYsGypGt9Y7k.bvhWYZWE7T3Wf07ONWOhI6DdCSsFyfe', CAST(N'2023-08-20T16:25:05.3484623' AS DateTime2), CAST(N'2023-08-26T11:41:34.9853665' AS DateTime2), 1, CAST(N'2023-08-26T09:41:34.9851629' AS DateTime2), 0)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Username], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (10, N'Norval', N'Dietrich', N'Lynn90', N'Kane.Herzog@example.net', N'$2b$10$gEayTT2UPXW996wc8I27COl3hw74Q19RifCqxYaiqy7dNlAHUWByK', CAST(N'2023-08-20T16:25:05.3484627' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Username], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1002, N'Iva', N'Milkovski', N'Ivi93', N'ivamilkovski44@gmail.com', N'Sifra1234!', CAST(N'2023-08-26T11:38:32.2692507' AS DateTime2), CAST(N'2023-08-28T18:56:08.2741193' AS DateTime2), 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Username], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1003, N'Nora', N'Dietrich', N'Nora44', N'Nora.Herzog@example.net', N'NIsEbokLxPIi/+U0Ibn7R0r5f7Q=', CAST(N'2023-08-28T18:53:49.4943401' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Username], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1005, N'Mira', N'Dietrich', N'Mira909', N'Mira.Herzog@example.net', N'NIsEbokLxPIi/+U0Ibn7R0r5f7Q=', CAST(N'2023-08-28T18:54:52.6655087' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Username], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1006, N'Mirjana', N'Dietrich', N'Mira34909', N'Mirj.Herzog@example.net', N'NIsEbokLxPIi/+U0Ibn7R0r5f7Q=', CAST(N'2023-08-29T20:24:41.2969911' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Username], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1007, N'Mana', N'Dirich', N'Mana34909', N'Mi.Herzog@example.net', N'NIsEbokLxPIi/+U0Ibn7R0r5f7Q=', CAST(N'2023-08-29T20:25:54.5358037' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Username], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1008, N'Sara', N'Nikolic', N'Sara4332', N'sara@ner.te', N'vOZV1/HJFa6brOjkWe8gclp/dNc=', CAST(N'2023-08-29T21:01:07.7966996' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Username], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1009, N'Iva', N'Admin', N'Admin', N'admin@cari.te', N't2J2EcjFE8mrmd0iUGzgGhGU3P4=', CAST(N'2023-08-29T21:16:23.0301535' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Username], [Email], [Password], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1010, N'Iva', N'Milkovski', N'AdminCari', N'adminCari@example.net', N'Ux/ha8fCGg3jq8yEvf99ubDjEI8=', CAST(N'2023-08-30T20:05:47.7731423' AS DateTime2), NULL, 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 10)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1002, 10)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1003, 10)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1005, 10)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1006, 1)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1006, 2)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1006, 8)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1006, 11)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1006, 12)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1006, 16)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1006, 17)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1006, 21)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1006, 22)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1006, 24)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1006, 25)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1007, 1)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1007, 2)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1007, 8)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1007, 11)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1007, 12)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1007, 16)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1007, 17)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1007, 21)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1007, 22)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1007, 24)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1007, 25)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1008, 1)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1008, 2)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1008, 8)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1008, 11)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1008, 12)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1008, 16)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1008, 17)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1008, 21)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1008, 22)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1008, 24)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1008, 25)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1009, 1)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1009, 2)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1009, 3)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1009, 4)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1009, 5)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1009, 6)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1009, 7)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1009, 8)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1009, 9)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1009, 10)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1009, 11)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1009, 12)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1009, 13)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1009, 14)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1009, 15)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1009, 16)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1009, 17)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1009, 18)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1009, 19)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1009, 20)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1009, 21)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1009, 22)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1009, 23)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1009, 24)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1009, 25)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1009, 26)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1010, 1)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1010, 2)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1010, 3)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1010, 4)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1010, 5)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1010, 6)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1010, 7)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1010, 8)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1010, 9)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1010, 10)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1010, 11)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1010, 12)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1010, 13)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1010, 14)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1010, 15)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1010, 16)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1010, 17)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1010, 18)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1010, 19)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1010, 20)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1010, 21)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1010, 22)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1010, 23)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1010, 24)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1010, 25)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1010, 26)
GO
/****** Object:  Index [IX_AuditLogs_UserId]    Script Date: 9/1/2023 8:01:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_AuditLogs_UserId] ON [dbo].[AuditLogs]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookAuthors_AuthorId]    Script Date: 9/1/2023 8:01:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_BookAuthors_AuthorId] ON [dbo].[BookAuthors]
(
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Books_CategoryId]    Script Date: 9/1/2023 8:01:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_Books_CategoryId] ON [dbo].[Books]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Carts_BookId]    Script Date: 9/1/2023 8:01:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_Carts_BookId] ON [dbo].[Carts]
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Carts_UserId]    Script Date: 9/1/2023 8:01:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_Carts_UserId] ON [dbo].[Carts]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Categories_Name]    Script Date: 9/1/2023 8:01:26 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Categories_Name] ON [dbo].[Categories]
(
	[Name] ASC
)
WHERE ([Name] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderLines_BookId]    Script Date: 9/1/2023 8:01:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_OrderLines_BookId] ON [dbo].[OrderLines]
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderLines_OrderId]    Script Date: 9/1/2023 8:01:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_OrderLines_OrderId] ON [dbo].[OrderLines]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_UserId]    Script Date: 9/1/2023 8:01:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_UserId] ON [dbo].[Orders]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Email]    Script Date: 9/1/2023 8:01:26 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Email] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Username]    Script Date: 9/1/2023 8:01:26 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Username] ON [dbo].[Users]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserUseCases_UserId]    Script Date: 9/1/2023 8:01:26 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserUseCases_UserId] ON [dbo].[UserUseCases]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Books] ADD  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[AuditLogs]  WITH CHECK ADD  CONSTRAINT [FK_AuditLogs_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[AuditLogs] CHECK CONSTRAINT [FK_AuditLogs_Users_UserId]
GO
ALTER TABLE [dbo].[BookAuthors]  WITH CHECK ADD  CONSTRAINT [FK_BookAuthors_Authors_AuthorId] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Authors] ([Id])
GO
ALTER TABLE [dbo].[BookAuthors] CHECK CONSTRAINT [FK_BookAuthors_Authors_AuthorId]
GO
ALTER TABLE [dbo].[BookAuthors]  WITH CHECK ADD  CONSTRAINT [FK_BookAuthors_Books_BookId] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([Id])
GO
ALTER TABLE [dbo].[BookAuthors] CHECK CONSTRAINT [FK_BookAuthors_Books_BookId]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Books_BookId] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([Id])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Books_BookId]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Users_UserId]
GO
ALTER TABLE [dbo].[OrderLines]  WITH CHECK ADD  CONSTRAINT [FK_OrderLines_Books_BookId] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([Id])
GO
ALTER TABLE [dbo].[OrderLines] CHECK CONSTRAINT [FK_OrderLines_Books_BookId]
GO
ALTER TABLE [dbo].[OrderLines]  WITH CHECK ADD  CONSTRAINT [FK_OrderLines_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderLines] CHECK CONSTRAINT [FK_OrderLines_Orders_OrderId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users_UserId]
GO
ALTER TABLE [dbo].[UserUseCases]  WITH CHECK ADD  CONSTRAINT [FK_UserUseCases_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserUseCases] CHECK CONSTRAINT [FK_UserUseCases_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [KnjizaraCari] SET  READ_WRITE 
GO
