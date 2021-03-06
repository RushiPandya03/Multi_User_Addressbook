USE [master]
GO
/****** Object:  Database [MultiUserAddressBook]    Script Date: 4/21/2021 10:55:00 AM ******/
CREATE DATABASE [MultiUserAddressBook]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AddressBook', FILENAME = N'D:\MS_SQL\MultiUserAddressBook.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AddressBook_log', FILENAME = N'D:\MS_SQL\MultiUserAddressBook_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MultiUserAddressBook] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MultiUserAddressBook].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MultiUserAddressBook] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MultiUserAddressBook] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MultiUserAddressBook] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MultiUserAddressBook] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MultiUserAddressBook] SET ARITHABORT OFF 
GO
ALTER DATABASE [MultiUserAddressBook] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MultiUserAddressBook] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MultiUserAddressBook] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MultiUserAddressBook] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MultiUserAddressBook] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MultiUserAddressBook] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MultiUserAddressBook] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MultiUserAddressBook] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MultiUserAddressBook] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MultiUserAddressBook] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MultiUserAddressBook] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MultiUserAddressBook] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MultiUserAddressBook] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MultiUserAddressBook] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MultiUserAddressBook] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MultiUserAddressBook] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MultiUserAddressBook] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MultiUserAddressBook] SET RECOVERY FULL 
GO
ALTER DATABASE [MultiUserAddressBook] SET  MULTI_USER 
GO
ALTER DATABASE [MultiUserAddressBook] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MultiUserAddressBook] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MultiUserAddressBook] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MultiUserAddressBook] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MultiUserAddressBook] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MultiUserAddressBook', N'ON'
GO
ALTER DATABASE [MultiUserAddressBook] SET QUERY_STORE = OFF
GO
USE [MultiUserAddressBook]
GO
/****** Object:  Table [dbo].[BloodGroup]    Script Date: 4/21/2021 10:55:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BloodGroup](
	[BloodGroupID] [int] IDENTITY(1,1) NOT NULL,
	[BloodGroupName] [varchar](50) NOT NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_BloodGroup] PRIMARY KEY CLUSTERED 
(
	[BloodGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_BloodGroup] UNIQUE NONCLUSTERED 
(
	[BloodGroupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](100) NOT NULL,
	[PinCode] [varchar](50) NULL,
	[STDCode] [varchar](10) NULL,
	[StateID] [int] NOT NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_City] UNIQUE NONCLUSTERED 
(
	[CityName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[ContactName] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[CityID] [int] NULL,
	[StateID] [int] NULL,
	[CountryID] [int] NULL,
	[Pincode] [varchar](50) NULL,
	[MobileNo] [varchar](50) NOT NULL,
	[PhoneNo] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Gender] [varchar](50) NOT NULL,
	[BirthDate] [varchar](50) NULL,
	[BloodGroupID] [int] NULL,
	[Profession] [varchar](50) NOT NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Contact] UNIQUE NONCLUSTERED 
(
	[ContactName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactCategory]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactCategory](
	[ContactCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[ContactCategoryName] [varchar](50) NOT NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_ContactCategory] PRIMARY KEY CLUSTERED 
(
	[ContactCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_ContactCategory] UNIQUE NONCLUSTERED 
(
	[ContactCategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactWiseContactCategory]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactWiseContactCategory](
	[ContactWiseContactCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[ContactID] [int] NULL,
	[ContactCategoryID] [int] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_ContactWiseContactCategory] PRIMARY KEY CLUSTERED 
(
	[ContactWiseContactCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](50) NOT NULL,
	[CountryCode] [varchar](50) NOT NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Country] UNIQUE NONCLUSTERED 
(
	[CountryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [varchar](50) NOT NULL,
	[CountryID] [int] NOT NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_State] UNIQUE NONCLUSTERED 
(
	[StateName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[DisplayName] [varchar](50) NOT NULL,
	[Address] [varchar](50) NULL,
	[MobileNo] [varchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_User] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BloodGroup]  WITH CHECK ADD  CONSTRAINT [FK_BloodGroup_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[BloodGroup] CHECK CONSTRAINT [FK_BloodGroup_User]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_State] FOREIGN KEY([StateID])
REFERENCES [dbo].[State] ([StateID])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_State]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_User]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_BloodGroup] FOREIGN KEY([BloodGroupID])
REFERENCES [dbo].[BloodGroup] ([BloodGroupID])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_BloodGroup]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_City]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_Country]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_State] FOREIGN KEY([StateID])
REFERENCES [dbo].[State] ([StateID])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_State]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_User]
GO
ALTER TABLE [dbo].[ContactCategory]  WITH CHECK ADD  CONSTRAINT [FK_ContactCategory_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[ContactCategory] CHECK CONSTRAINT [FK_ContactCategory_User]
GO
ALTER TABLE [dbo].[ContactWiseContactCategory]  WITH CHECK ADD  CONSTRAINT [FK_ContactWiseContactCategory_Contact] FOREIGN KEY([ContactID])
REFERENCES [dbo].[Contact] ([ContactID])
GO
ALTER TABLE [dbo].[ContactWiseContactCategory] CHECK CONSTRAINT [FK_ContactWiseContactCategory_Contact]
GO
ALTER TABLE [dbo].[ContactWiseContactCategory]  WITH CHECK ADD  CONSTRAINT [FK_ContactWiseContactCategory_ContactCategory] FOREIGN KEY([ContactCategoryID])
REFERENCES [dbo].[ContactCategory] ([ContactCategoryID])
GO
ALTER TABLE [dbo].[ContactWiseContactCategory] CHECK CONSTRAINT [FK_ContactWiseContactCategory_ContactCategory]
GO
ALTER TABLE [dbo].[Country]  WITH CHECK ADD  CONSTRAINT [FK_Country_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Country] CHECK CONSTRAINT [FK_Country_User]
GO
ALTER TABLE [dbo].[State]  WITH CHECK ADD  CONSTRAINT [FK_State_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[State] CHECK CONSTRAINT [FK_State_Country]
GO
ALTER TABLE [dbo].[State]  WITH CHECK ADD  CONSTRAINT [FK_State_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[State] CHECK CONSTRAINT [FK_State_User]
GO
/****** Object:  StoredProcedure [dbo].[PR_BloodGroup_DeleteByPK]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BloodGroup_DeleteByPK]
	@BloodGroupID int
AS
DELETE
FROM [dbo].[BloodGroup]
WHERE [dbo].[BloodGroup].[BloodGroupID] = @BloodGroupID
GO
/****** Object:  StoredProcedure [dbo].[PR_BloodGroup_DeleteByPKUserID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BloodGroup_DeleteByPKUserID]
	@BloodGroupID int,
	@UserID int
AS
DELETE
FROM [dbo].[BloodGroup]
WHERE [dbo].[BloodGroup].[BloodGroupID] = @BloodGroupID
AND [dbo].[BloodGroup].[UserID] = @UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_BloodGroup_Insert]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BloodGroup_Insert]
	@BloodGroupName varchar(100)
AS
INSERT INTO [dbo].[BloodGroup]
(
	[BloodGroupName]
)
VALUES
(
	@BloodGroupName
)
GO
/****** Object:  StoredProcedure [dbo].[PR_BloodGroup_InsertByUserID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BloodGroup_InsertByUserID]
	@BloodGroupName varchar(100),
	@UserID int
AS
INSERT INTO [dbo].[BloodGroup]
(
	[BloodGroupName],
	[UserID]
)
VALUES
(
	@BloodGroupName,
	@UserID
)
GO
/****** Object:  StoredProcedure [dbo].[PR_BloodGroup_SelectAll]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BloodGroup_SelectAll]
As
Select
	[dbo].[BloodGroup].[BloodGroupID],
	[dbo].[BloodGroup].[BloodGroupName]
FROM [dbo].[BloodGroup]
ORDER BY [dbo].[BloodGroup].[BloodGroupName]
GO
/****** Object:  StoredProcedure [dbo].[PR_BloodGroup_SelectAllByUserID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BloodGroup_SelectAllByUserID]
	@UserID int
As
Select
	[dbo].[BloodGroup].[BloodGroupID],
	[dbo].[BloodGroup].[BloodGroupName]
FROM [dbo].[BloodGroup]
WHERE [dbo].[BloodGroup].[UserID] = @UserID
ORDER BY [dbo].[BloodGroup].[BloodGroupName]
GO
/****** Object:  StoredProcedure [dbo].[PR_BloodGroup_SelectByPK]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_BloodGroup_SelectByPK]
	@BloodGroupID INT
As
Select
	[dbo].[BloodGroup].[BloodGroupID],
	[dbo].[BloodGroup].[BloodGroupName]
FROM [dbo].[BloodGroup]
WHERE [dbo].[BloodGroup].[BloodGroupID] = @BloodGroupID
GO
/****** Object:  StoredProcedure [dbo].[PR_BloodGroup_SelectByPKUserID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_BloodGroup_SelectByPKUserID]
	@BloodGroupID INT,
	@UserID int
As
Select
	[dbo].[BloodGroup].[BloodGroupID],
	[dbo].[BloodGroup].[BloodGroupName]
FROM [dbo].[BloodGroup]
WHERE [dbo].[BloodGroup].[BloodGroupID] = @BloodGroupID
AND [dbo].[BloodGroup].[UserID] = @UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_BloodGroup_SelectForDropDownList]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_BloodGroup_SelectForDropDownList]
As
Select
	[dbo].[BloodGroup].[BloodGroupID],
	[dbo].[BloodGroup].[BloodGroupName]
FROM [dbo].[BloodGroup]
ORDER BY [dbo].[BloodGroup].[BloodGroupName]
GO
/****** Object:  StoredProcedure [dbo].[PR_BloodGroup_SelectForDropDownListByUserID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_BloodGroup_SelectForDropDownListByUserID]
	@UserID int
As
Select
	[dbo].[BloodGroup].[BloodGroupID],
	[dbo].[BloodGroup].[BloodGroupName]
FROM [dbo].[BloodGroup]
WHERE [dbo].[BloodGroup].[UserID] = @UserID
ORDER BY [dbo].[BloodGroup].[BloodGroupName]
GO
/****** Object:  StoredProcedure [dbo].[PR_BloodGroup_UpdateByPK]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BloodGroup_UpdateByPK]
	@BloodGroupID int,
	@BloodGroupName varchar(50)
AS
UPDATE [dbo].[BloodGroup]
SET 
	[BloodGroupName] = @BloodGroupName
WHERE [dbo].[BloodGroup].[BloodGroupID] = @BloodGroupID
GO
/****** Object:  StoredProcedure [dbo].[PR_BloodGroup_UpdateByPKUserID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BloodGroup_UpdateByPKUserID]
	@BloodGroupID int,
	@BloodGroupName varchar(50),
	@UserID int
AS
UPDATE [dbo].[BloodGroup]
SET 
	[BloodGroupName] = @BloodGroupName
WHERE [dbo].[BloodGroup].[BloodGroupID] = @BloodGroupID
AND [dbo].[BloodGroup].[UserID] = @UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_City_DeleteByPK]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_City_DeleteByPK]
	@CityID int
AS
DELETE
FROM [dbo].[City]
WHERE [dbo].[City].[CityID] = @CityID
GO
/****** Object:  StoredProcedure [dbo].[PR_City_DeleteByPKUserID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_City_DeleteByPKUserID]
	@CityID int,
	@UserID int
AS
DELETE
FROM [dbo].[City]
WHERE [dbo].[City].[CityID] = @CityID
AND [dbo].[City].[UserID] = @UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_City_Insert]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_City_Insert]
	@CityName varchar(100),
	@PinCode varchar(50),
	@STDCode varchar(10),
	@StateID int
AS
INSERT INTO [dbo].[City]
(
	[CityName],
	[PinCode],
	[STDCode],
	[StateID]
)
VALUES
(
	@CityName,
	@PinCode,
	@STDCode,
	@StateID
)
GO
/****** Object:  StoredProcedure [dbo].[PR_City_InsertByUserID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_City_InsertByUserID]
	@CityName varchar(100),
	@PinCode varchar(50),
	@STDCode varchar(10),
	@StateID int,
	@UserID int
AS
INSERT INTO [dbo].[City]
(
	[CityName],
	[PinCode],
	[STDCode],
	[StateID],
	[UserID]
)
VALUES
(
	@CityName,
	@PinCode,
	@STDCode,
	@StateID,
	@UserID
)
GO
/****** Object:  StoredProcedure [dbo].[PR_City_SelectAll]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_City_SelectAll]
As
Select
	[dbo].[City].[CityID],
	[dbo].[City].[CityName],
	[dbo].[City].[PinCode],
	[dbo].[City].[STDCode],
	[dbo].[State].[StateName]
FROM [dbo].[City]
INNER JOIN [dbo].[State]
ON
[dbo].[City].[StateID] = [dbo].[State].StateID
ORDER BY [dbo].[City].[CityName]
GO
/****** Object:  StoredProcedure [dbo].[PR_City_SelectAllByUserID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_City_SelectAllByUserID]
	@UserID int
As
Select
	[dbo].[City].[CityID],
	[dbo].[City].[CityName],
	[dbo].[City].[PinCode],
	[dbo].[City].[STDCode],
	[dbo].[State].[StateName]
FROM [dbo].[City]
INNER JOIN [dbo].[State]
ON
[dbo].[City].[StateID] = [dbo].[State].StateID
WHERE [dbo].[City].[UserID] = @UserID
ORDER BY [dbo].[City].[CityName]
GO
/****** Object:  StoredProcedure [dbo].[PR_City_SelectByPK]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_City_SelectByPK]
	@CityID INT
As
Select
	[dbo].[City].[CityID],
	[dbo].[City].[CityName],
	[dbo].[City].[PinCode],
	[dbo].[City].[STDCode],
	[dbo].[State].[StateName],
	[dbo].[State].[StateID]
FROM [dbo].[City]
INNER JOIN [dbo].[State]
ON [dbo].[City].[StateID] =[dbo].[State].[StateID]
WHERE [dbo].[City].[CityID] = @CityID
GO
/****** Object:  StoredProcedure [dbo].[PR_City_SelectByPKUserID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_City_SelectByPKUserID]
	@CityID INT,
	@UserID int
As
Select
	[dbo].[City].[CityID],
	[dbo].[City].[CityName],
	[dbo].[City].[PinCode],
	[dbo].[City].[STDCode],
	[dbo].[State].[StateName],
	[dbo].[State].[StateID]
FROM [dbo].[City]
INNER JOIN [dbo].[State]
ON [dbo].[State].[StateID] =[dbo].[City].[StateID]
WHERE [dbo].[City].[CityID] = @CityID
AND [dbo].[City].[UserID] = @UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_City_SelectForDropDownList]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_City_SelectForDropDownList]
As
Select
	[dbo].[City].[CityID],
	[dbo].[City].[CityName]
FROM [dbo].[City]
ORDER BY [dbo].[City].[CityName]
GO
/****** Object:  StoredProcedure [dbo].[PR_City_SelectForDropDownListByStateIDUserID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_City_SelectForDropDownListByStateIDUserID] 
	@StateID int,
	@UserID int
As
Select
	[dbo].[City].[CityID],
	[dbo].[City].[CityName]
FROM [dbo].[City]
WHERE [dbo].[City].[StateID] = @StateID
AND [dbo].[City].[UserID] = @UserID
ORDER BY [dbo].[City].[CityName]
GO
/****** Object:  StoredProcedure [dbo].[PR_City_SelectForDropDownListByUserID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_City_SelectForDropDownListByUserID]
	@UserID int
As
Select
	[dbo].[City].[CityID],
	[dbo].[City].[CityName]
FROM [dbo].[City]
WHERE [dbo].[City].[UserID] = @UserID
ORDER BY [dbo].[City].[CityName]
GO
/****** Object:  StoredProcedure [dbo].[PR_City_UpdateByPK]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_City_UpdateByPK]
	@CityID int,
	@CityName varchar(100),
	@PinCode varchar(50),
	@STDCode varchar(10),
	@StateID int
AS
UPDATE [dbo].[City]
SET 
	[StateID] = @StateID,
	[CityName] = @CityName,
	[PinCode] = @PinCode,
	[STDCode] = @STDCode
WHERE [dbo].[City].[CityID] = @CityID
GO
/****** Object:  StoredProcedure [dbo].[PR_City_UpdateByPKUserID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_City_UpdateByPKUserID]
	@CityID int,
	@CityName varchar(100),
	@PinCode varchar(50),
	@STDCode varchar(10),
	@StateID int,
	@UserID int
AS
UPDATE [dbo].[City]
SET 
	[StateID] = @StateID,
	[CityName] = @CityName,
	[PinCode] = @PinCode,
	[STDCode] = @STDCode
WHERE [dbo].[City].[CityID] = @CityID
AND [dbo].[City].[UserID] = @UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_Contact_DeleteByPK]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Contact_DeleteByPK]
	@ContactID int
AS
DELETE
FROM [dbo].[Contact]
WHERE [dbo].[Contact].[ContactID] = @ContactID
GO
/****** Object:  StoredProcedure [dbo].[PR_Contact_DeleteByPKUserID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Contact_DeleteByPKUserID]
	@ContactID int,
	@UserID int
AS
DELETE
FROM [dbo].[Contact]
WHERE [dbo].[Contact].[ContactID] = @ContactID
AND [dbo].[Contact].[UserID] = @UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_Contact_Insert]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_Contact_Insert]
	
	@ContactName VARCHAR(50),
	@Address VARCHAR(50),
	@CityID INT,
	@StateID INT,
	@CountryID INT,
	@MobileNo VARCHAR(50),
	@PhoneNo VARCHAR(50),
	@Email VARCHAR(50),
	@Gender VARCHAR(50),
	@BirthDate VARCHAR(50),
	@BloodGroupID INT,
	@Profession VARCHAR(50),
	@ContactCategoryID  INT

AS
INSERT INTO [dbo].[Contact]
(
	[ContactName],
	[Address],
	[CityID],
	[StateID],
	[CountryID],
	[MobileNo],
	[PhoneNo],
	[Email],
	[Gender],
	[BirthDate],
	[BloodGroupID],
	[Profession],
	[ContactCategoryID]
)
VALUES
(
	@ContactName,
	@Address,
	@CityID,
	@StateID,
	@CountryID,
	@MobileNo,
	@PhoneNo,
	@Email,
	@Gender,
	@BirthDate,
	@BloodGroupID,
	@Profession,
	@ContactCategoryID
)
GO
/****** Object:  StoredProcedure [dbo].[PR_Contact_InsertByUserID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_Contact_InsertByUserID]
	
	@ContactID int OUTPUT,
	@ContactName VARCHAR(50),
	@Address VARCHAR(50),
	@CityID INT,
	@StateID INT,
	@CountryID INT,
	@MobileNo VARCHAR(50),
	@PhoneNo VARCHAR(50),
	@Email VARCHAR(50),
	@Gender VARCHAR(50),
	@BirthDate VARCHAR(50),
	@BloodGroupID INT,
	@Profession VARCHAR(50),
	@UserID int

AS
INSERT INTO [dbo].[Contact]
(
	[ContactName],
	[Address],
	[CityID],
	[StateID],
	[CountryID],
	[MobileNo],
	[PhoneNo],
	[Email],
	[Gender],
	[BirthDate],
	[BloodGroupID],
	[Profession],
	[UserID]
)
VALUES
(
	@ContactName,
	@Address,
	@CityID,
	@StateID,
	@CountryID,
	@MobileNo,
	@PhoneNo,
	@Email,
	@Gender,
	@BirthDate,
	@BloodGroupID,
	@Profession,
	@UserID
)
SELECT @ContactID = SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[PR_Contact_SelectAll]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Contact_SelectAll]
As
Select
	[dbo].[Contact].[ContactID],
	[dbo].[Contact].[ContactName],
	[dbo].[Contact].[Address],
	[dbo].[City].[CityName],
	[dbo].[State].[StateName],
	[dbo].[Country].[CountryName],
	[dbo].[Contact].[Pincode],
	[dbo].[Contact].[MobileNo],
	[dbo].[Contact].[PhoneNo],
	[dbo].[Contact].[Email],
	[dbo].[Contact].[Gender],
	[dbo].[Contact].[BirthDate],
	[dbo].[BloodGroup].[BloodGroupName],
	[dbo].[Contact].[Profession],
	[dbo].[ContactCategory].[ContactCategoryName]
FROM [dbo].[Contact]
LEFT OUTER JOIN 
[dbo].[City]
ON [dbo].[City].[CityID] = [dbo].[Contact].[CityID]
LEFT OUTER JOIN
[dbo].[State]
ON [dbo].[State].[StateID] = [dbo].[City].[StateID] 
LEFT OUTER JOIN
[dbo].[Country]
ON [dbo].[Country].[CountryID] = [dbo].[State].[CountryID]
LEFT OUTER JOIN
[dbo].[ContactCategory]
ON [dbo].[ContactCategory].[ContactCategoryID] = [dbo].[Contact].[ContactCategoryID]
LEFT OUTER JOIN
[dbo].[BloodGroup]
ON [dbo].[BloodGroup].[BloodGroupID] = [dbo].[Contact].[BloodGroupID]
ORDER BY [dbo].[Contact].[ContactID]
GO
/****** Object:  StoredProcedure [dbo].[PR_Contact_SelectAllByUserID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Contact_SelectAllByUserID]
	@UserID int
As
Select
	[dbo].[Contact].[ContactID],
	[dbo].[Contact].[ContactName],
	[dbo].[Contact].[Address],
	[dbo].[City].[CityName],
	[dbo].[State].[StateName],
	[dbo].[Country].[CountryName],
	[dbo].[BloodGroup].[BloodGroupName],
	[dbo].[Contact].[Pincode],
	[dbo].[Contact].[MobileNo],
	[dbo].[Contact].[PhoneNo],
	[dbo].[Contact].[Email],
	[dbo].[Contact].[Gender],
	[dbo].[Contact].[BirthDate],
	[dbo].[BloodGroup].[BloodGroupName],
	[dbo].[Contact].[Profession],
	sub.ContactCategoryID
FROM [dbo].[Contact]
LEFT OUTER JOIN 
[dbo].[City]
ON [dbo].[City].[CityID] = [dbo].[Contact].[CityID]
LEFT OUTER JOIN
[dbo].[State]
ON [dbo].[State].[StateID] = [dbo].[Contact].[StateID] 
LEFT OUTER JOIN
[dbo].[Country]
ON [dbo].[Country].[CountryID] = [dbo].[Contact].[CountryID]
LEFT OUTER JOIN
[dbo].[BloodGroup]
ON [dbo].[BloodGroup].[BloodGroupID] = [dbo].[Contact].[BloodGroupID]
LEFT OUTER JOIN
(SELECT ContactID,  
ContactCategoryID=STUFF  
(  
    (  
      SELECT DISTINCT ', '+ CAST(g.ContactCategoryName AS VARCHAR(MAX))  
      FROM [dbo].[ContactCategory] g,[dbo].[ContactWiseContactCategory] e   
      WHERE g.ContactCategoryID=e.ContactCategoryID and e.ContactID=t1.ContactID   
      FOR XMl PATH('')  
    ),1,1,''  
)  
FROM [dbo].[ContactWiseContactCategory] t1
WHERE t1.UserID=@UserID
GROUP BY ContactID) sub
ON [dbo].[Contact].[ContactID] = sub.ContactID
WHERE [dbo].[Contact].[UserID] = @UserID
ORDER BY [dbo].[Contact].[ContactID]

GO
/****** Object:  StoredProcedure [dbo].[PR_Contact_SelectByPK]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Contact_SelectByPK]
	@ContactID int
As
Select
	[dbo].[Contact].[ContactID],
	[dbo].[Contact].[ContactName],
	[dbo].[Contact].[Address],
	[dbo].[City].[CityName],
	[dbo].[State].[StateName],
	[dbo].[Country].[CountryName],
	[dbo].[Contact].[Pincode],
	[dbo].[Contact].[MobileNo],
	[dbo].[Contact].[PhoneNo],
	[dbo].[Contact].[Email],
	[dbo].[Contact].[Gender],
	[dbo].[Contact].[BirthDate],
	[dbo].[BloodGroup].[BloodGroupName],
	[dbo].[Contact].[Profession],
	[dbo].[ContactCategory].[ContactCategoryName],
	[dbo].[Country].[CountryID],
	[dbo].[State].[StateID],
	[dbo].[City].[CityID],
	[dbo].[ContactCategory].[ContactCategoryID],
	[dbo].[BloodGroup].[BloodGroupID]
FROM [dbo].[Contact]
LEFT OUTER JOIN 
[dbo].[City]
ON [dbo].[City].[CityID] = [dbo].[Contact].[CityID]
LEFT OUTER JOIN 
[dbo].[State]
ON [dbo].[State].[StateID] = [dbo].[City].[StateID] 
LEFT OUTER JOIN 
[dbo].[Country]
ON [dbo].[Country].[CountryID] = [dbo].[State].[CountryID]
LEFT OUTER JOIN 
[dbo].[ContactCategory]
ON [dbo].[ContactCategory].[ContactCategoryID] = [dbo].[Contact].[ContactCategoryID]
LEFT OUTER JOIN 
[dbo].[BloodGroup]
ON [dbo].[BloodGroup].[BloodGroupID] = [dbo].[Contact].[BloodGroupID]
WHERE [dbo].[Contact].[ContactID] = @ContactID
ORDER BY [dbo].[Contact].[ContactName]
GO
/****** Object:  StoredProcedure [dbo].[PR_Contact_SelectByPKUserID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Contact_SelectByPKUserID]
	@ContactID int,
	@UserID int
As
Select
	[dbo].[Contact].[ContactID],
	[dbo].[Contact].[ContactName],
	[dbo].[Contact].[Address],
	[dbo].[Contact].[CityID],
	[dbo].[City].[CityName],
	[dbo].[Contact].[StateID],
	[dbo].[State].[StateName],
	[dbo].[Contact].[CountryID],
	[dbo].[Country].[CountryName],
	[dbo].[Contact].[BloodGroupID],
	[dbo].[BloodGroup].[BloodGroupName],
	[dbo].[Contact].[Pincode],
	[dbo].[Contact].[MobileNo],
	[dbo].[Contact].[PhoneNo],
	[dbo].[Contact].[Email],
	[dbo].[Contact].[Gender],
	[dbo].[Contact].[Profession],
	[dbo].[Contact].[BirthDate]
FROM [dbo].[Contact]
LEFT OUTER JOIN 
[dbo].[City]
ON [dbo].[City].[CityID] = [dbo].[Contact].[CityID]
LEFT OUTER JOIN 
[dbo].[State]
ON [dbo].[State].[StateID] = [dbo].[Contact].[StateID] 
LEFT OUTER JOIN 
[dbo].[Country]
ON [dbo].[Country].[CountryID] = [dbo].[Contact].[CountryID]
LEFT OUTER JOIN 
[dbo].[BloodGroup]
ON [dbo].[BloodGroup].[BloodGroupID] = [dbo].[Contact].[BloodGroupID]
WHERE [dbo].[Contact].[ContactID] = @ContactID
AND [dbo].[Contact].[UserID] = @UserID
ORDER BY [dbo].[Contact].[ContactName]
GO
/****** Object:  StoredProcedure [dbo].[PR_Contact_SelectForDropDownList]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Contact_SelectForDropDownList]
As
Select
	[dbo].[Contact].[ContactID],
	[dbo].[Contact].[ContactName]
FROM [dbo].[Contact]
ORDER BY [dbo].[Contact].[ContactName]
GO
/****** Object:  StoredProcedure [dbo].[PR_Contact_SelectForDropDownListByUserID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Contact_SelectForDropDownListByUserID]
	@UserID int
As
Select
	[dbo].[Contact].[ContactID],
	[dbo].[Contact].[ContactName]
FROM [dbo].[Contact]
WHERE [dbo].[Contact].[UserID] = @UserID
ORDER BY [dbo].[Contact].[ContactName]
GO
/****** Object:  StoredProcedure [dbo].[PR_Contact_UpdateByPK]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Contact_UpdateByPK]
	@ContactID INT,
	@ContactName VARCHAR(50),
	@Address VARCHAR(50),
	@CityID INT,
	@StateID INT,
	@CountryID INT,
	@MobileNo VARCHAR(50),
	@PhoneNo VARCHAR(50),
	@Email VARCHAR(50),
	@Gender VARCHAR(50),
	@BirthDate VARCHAR(50),
	@BloodGroupID INT,
	@Profession VARCHAR(50),
	@ContactCategoryID  INT
AS
UPDATE [dbo].[Contact]
SET 
	[ContactName]=@ContactName,
	[Address]=@Address,
	[CityID]=@CityID,
	[StateID]=@StateID,
	[CountryID]=@CountryID,
	[MobileNo]=@MobileNo,
	[PhoneNo]=@PhoneNo,
	[Email]=@Email,
	[Gender]=@Gender,
	[BirthDate]=@BirthDate,
	[BloodGroupID]=@BloodGroupID,
	[Profession]=@Profession,
	[ContactCategoryID]=@ContactCategoryID
WHERE [dbo].[Contact].[ContactID] = @ContactID
GO
/****** Object:  StoredProcedure [dbo].[PR_Contact_UpdateByPKUserID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Contact_UpdateByPKUserID]
	@ContactID INT,
	@ContactName VARCHAR(50),
	@Address VARCHAR(50),
	@CityID INT,
	@StateID INT,
	@CountryID INT,
	@MobileNo VARCHAR(50),
	@PhoneNo VARCHAR(50),
	@Email VARCHAR(50),
	@Gender VARCHAR(50),
	@BirthDate VARCHAR(50),
	@BloodGroupID INT,
	@Profession VARCHAR(50),
	@UserID int
AS
UPDATE [dbo].[Contact]
SET 
	[ContactName]=@ContactName,
	[Address]=@Address,
	[CityID]=@CityID,
	[StateID]=@StateID,
	[CountryID]=@CountryID,
	[MobileNo]=@MobileNo,
	[PhoneNo]=@PhoneNo,
	[Email]=@Email,
	[Gender]=@Gender,
	[BirthDate]=@BirthDate,
	[BloodGroupID]=@BloodGroupID,
	[Profession]=@Profession
WHERE [dbo].[Contact].[ContactID] = @ContactID
AND [dbo].[Contact].[UserID] = @UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_ContactCategory_DeleteByPK]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_ContactCategory_DeleteByPK]
	@ContactCategoryID int
AS
DELETE
FROM [dbo].[ContactCategory]
WHERE [dbo].[ContactCategory].[ContactCategoryID] = @ContactCategoryID
GO
/****** Object:  StoredProcedure [dbo].[PR_ContactCategory_DeleteByPKUserID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_ContactCategory_DeleteByPKUserID]
	@ContactCategoryID int,
	@UserID int
AS
DELETE
FROM [dbo].[ContactCategory]
WHERE [dbo].[ContactCategory].[ContactCategoryID] = @ContactCategoryID
AND [dbo].[ContactCategory].[UserID] = @UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_ContactCategory_Insert]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_ContactCategory_Insert]
	@ContactCategoryName varchar(100)
AS
INSERT INTO [dbo].[ContactCategory]
(
	[ContactCategoryName]
)
VALUES
(
	@ContactCategoryName
)
GO
/****** Object:  StoredProcedure [dbo].[PR_ContactCategory_InsertByUserID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_ContactCategory_InsertByUserID]
	@ContactCategoryName varchar(100),
	@UserID int
AS
INSERT INTO [dbo].[ContactCategory]
(
	[ContactCategoryName],
	[UserID]
)
VALUES
(
	@ContactCategoryName,
	@UserID
)
GO
/****** Object:  StoredProcedure [dbo].[PR_ContactCategory_SelectAll]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_ContactCategory_SelectAll]
As
Select
	[dbo].[ContactCategory].[ContactCategoryID],
	[dbo].[ContactCategory].[ContactCategoryName]
FROM [dbo].[ContactCategory]
ORDER BY [dbo].[ContactCategory].[ContactCategoryName]
GO
/****** Object:  StoredProcedure [dbo].[PR_ContactCategory_SelectAllByUserID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_ContactCategory_SelectAllByUserID]
	@UserID int
As
Select
	[dbo].[ContactCategory].[ContactCategoryID],
	[dbo].[ContactCategory].[ContactCategoryName]
FROM [dbo].[ContactCategory]
WHERE [dbo].[ContactCategory].[UserID] = @UserID
ORDER BY [dbo].[ContactCategory].[ContactCategoryName]
GO
/****** Object:  StoredProcedure [dbo].[PR_ContactCategory_SelectByPK]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_ContactCategory_SelectByPK]
	@ContactCategoryID INT
As
Select
	[dbo].[ContactCategory].[ContactCategoryID],
	[dbo].[ContactCategory].[ContactCategoryName]
FROM [dbo].[ContactCategory]
WHERE [dbo].[ContactCategory].[ContactCategoryID] = @ContactCategoryID
GO
/****** Object:  StoredProcedure [dbo].[PR_ContactCategory_SelectByPKUserID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_ContactCategory_SelectByPKUserID]
	@ContactCategoryID INT,
	@UserID int
As
Select
	[dbo].[ContactCategory].[ContactCategoryID],
	[dbo].[ContactCategory].[ContactCategoryName]
FROM [dbo].[ContactCategory]
WHERE [dbo].[ContactCategory].[ContactCategoryID] = @ContactCategoryID
AND [dbo].[ContactCategory].[UserID] = @UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_ContactCategory_SelectForDropDownList]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_ContactCategory_SelectForDropDownList]
As
Select
	[dbo].[ContactCategory].[ContactCategoryID],
	[dbo].[ContactCategory].[ContactCategoryName]
FROM [dbo].[ContactCategory]
ORDER BY [dbo].[ContactCategory].[ContactCategoryName]
GO
/****** Object:  StoredProcedure [dbo].[PR_ContactCategory_SelectForDropDownListByUserID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_ContactCategory_SelectForDropDownListByUserID]
	@UserID int
As
Select
	[dbo].[ContactCategory].[ContactCategoryID],
	[dbo].[ContactCategory].[ContactCategoryName]
FROM [dbo].[ContactCategory]
WHERE [dbo].[ContactCategory].[UserID] = @UserID
ORDER BY [dbo].[ContactCategory].[ContactCategoryName]
GO
/****** Object:  StoredProcedure [dbo].[PR_ContactCategory_UpdateByPK]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_ContactCategory_UpdateByPK]
	@ContactCategoryID int,
	@ContactCategoryName varchar(50)
AS
UPDATE [dbo].[ContactCategory]
SET 
	[ContactCategoryName] = @ContactCategoryName
WHERE [dbo].[ContactCategory].[ContactCategoryID] = @ContactCategoryID
GO
/****** Object:  StoredProcedure [dbo].[PR_ContactCategory_UpdateByPKUserID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_ContactCategory_UpdateByPKUserID]
	@ContactCategoryID int,
	@ContactCategoryName varchar(50),
	@UserID int
AS
UPDATE [dbo].[ContactCategory]
SET 
	[ContactCategoryName] = @ContactCategoryName
WHERE [dbo].[ContactCategory].[ContactCategoryID] = @ContactCategoryID
AND [dbo].[ContactCategory].[UserID] = @UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_ContactWiseContactCategory_DeleteByUserIDContactID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_ContactWiseContactCategory_DeleteByUserIDContactID]
	@ContactID int,
	@UserID int
AS
DELETE
FROM [dbo].[ContactWiseContactCategory]
WHERE [dbo].[ContactWiseContactCategory].[ContactID] = @ContactID
AND [dbo].[ContactWiseContactCategory].[UserID] = @UserID


GO
/****** Object:  StoredProcedure [dbo].[PR_ContactWiseContactCategory_InsertByUserIDContactIDContactCategoryID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_ContactWiseContactCategory_InsertByUserIDContactIDContactCategoryID]
	@ContactID int,
	@ContactCategoryID int,
	@UserID int
AS
INSERT INTO [dbo].[ContactWiseContactCategory]
(
	[ContactID],
	[ContactCategoryID],
	[UserID]
)
VALUES
(
	@ContactID,
	@ContactCategoryID,
	@UserID
)

GO
/****** Object:  StoredProcedure [dbo].[PR_ContactWiseContactCategory_SelectByUserIDContactID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[PR_ContactWiseContactCategory_SelectByUserIDContactID]
	@ContactID INT,
	@UserID int
As
Select
	[dbo].[ContactWiseContactCategory].[ContactID],
	[dbo].[ContactWiseContactCategory].[ContactCategoryID]
FROM [dbo].[ContactWiseContactCategory]
WHERE [dbo].[ContactWiseContactCategory].[ContactID] = @ContactID
AND [dbo].[ContactWiseContactCategory].[UserID] = @UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_DeleteByPK]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PR_Country_SelectAll
--PR_Country_SelectByPK


CREATE PROCEDURE [dbo].[PR_Country_DeleteByPK]
	@CountryID int
AS
DELETE
FROM [dbo].[Country]
WHERE [dbo].[Country].[CountryID] = @CountryID


--PR_Country_Insert
--PR_Country_UpdateByPK
--PR_Country_SelectForDropDownList
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_DeleteByPKUserID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Country_DeleteByPKUserID]
	@CountryID int,
	@UserID int
AS
DELETE
FROM [dbo].[Country]
WHERE [dbo].[Country].[CountryID] = @CountryID
AND [dbo].[Country].[UserID] = @UserID


GO
/****** Object:  StoredProcedure [dbo].[PR_Country_Insert]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Country_Insert]
	@CountryName varchar(50),
	@CountryCode varchar(50)
AS
INSERT INTO [dbo].[Country]
(
	[CountryName],
	[CountryCode]
)
VALUES
(
	@CountryName,
	@CountryCode
)
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_InsertByUserID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Country_InsertByUserID]
	@CountryName varchar(50),
	@CountryCode varchar(50),
	@UserID int
AS
INSERT INTO [dbo].[Country]
(
	[CountryName],
	[CountryCode],
	[UserID]
)
VALUES
(
	@CountryName,
	@CountryCode,
	@UserID
)
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_SelectAll]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PR_Country_SelectAll]
As
Select
	[dbo].[Country].[CountryID],
	[dbo].[Country].[CountryName],
	[dbo].[Country].[CountryCode]
FROM [dbo].[Country]
ORDER BY [dbo].[Country].[CountryName]
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_SelectAllByUserID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_Country_SelectAllByUserID]
	@UserID int
As
Select
	[dbo].[Country].[CountryID],
	[dbo].[Country].[CountryName],
	[dbo].[Country].[CountryCode]
FROM [dbo].[Country]
WHERE [dbo].[Country].[UserID] = @UserID
ORDER BY [dbo].[Country].[CountryName]
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_SelectByPK]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PR_Country_SelectByPK]
	@CountryID INT
As
Select
	[dbo].[Country].[CountryID],
	[dbo].[Country].[CountryName],
	[dbo].[Country].[CountryCode]
FROM [dbo].[Country]
WHERE [dbo].[Country].[CountryID] = @CountryID
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_SelectByPKUserID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_Country_SelectByPKUserID]
	@CountryID INT,
	@UserID int
As
Select
	[dbo].[Country].[CountryID],
	[dbo].[Country].[CountryName],
	[dbo].[Country].[CountryCode]
FROM [dbo].[Country]
WHERE [dbo].[Country].[CountryID] = @CountryID
AND [dbo].[Country].[UserID] = @UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_SelectForDropDownList]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PR_Country_SelectAll
--PR_Country_SelectByPK


--CREATE PROCEDURE [dbo].[PR_Country_DeleteByPK]
--	@CountryID int
--AS
--DELETE
--FROM [dbo].[Country]
--WHERE [dbo].[Country].[CountryID] = @CountryID


--CREATE PROCEDURE [dbo].[PR_Country_Insert]
--	@CountryName varchar(50),
--	@CountryCode varchar(50)
--AS
--INSERT INTO [dbo].[Country]
--(
--	[CountryName],
--	[CountryCode]
--)
--VALUES
--(
--	@CountryName,
--	@CountryCode
--)
	
--CREATE PROCEDURE [dbo].[PR_Country_UpdateByPK]
--	@CountryID int,
--	@CountryName varchar(50),
--	@CountryCode varchar(50)
--AS
--UPDATE [dbo].[Country]
--SET 
--	[CountryName] = @CountryName,
--	[CountryCode] = @CountryCode
--WHERE [dbo].[Country].[CountryID] = @CountryID


CREATE PROCEDURE [dbo].[PR_Country_SelectForDropDownList]
As
Select
	[dbo].[Country].[CountryID],
	[dbo].[Country].[CountryName]
FROM [dbo].[Country]
ORDER BY [dbo].[Country].[CountryName]
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_SelectForDropDownListByuserID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PR_Country_SelectAll
--PR_Country_SelectByPK


--CREATE PROCEDURE [dbo].[PR_Country_DeleteByPK]
--	@CountryID int
--AS
--DELETE
--FROM [dbo].[Country]
--WHERE [dbo].[Country].[CountryID] = @CountryID


--CREATE PROCEDURE [dbo].[PR_Country_Insert]
--	@CountryName varchar(50),
--	@CountryCode varchar(50)
--AS
--INSERT INTO [dbo].[Country]
--(
--	[CountryName],
--	[CountryCode]
--)
--VALUES
--(
--	@CountryName,
--	@CountryCode
--)
	
--CREATE PROCEDURE [dbo].[PR_Country_UpdateByPK]
--	@CountryID int,
--	@CountryName varchar(50),
--	@CountryCode varchar(50)
--AS
--UPDATE [dbo].[Country]
--SET 
--	[CountryName] = @CountryName,
--	[CountryCode] = @CountryCode
--WHERE [dbo].[Country].[CountryID] = @CountryID


CREATE PROCEDURE [dbo].[PR_Country_SelectForDropDownListByuserID]
	@UserID int
As
Select
	[dbo].[Country].[CountryID],
	[dbo].[Country].[CountryName]
FROM [dbo].[Country]
WHERE [dbo].[Country].[UserID] = @UserID
ORDER BY [dbo].[Country].[CountryName]
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_UpdateByPK]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Country_UpdateByPK]
	@CountryID int,
	@CountryName varchar(50),
	@CountryCode varchar(50)
AS
UPDATE [dbo].[Country]
SET 
	[CountryName] = @CountryName,
	[CountryCode] = @CountryCode
WHERE [dbo].[Country].[CountryID] = @CountryID
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_UpdateByPKUserID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Country_UpdateByPKUserID]
	@CountryID int,
	@CountryName varchar(50),
	@CountryCode varchar(50),
	@UserID int
AS
UPDATE [dbo].[Country]
SET 
	[CountryName] = @CountryName,
	[CountryCode] = @CountryCode
WHERE [dbo].[Country].[CountryID] = @CountryID
AND [dbo].[Country].[UserID] = @UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_State_DeleteByPK]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_DeleteByPK]
	@StateID int
AS
DELETE
FROM [dbo].[State]
WHERE [dbo].[State].[StateID] = @StateID
GO
/****** Object:  StoredProcedure [dbo].[PR_State_DeleteByPKUserID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_DeleteByPKUserID]
	@StateID int,
	@UserID int
AS
DELETE
FROM [dbo].[State]
WHERE [dbo].[State].[StateID] = @StateID
AND [dbo].[State].[UserID] = @UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_State_Insert]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_Insert]
	@StateName varchar(50),
	@CountryID int
AS
INSERT INTO [dbo].[State]
(
	[StateName],
	[CountryID]
)
VALUES
(
	@StateName,
	@CountryID
)
GO
/****** Object:  StoredProcedure [dbo].[PR_State_InsertByUserID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_InsertByUserID]
	@StateName varchar(50),
	@CountryID int,
	@UserID int
AS
INSERT INTO [dbo].[State]
(
	[StateName],
	[CountryID],
	[UserID]
)
VALUES
(
	@StateName,
	@CountryID,
	@UserID
)
GO
/****** Object:  StoredProcedure [dbo].[PR_State_SelectAll]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_SelectAll]
As
Select
	[dbo].[State].[StateID],
	[dbo].[State].[StateName],
	[dbo].[Country].[CountryName]
FROM [dbo].[State]
left outer JOIN [dbo].[Country]
ON
[dbo].[State].[CountryID] = [dbo].[Country].[CountryID]
ORDER BY [dbo].[State].[StateName]
GO
/****** Object:  StoredProcedure [dbo].[PR_State_SelectAllByUserID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_SelectAllByUserID]
	@UserID int
As
Select
	[dbo].[State].[StateID],
	[dbo].[State].[StateName],
	[dbo].[Country].[CountryName]
FROM [dbo].[State]
left outer JOIN [dbo].[Country]
ON
[dbo].[State].[CountryID] = [dbo].[Country].[CountryID]
WHERE [dbo].[State].[UserID] = @UserID
ORDER BY [dbo].[State].[StateName]
GO
/****** Object:  StoredProcedure [dbo].[PR_State_SelectByPK]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_State_SelectByPK]
	@StateID INT
As
Select
	[dbo].[State].[StateID],
	[dbo].[State].[StateName],
	[dbo].[Country].[CountryName],
	[dbo].[Country].[CountryID]
FROM [dbo].[State]
left outer JOIN [dbo].[Country]
ON
[dbo].[State].[CountryID] = [dbo].[Country].[CountryID]
WHERE [dbo].[State].[StateID] = @StateID
GO
/****** Object:  StoredProcedure [dbo].[PR_State_SelectByPKUserID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_State_SelectByPKUserID]
	@StateID INT,
	@UserID int
As
Select
	[dbo].[State].[StateID],
	[dbo].[State].[StateName],
	[dbo].[Country].[CountryName],
	[dbo].[Country].[CountryID]
FROM [dbo].[State]
left outer JOIN [dbo].[Country]
ON
[dbo].[State].[CountryID] = [dbo].[Country].[CountryID]
WHERE [dbo].[State].[StateID] = @StateID
AND [dbo].[State].[UserID] = @UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_State_SelectForDropDownList]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_SelectForDropDownList]
As
Select
	[dbo].[State].[StateID],
	[dbo].[State].[StateName]
FROM [dbo].[State]
ORDER BY [dbo].[State].[StateName]
GO
/****** Object:  StoredProcedure [dbo].[PR_State_SelectForDropDownListByCountryID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_SelectForDropDownListByCountryID]
	@CountryID int
As
Select
	[dbo].[State].[StateID],
	[dbo].[State].[StateName]
FROM [dbo].[State]
WHERE [dbo].[State].[CountryID] = @CountryID
ORDER BY [dbo].[State].[StateName]
GO
/****** Object:  StoredProcedure [dbo].[PR_State_SelectForDropDownListByCountryIDUserID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_SelectForDropDownListByCountryIDUserID] 
	@CountryID int,
	@UserID int
As
Select
	[dbo].[State].[StateID],
	[dbo].[State].[StateName]
FROM [dbo].[State]
WHERE [dbo].[State].[CountryID] = @CountryID
AND [dbo].[State].[CountryID] = @UserID
ORDER BY [dbo].[State].[StateName]
GO
/****** Object:  StoredProcedure [dbo].[PR_State_SelectForDropDownListByUserID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_SelectForDropDownListByUserID]
	@UserID int
As
Select
	[dbo].[State].[StateID],
	[dbo].[State].[StateName]
FROM [dbo].[State]
WHERE [dbo].[State].[UserID] = @UserID
ORDER BY [dbo].[State].[StateName]
GO
/****** Object:  StoredProcedure [dbo].[PR_State_UpdateByPK]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_UpdateByPK]
	@StateID int,
	@StateName varchar(50),
	@CountryID int
AS
UPDATE [dbo].[State]
SET 
	[StateName] = @StateName,
	[CountryID] = @CountryID
WHERE [dbo].[State].[StateID] = @StateID
GO
/****** Object:  StoredProcedure [dbo].[PR_State_UpdateByPKUserID]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_UpdateByPKUserID]
	@StateID int,
	@StateName varchar(50),
	@CountryID int,
	@UserID int
AS
UPDATE [dbo].[State]
SET 
	[StateName] = @StateName,
	[CountryID] = @CountryID
WHERE [dbo].[State].[StateID] = @StateID
AND [dbo].[State].[UserID] = @UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_User_Insert]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_User_Insert]
	@UserName varchar(50),
	@Password varchar(50),
	@DisplayName varchar(50),
	@Address varchar(50),
	@MobileNo varchar(50)
AS
INSERT INTO [dbo].[User]
(
	[UserName],
	[Password],
	[DisplayName],
	[Address],
	[MobileNo]
)
VALUES
(
	@UserName,
	@Password,
	@DisplayName,
	@Address,
	@MobileNo
)
GO
/****** Object:  StoredProcedure [dbo].[PR_User_SelectByUserNamePassword]    Script Date: 4/21/2021 10:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_User_SelectByUserNamePassword]
	@UserName varchar(50),
	@Password varchar(50)
AS

SELECT 
		[UserID],
		[UserName],
		[Password],
		[DisplayName],
		[MobileNo]
FROM	[dbo].[User]
WHERE	[UserName] = @UserName
AND		[Password] = @Password

--exec PR_User_SelectByUserNamePassword @UserName="rishit", @Password="rishit"
GO
USE [master]
GO
ALTER DATABASE [MultiUserAddressBook] SET  READ_WRITE 
GO
