USE [master]
GO
/****** Object:  Database [SimpleBookLibrary]    Script Date: 23/05/2022 00:09:09 ******/
CREATE DATABASE [SimpleBookLibrary]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SimpleBookLibrary', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\SimpleBookLibrary.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SimpleBookLibrary_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\SimpleBookLibrary_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SimpleBookLibrary] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SimpleBookLibrary].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SimpleBookLibrary] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SimpleBookLibrary] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SimpleBookLibrary] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SimpleBookLibrary] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SimpleBookLibrary] SET ARITHABORT OFF 
GO
ALTER DATABASE [SimpleBookLibrary] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SimpleBookLibrary] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SimpleBookLibrary] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SimpleBookLibrary] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SimpleBookLibrary] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SimpleBookLibrary] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SimpleBookLibrary] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SimpleBookLibrary] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SimpleBookLibrary] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SimpleBookLibrary] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SimpleBookLibrary] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SimpleBookLibrary] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SimpleBookLibrary] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SimpleBookLibrary] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SimpleBookLibrary] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SimpleBookLibrary] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SimpleBookLibrary] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SimpleBookLibrary] SET RECOVERY FULL 
GO
ALTER DATABASE [SimpleBookLibrary] SET  MULTI_USER 
GO
ALTER DATABASE [SimpleBookLibrary] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SimpleBookLibrary] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SimpleBookLibrary] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SimpleBookLibrary] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [SimpleBookLibrary]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 23/05/2022 00:09:09 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookCategories]    Script Date: 23/05/2022 00:09:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_BookCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 23/05/2022 00:09:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Author] [nvarchar](max) NULL,
	[ISBN] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 23/05/2022 00:09:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favourites]    Script Date: 23/05/2022 00:09:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favourites](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Favourites] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220520220401_InitialCreate', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220520223233_modifyCategory', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220521082318_modelredesign', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220521082649_modelredesign2', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220521085703_audittrail', N'5.0.17')
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([Id], [Title], [Author], [ISBN], [CreatedDate]) VALUES (3, N'string', N'string', 87633, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Books] ([Id], [Title], [Author], [ISBN], [CreatedDate]) VALUES (4, N'stringmodify', N'string', 9988765, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Books] ([Id], [Title], [Author], [ISBN], [CreatedDate]) VALUES (5, N'strinauditg', N'string', 772552, CAST(N'2022-05-21T09:58:51.2789924' AS DateTime2))
INSERT [dbo].[Books] ([Id], [Title], [Author], [ISBN], [CreatedDate]) VALUES (6, N'New age', N'C#', 88333, CAST(N'2022-05-23T00:00:15.8350403' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [CreatedDate]) VALUES (2, N'stringtest', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Categories] ([Id], [Name], [CreatedDate]) VALUES (3, N'stringforbes', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Categories] ([Id], [Name], [CreatedDate]) VALUES (5, N'stringmighty', CAST(N'2022-05-22T23:12:30.6724008' AS DateTime2))
INSERT [dbo].[Categories] ([Id], [Name], [CreatedDate]) VALUES (8, N'Biography', CAST(N'2022-05-22T21:31:04.9276910' AS DateTime2))
INSERT [dbo].[Categories] ([Id], [Name], [CreatedDate]) VALUES (9, N'Basement', CAST(N'2022-05-22T22:17:05.8250287' AS DateTime2))
INSERT [dbo].[Categories] ([Id], [Name], [CreatedDate]) VALUES (10, N'Peace mark', CAST(N'2022-05-22T23:12:38.8032183' AS DateTime2))
INSERT [dbo].[Categories] ([Id], [Name], [CreatedDate]) VALUES (11, N'New scope', CAST(N'2022-05-22T23:44:52.1993519' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Favourites] ON 

INSERT [dbo].[Favourites] ([Id], [BookId], [CreatedDate]) VALUES (1, 3, CAST(N'2022-05-21T10:49:34.8468601' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Favourites] OFF
GO
/****** Object:  Index [IX_BookCategories_BookId]    Script Date: 23/05/2022 00:09:14 ******/
CREATE NONCLUSTERED INDEX [IX_BookCategories_BookId] ON [dbo].[BookCategories]
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookCategories_CategoryId]    Script Date: 23/05/2022 00:09:14 ******/
CREATE NONCLUSTERED INDEX [IX_BookCategories_CategoryId] ON [dbo].[BookCategories]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Favourites_BookId]    Script Date: 23/05/2022 00:09:14 ******/
CREATE NONCLUSTERED INDEX [IX_Favourites_BookId] ON [dbo].[Favourites]
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BookCategories] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Books] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Favourites] ADD  DEFAULT ((0)) FOR [BookId]
GO
ALTER TABLE [dbo].[Favourites] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [CreatedDate]
GO
ALTER TABLE [dbo].[BookCategories]  WITH CHECK ADD  CONSTRAINT [FK_BookCategories_Books_BookId] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookCategories] CHECK CONSTRAINT [FK_BookCategories_Books_BookId]
GO
ALTER TABLE [dbo].[BookCategories]  WITH CHECK ADD  CONSTRAINT [FK_BookCategories_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookCategories] CHECK CONSTRAINT [FK_BookCategories_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Favourites]  WITH CHECK ADD  CONSTRAINT [FK_Favourites_Books_BookId] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Favourites] CHECK CONSTRAINT [FK_Favourites_Books_BookId]
GO
USE [master]
GO
ALTER DATABASE [SimpleBookLibrary] SET  READ_WRITE 
GO
