USE [master]
GO
/****** Object:  Database [MB]    Script Date: 25.01.2018 00:35:54 ******/
CREATE DATABASE [MB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MB] SET  MULTI_USER 
GO
ALTER DATABASE [MB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MB] SET QUERY_STORE = OFF
GO
USE [MB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [MB]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 25.01.2018 00:35:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) NULL,
	[family_id] [int] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 25.01.2018 00:35:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) NULL,
	[catid] [int] NOT NULL,
	[imageurl] [text] NULL,
	[price] [float] NULL,
	[isactive] [bit] NULL,
	[description] [text] NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([id], [name], [family_id]) VALUES (1, N'Bıçaklar', 6)
GO
INSERT [dbo].[Category] ([id], [name], [family_id]) VALUES (2, N'Tabancalar', 6)
GO
INSERT [dbo].[Category] ([id], [name], [family_id]) VALUES (3, N'Hafif Makinalı Tüfekler', 6)
GO
INSERT [dbo].[Category] ([id], [name], [family_id]) VALUES (4, N'Keskin Nişancı Tüfeği', 6)
GO
INSERT [dbo].[Category] ([id], [name], [family_id]) VALUES (5, N'Saldırı Tüfekleri', 6)
GO
INSERT [dbo].[Category] ([id], [name], [family_id]) VALUES (6, N'Teçhizat', NULL)
GO
INSERT [dbo].[Category] ([id], [name], [family_id]) VALUES (7, N'Otomatik Saldırı Tüfekleri', 5)
GO
INSERT [dbo].[Category] ([id], [name], [family_id]) VALUES (8, N'Burst Saldırı Tüfekleri', 5)
GO
INSERT [dbo].[Category] ([id], [name], [family_id]) VALUES (9, N'Otomatik Keskin Nişancı Tüfeği', 4)
GO
INSERT [dbo].[Category] ([id], [name], [family_id]) VALUES (10, N'test1', 4)
GO
INSERT [dbo].[Category] ([id], [name], [family_id]) VALUES (2010, N'test2', 10)
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Items] ON 
GO
INSERT [dbo].[Items] ([id], [name], [catid], [imageurl], [price], [isactive], [description]) VALUES (1, N'Dikiş Tutmaz', 1, N'Lorem ipsum', 100, 1, N'Lorem ipsum')
GO
INSERT [dbo].[Items] ([id], [name], [catid], [imageurl], [price], [isactive], [description]) VALUES (2, N'Gölge', 1, N'Lorem ipsum', 150, 1, N'Lorem ipsum')
GO
INSERT [dbo].[Items] ([id], [name], [catid], [imageurl], [price], [isactive], [description]) VALUES (3, N'Glock18', 2, N'Lorem ipsum', 300, 1, N'Lorem ipsum')
GO
INSERT [dbo].[Items] ([id], [name], [catid], [imageurl], [price], [isactive], [description]) VALUES (4, N'Desert Eagle', 2, N'Lorem ipsum', 500, 1, N'Lorem ipsum')
GO
INSERT [dbo].[Items] ([id], [name], [catid], [imageurl], [price], [isactive], [description]) VALUES (5, N'P90', 3, N'Lorem ipsum', 1500, 1, N'Lorem ipsum')
GO
INSERT [dbo].[Items] ([id], [name], [catid], [imageurl], [price], [isactive], [description]) VALUES (6, N'Vector', 3, N'Lorem ipsum', 1100, 1, N'Lorem ipsum')
GO
INSERT [dbo].[Items] ([id], [name], [catid], [imageurl], [price], [isactive], [description]) VALUES (7, N'AWP', 9, N'Lorem ipsum', 4500, 1, N'Lorem ipsum')
GO
INSERT [dbo].[Items] ([id], [name], [catid], [imageurl], [price], [isactive], [description]) VALUES (8, N'Bora 12', 9, N'Lorem ipsum', 4000, 1, N'Lorem ipsumus')
GO
INSERT [dbo].[Items] ([id], [name], [catid], [imageurl], [price], [isactive], [description]) VALUES (9, N'M468', 7, N'Lorem ipsum', 3250, 1, N'Lorem ipsum')
GO
INSERT [dbo].[Items] ([id], [name], [catid], [imageurl], [price], [isactive], [description]) VALUES (10, N'Famas', 8, N'Lorem ipsum', 2850, 1, N'Lorem ipsum')
GO
INSERT [dbo].[Items] ([id], [name], [catid], [imageurl], [price], [isactive], [description]) VALUES (14, N'test2', 2010, N'as', 111, 1, N'sa')
GO
INSERT [dbo].[Items] ([id], [name], [catid], [imageurl], [price], [isactive], [description]) VALUES (15, N'test5', 2010, N'bos', 3000, 0, N'test')
GO
INSERT [dbo].[Items] ([id], [name], [catid], [imageurl], [price], [isactive], [description]) VALUES (1015, N'BurTuf', 8, N'test', 1000, 1, N'test')
GO
INSERT [dbo].[Items] ([id], [name], [catid], [imageurl], [price], [isactive], [description]) VALUES (1016, N'testms', 8, N'qweqwe', 1444, 0, N'qeqwe')
GO
INSERT [dbo].[Items] ([id], [name], [catid], [imageurl], [price], [isactive], [description]) VALUES (1017, N'tet2', 2, N'asd', 12121, 0, N'ss')
GO
INSERT [dbo].[Items] ([id], [name], [catid], [imageurl], [price], [isactive], [description]) VALUES (1018, N'qweq', 3, N'qrwrqwr', 412412, 1, N'qwrqr')
GO
INSERT [dbo].[Items] ([id], [name], [catid], [imageurl], [price], [isactive], [description]) VALUES (1019, N'cbzbgasdg', 7, N'eryrtyrty', 674674, 0, N'nvbncncv')
GO
SET IDENTITY_INSERT [dbo].[Items] OFF
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Category] FOREIGN KEY([catid])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Category]
GO
/****** Object:  StoredProcedure [dbo].[Categories]    Script Date: 25.01.2018 00:35:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Categories]
@grade int
AS   
WITH CategoryR (family_id ,id, name, grade)
AS
(
    SELECT i.family_id,i.id, i.name,
        0 AS Grade
    FROM dbo.Category AS i
	WHERE i.family_id IS NULL
    UNION ALL

    SELECT i.family_id,i.id, i.name, 
        Grade + 1
    FROM dbo.Category AS i
    INNER JOIN CategoryR AS ig
        ON i.family_id = ig.id
)

SELECT  id, name, grade
FROM CategoryR
Where family_id = @grade
GO
/****** Object:  StoredProcedure [dbo].[CategoriesChild]    Script Date: 25.01.2018 00:35:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CategoriesChild] 

AS
BEGIN
with cteRecurs(AncestorId,Id,name,ParentId)
as
(
    Select id,id,name,family_id
      from Category
    union all
    Select cteRecurs.AncestorId,cat.id,cat.name,cat.family_id
      from cteRecurs,
           Category cat
     where cat.family_id= cteRecurs.Id
)

select Id, name from cteRecurs
Where AncestorId in
(select cteRecurs.AncestorId From cteRecurs
group by AncestorId
having COUNT(*)-1 = 0)

END
GO
/****** Object:  StoredProcedure [dbo].[ItemsWithCategories]    Script Date: 25.01.2018 00:35:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ItemsWithCategories]  
AS   
select Items.id, Category.Name as categoryname, Items.name, Items.imageurl, Items.isactive,Items.description,Items.price From Items
Inner join Category on Items.catid = Category.id
GO
USE [master]
GO
ALTER DATABASE [MB] SET  READ_WRITE 
GO
