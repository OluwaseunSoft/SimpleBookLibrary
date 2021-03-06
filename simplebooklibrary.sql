USE [master]
GO
/****** Object:  Database [SimpleBookLibrary]    Script Date: 23/05/2022 14:44:06 ******/
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
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 23/05/2022 14:44:07 ******/
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
/****** Object:  Table [dbo].[BookCategories]    Script Date: 23/05/2022 14:44:07 ******/
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
/****** Object:  Table [dbo].[Books]    Script Date: 23/05/2022 14:44:07 ******/
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
/****** Object:  Table [dbo].[Categories]    Script Date: 23/05/2022 14:44:07 ******/
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
/****** Object:  Table [dbo].[Favourites]    Script Date: 23/05/2022 14:44:07 ******/
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
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220520223233_modifyCategory', N'5.0.17')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220521082318_modelredesign', N'5.0.17')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220521082649_modelredesign2', N'5.0.17')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220521085703_audittrail', N'5.0.17')
GO
SET IDENTITY_INSERT [dbo].[BookCategories] ON 
GO
INSERT [dbo].[BookCategories] ([Id], [BookId], [CategoryId], [CreatedDate]) VALUES (4, 8, 15, CAST(N'2022-05-23T14:33:48.6729541' AS DateTime2))
GO
INSERT [dbo].[BookCategories] ([Id], [BookId], [CategoryId], [CreatedDate]) VALUES (5, 8, 16, CAST(N'2022-05-23T14:35:31.2210237' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[BookCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[Books] ON 
GO
INSERT [dbo].[Books] ([Id], [Title], [Author], [ISBN], [CreatedDate]) VALUES (7, N'A Tale of Two Cities', N'Charles Dickens', 1000011, CAST(N'2022-05-23T11:16:32.9936022' AS DateTime2))
GO
INSERT [dbo].[Books] ([Id], [Title], [Author], [ISBN], [CreatedDate]) VALUES (8, N'The Little Prince', N'Antoine de Saint-Exupery', 1000012, CAST(N'2022-05-23T11:10:59.9839846' AS DateTime2))
GO
INSERT [dbo].[Books] ([Id], [Title], [Author], [ISBN], [CreatedDate]) VALUES (9, N'Harry Potter and the Philosopher''s Stone', N'J. K. Rowling', 1000013, CAST(N'2022-05-23T11:11:45.5642321' AS DateTime2))
GO
INSERT [dbo].[Books] ([Id], [Title], [Author], [ISBN], [CreatedDate]) VALUES (10, N'And Then There Were None', N'Agatha Christie', 1000014, CAST(N'2022-05-23T11:13:34.4757719' AS DateTime2))
GO
INSERT [dbo].[Books] ([Id], [Title], [Author], [ISBN], [CreatedDate]) VALUES (11, N'Dream of the Red Chamber', N'Cao Xueqin', 1000015, CAST(N'2022-05-23T11:14:28.4791653' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([Id], [Name], [CreatedDate]) VALUES (12, N'Action and Adventure', CAST(N'2022-05-23T11:22:30.0099932' AS DateTime2))
GO
INSERT [dbo].[Categories] ([Id], [Name], [CreatedDate]) VALUES (13, N'Classics', CAST(N'2022-05-23T11:21:15.9255265' AS DateTime2))
GO
INSERT [dbo].[Categories] ([Id], [Name], [CreatedDate]) VALUES (14, N'Fantasy', CAST(N'2022-05-23T11:21:44.3549005' AS DateTime2))
GO
INSERT [dbo].[Categories] ([Id], [Name], [CreatedDate]) VALUES (15, N'Horror', CAST(N'2022-05-23T11:21:51.7349656' AS DateTime2))
GO
INSERT [dbo].[Categories] ([Id], [Name], [CreatedDate]) VALUES (16, N'Detective and Mystery', CAST(N'2022-05-23T11:22:11.0408866' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Favourites] ON 
GO
INSERT [dbo].[Favourites] ([Id], [BookId], [CreatedDate]) VALUES (2, 11, CAST(N'2022-05-23T14:41:12.5814654' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Favourites] OFF
GO
/****** Object:  Index [IX_BookCategories_BookId]    Script Date: 23/05/2022 14:44:12 ******/
CREATE NONCLUSTERED INDEX [IX_BookCategories_BookId] ON [dbo].[BookCategories]
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookCategories_CategoryId]    Script Date: 23/05/2022 14:44:12 ******/
CREATE NONCLUSTERED INDEX [IX_BookCategories_CategoryId] ON [dbo].[BookCategories]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Favourites_BookId]    Script Date: 23/05/2022 14:44:12 ******/
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
