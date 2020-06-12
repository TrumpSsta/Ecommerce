
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 06/12/2020 17:46:11
-- Generated from EDMX file: C:\Users\Jedrzej\Documents\GitHub\Ecommerce\Ecommerce\DAL\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ecommerceDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__ShippingD__Membe__3A81B327]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ShippingDetails] DROP CONSTRAINT [FK__ShippingD__Membe__3A81B327];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Cart]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cart];
GO
IF OBJECT_ID(N'[dbo].[CartStatus]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CartStatus];
GO
IF OBJECT_ID(N'[dbo].[Category]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Category];
GO
IF OBJECT_ID(N'[dbo].[MemberRole]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MemberRole];
GO
IF OBJECT_ID(N'[dbo].[Members]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Members];
GO
IF OBJECT_ID(N'[dbo].[Roles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Roles];
GO
IF OBJECT_ID(N'[dbo].[ShippingDetails]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ShippingDetails];
GO
IF OBJECT_ID(N'[dbo].[SlideImage]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SlideImage];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Carts'
CREATE TABLE [dbo].[Carts] (
    [CartId] int IDENTITY(1,1) NOT NULL,
    [ProductId] int  NULL,
    [MemberId] int  NULL,
    [CartStatusId] int  NULL
);
GO

-- Creating table 'CartStatus'
CREATE TABLE [dbo].[CartStatus] (
    [CartStatusId] int IDENTITY(1,1) NOT NULL,
    [CartStatus] varchar(500)  NULL
);
GO

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [CategoryId] int IDENTITY(1,1) NOT NULL,
    [CategoryName] varchar(500)  NULL,
    [IsActive] bit  NULL,
    [IsDelete] bit  NULL
);
GO

-- Creating table 'MemberRoles'
CREATE TABLE [dbo].[MemberRoles] (
    [MemberRoleID] int IDENTITY(1,1) NOT NULL,
    [memberId] int  NULL,
    [RoleId] int  NULL
);
GO

-- Creating table 'Members'
CREATE TABLE [dbo].[Members] (
    [MemberId] int IDENTITY(1,1) NOT NULL,
    [FristName] varchar(200)  NULL,
    [LastName] varchar(200)  NULL,
    [EmailId] varchar(200)  NULL,
    [Password] varchar(500)  NULL,
    [IsActive] bit  NULL,
    [IsDelete] bit  NULL,
    [CreatedOn] datetime  NULL,
    [ModifiedOn] datetime  NULL
);
GO

-- Creating table 'Roles'
CREATE TABLE [dbo].[Roles] (
    [RoleId] int IDENTITY(1,1) NOT NULL,
    [RoleName] varchar(200)  NULL
);
GO

-- Creating table 'ShippingDetails'
CREATE TABLE [dbo].[ShippingDetails] (
    [ShippingDetailId] int IDENTITY(1,1) NOT NULL,
    [MemberId] int  NULL,
    [Adress] varchar(500)  NULL,
    [City] varchar(500)  NULL,
    [State] varchar(500)  NULL,
    [Country] varchar(50)  NULL,
    [ZipCode] varchar(50)  NULL,
    [OrderId] int  NULL,
    [AmountPaid] decimal(18,0)  NULL,
    [PaymentType] varchar(50)  NULL
);
GO

-- Creating table 'SlideImages'
CREATE TABLE [dbo].[SlideImages] (
    [SlideId] int IDENTITY(1,1) NOT NULL,
    [SlideTitle] varchar(500)  NULL,
    [SlideImage1] varchar(max)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [CartId] in table 'Carts'
ALTER TABLE [dbo].[Carts]
ADD CONSTRAINT [PK_Carts]
    PRIMARY KEY CLUSTERED ([CartId] ASC);
GO

-- Creating primary key on [CartStatusId] in table 'CartStatus'
ALTER TABLE [dbo].[CartStatus]
ADD CONSTRAINT [PK_CartStatus]
    PRIMARY KEY CLUSTERED ([CartStatusId] ASC);
GO

-- Creating primary key on [CategoryId] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([CategoryId] ASC);
GO

-- Creating primary key on [MemberRoleID] in table 'MemberRoles'
ALTER TABLE [dbo].[MemberRoles]
ADD CONSTRAINT [PK_MemberRoles]
    PRIMARY KEY CLUSTERED ([MemberRoleID] ASC);
GO

-- Creating primary key on [MemberId] in table 'Members'
ALTER TABLE [dbo].[Members]
ADD CONSTRAINT [PK_Members]
    PRIMARY KEY CLUSTERED ([MemberId] ASC);
GO

-- Creating primary key on [RoleId] in table 'Roles'
ALTER TABLE [dbo].[Roles]
ADD CONSTRAINT [PK_Roles]
    PRIMARY KEY CLUSTERED ([RoleId] ASC);
GO

-- Creating primary key on [ShippingDetailId] in table 'ShippingDetails'
ALTER TABLE [dbo].[ShippingDetails]
ADD CONSTRAINT [PK_ShippingDetails]
    PRIMARY KEY CLUSTERED ([ShippingDetailId] ASC);
GO

-- Creating primary key on [SlideId] in table 'SlideImages'
ALTER TABLE [dbo].[SlideImages]
ADD CONSTRAINT [PK_SlideImages]
    PRIMARY KEY CLUSTERED ([SlideId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [MemberId] in table 'ShippingDetails'
ALTER TABLE [dbo].[ShippingDetails]
ADD CONSTRAINT [FK__ShippingD__Membe__3A81B327]
    FOREIGN KEY ([MemberId])
    REFERENCES [dbo].[Members]
        ([MemberId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__ShippingD__Membe__3A81B327'
CREATE INDEX [IX_FK__ShippingD__Membe__3A81B327]
ON [dbo].[ShippingDetails]
    ([MemberId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------