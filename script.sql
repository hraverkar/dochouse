USE [master]
GO
/****** Object:  Database [doc_house]    Script Date: 3/6/2021 6:52:29 PM ******/
CREATE DATABASE [doc_house]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'doc_house', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\doc_house.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'doc_house_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\doc_house_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [doc_house] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [doc_house].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [doc_house] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [doc_house] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [doc_house] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [doc_house] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [doc_house] SET ARITHABORT OFF 
GO
ALTER DATABASE [doc_house] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [doc_house] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [doc_house] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [doc_house] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [doc_house] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [doc_house] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [doc_house] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [doc_house] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [doc_house] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [doc_house] SET  ENABLE_BROKER 
GO
ALTER DATABASE [doc_house] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [doc_house] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [doc_house] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [doc_house] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [doc_house] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [doc_house] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [doc_house] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [doc_house] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [doc_house] SET  MULTI_USER 
GO
ALTER DATABASE [doc_house] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [doc_house] SET DB_CHAINING OFF 
GO
ALTER DATABASE [doc_house] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [doc_house] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [doc_house] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [doc_house] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [doc_house] SET QUERY_STORE = OFF
GO
USE [doc_house]
GO
/****** Object:  Table [dbo].[booking]    Script Date: 3/6/2021 6:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[booking](
	[bookingid] [uniqueidentifier] NOT NULL,
	[userid] [uniqueidentifier] NOT NULL,
	[propertyid] [uniqueidentifier] NOT NULL,
	[bookingperioddate] [date] NOT NULL,
	[bookingtime] [datetime] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK_booking] PRIMARY KEY CLUSTERED 
(
	[bookingid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[paidmoode]    Script Date: 3/6/2021 6:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paidmoode](
	[paidmodeid] [int] NOT NULL,
	[paidmodename] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_paidmoode] PRIMARY KEY CLUSTERED 
(
	[paidmodeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment]    Script Date: 3/6/2021 6:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment](
	[paymentid] [uniqueidentifier] NOT NULL,
	[transectionid] [uniqueidentifier] NOT NULL,
	[bookingid] [uniqueidentifier] NOT NULL,
	[amount] [int] NOT NULL,
	[paidvia] [nvarchar](50) NOT NULL,
	[paiddatetime] [datetime] NOT NULL,
	[paidmodeid] [int] NOT NULL,
 CONSTRAINT [PK_payment] PRIMARY KEY CLUSTERED 
(
	[paymentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[property]    Script Date: 3/6/2021 6:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[property](
	[propertyid] [uniqueidentifier] NOT NULL,
	[propertyname] [nvarchar](50) NOT NULL,
	[location] [nvarchar](50) NULL,
	[city] [nvarchar](50) NOT NULL,
	[inactive] [bit] NULL,
	[crated_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[long_lat] [nvarchar](50) NULL,
 CONSTRAINT [PK_property] PRIMARY KEY CLUSTERED 
(
	[propertyid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[propertyimage]    Script Date: 3/6/2021 6:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[propertyimage](
	[propertyimageid] [uniqueidentifier] NOT NULL,
	[propertyid] [uniqueidentifier] NOT NULL,
	[imagepath] [varchar](max) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[property_size] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_propertyimage] PRIMARY KEY CLUSTERED 
(
	[propertyimageid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test]    Script Date: 3/6/2021 6:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test](
	[Name] [nvarchar](50) NOT NULL,
	[Id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 3/6/2021 6:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[userid] [uniqueidentifier] NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[firstname] [nvarchar](50) NULL,
	[lastname] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[contact] [bigint] NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[isactive] [bit] NOT NULL,
	[usertypeid] [int] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usertype]    Script Date: 3/6/2021 6:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usertype](
	[usertypeid] [int] NOT NULL,
	[usertypename] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_usertype] PRIMARY KEY CLUSTERED 
(
	[usertypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [bookingidindex]    Script Date: 3/6/2021 6:52:29 PM ******/
CREATE NONCLUSTERED INDEX [bookingidindex] ON [dbo].[booking]
(
	[bookingid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [paidmodeidIndex]    Script Date: 3/6/2021 6:52:29 PM ******/
CREATE NONCLUSTERED INDEX [paidmodeidIndex] ON [dbo].[paidmoode]
(
	[paidmodeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [paymentidIndex]    Script Date: 3/6/2021 6:52:29 PM ******/
CREATE NONCLUSTERED INDEX [paymentidIndex] ON [dbo].[payment]
(
	[paymentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [propertyidIndex]    Script Date: 3/6/2021 6:52:29 PM ******/
CREATE NONCLUSTERED INDEX [propertyidIndex] ON [dbo].[property]
(
	[propertyid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [propertyimageidIndex]    Script Date: 3/6/2021 6:52:29 PM ******/
CREATE NONCLUSTERED INDEX [propertyimageidIndex] ON [dbo].[propertyimage]
(
	[propertyimageid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [useridIndex]    Script Date: 3/6/2021 6:52:29 PM ******/
CREATE NONCLUSTERED INDEX [useridIndex] ON [dbo].[users]
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [usertypeidIndex]    Script Date: 3/6/2021 6:52:29 PM ******/
CREATE NONCLUSTERED INDEX [usertypeidIndex] ON [dbo].[usertype]
(
	[usertypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[booking]  WITH CHECK ADD  CONSTRAINT [FK_booking_property] FOREIGN KEY([propertyid])
REFERENCES [dbo].[property] ([propertyid])
GO
ALTER TABLE [dbo].[booking] CHECK CONSTRAINT [FK_booking_property]
GO
ALTER TABLE [dbo].[payment]  WITH CHECK ADD  CONSTRAINT [FK_payment_paidmoode] FOREIGN KEY([paidmodeid])
REFERENCES [dbo].[paidmoode] ([paidmodeid])
GO
ALTER TABLE [dbo].[payment] CHECK CONSTRAINT [FK_payment_paidmoode]
GO
ALTER TABLE [dbo].[propertyimage]  WITH CHECK ADD  CONSTRAINT [FK_propertyimage_propertyimage] FOREIGN KEY([propertyid])
REFERENCES [dbo].[property] ([propertyid])
GO
ALTER TABLE [dbo].[propertyimage] CHECK CONSTRAINT [FK_propertyimage_propertyimage]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_usertype] FOREIGN KEY([usertypeid])
REFERENCES [dbo].[usertype] ([usertypeid])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_usertype]
GO
USE [master]
GO
ALTER DATABASE [doc_house] SET  READ_WRITE 
GO
