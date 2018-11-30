USE [master]
GO
/****** Object:  Database [4T]    Script Date: 10/17/2018 13:50:54 ******/
CREATE DATABASE [4T] 
ALTER DATABASE [4T] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [4T].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [4T] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [4T] SET ANSI_NULLS OFF
GO
ALTER DATABASE [4T] SET ANSI_PADDING OFF
GO
ALTER DATABASE [4T] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [4T] SET ARITHABORT OFF
GO
ALTER DATABASE [4T] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [4T] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [4T] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [4T] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [4T] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [4T] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [4T] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [4T] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [4T] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [4T] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [4T] SET  DISABLE_BROKER
GO
ALTER DATABASE [4T] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [4T] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [4T] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [4T] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [4T] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [4T] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [4T] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [4T] SET  READ_WRITE
GO
ALTER DATABASE [4T] SET RECOVERY SIMPLE
GO
ALTER DATABASE [4T] SET  MULTI_USER
GO
ALTER DATABASE [4T] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [4T] SET DB_CHAINING OFF
GO
USE [4T]
GO
/****** Object:  Table [dbo].[ACCOUNT]    Script Date: 10/17/2018 13:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ACCOUNT](
	[ID] bigint identity(1,1) NOT NULL,
	[DISPLAYEDNAME] [nvarchar](50) NULL,
	[USERNAME] [nvarchar](50)NOT NULL,
	[PASSWORD] [nvarchar](50)NOT NULL,
	[EMAIL] [nvarchar](50)NOT NULL,
	[DATECREATE] datetime default getdate() NULL,
	[ROLE] int NOT NULL,
	[ISAUTO] char(3) NULL,
	[ISBAN] char(3) NULL
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GROUPACC]    Script Date: 10/17/2018 13:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GROUPACC](
	[ID] bigint identity(1,1) NOT NULL,
	[NAME] [nvarchar](50) NULL,
	[DESCRIBE] [nvarchar](100) NULL,
	[DATECREATE] datetime default getdate() NULL,
	[IDOWNER] bigint NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FOLLOWS]    Script Date: 10/17/2018 13:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FOLLOWS](
	[ID_ACC] bigint NOT NULL,
	[ID_FOLLOWS] bigint NOT NULL,
	[TYPE_CMT] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_ACC] ASC,
	[ID_FOLLOWS] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[COMMENT]    Script Date: 10/17/2018 13:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[COMMENT](
	[ID] bigint identity(1,1) NOT NULL,
	[ID_OWNER] bigint NULL,
	[CONTENT] nvarchar NULL,
	[CREATETIME] datetime default getdate() NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MESS]    Script Date: 10/17/2018 13:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MESS](
	[ID] bigint identity(1,1) NOT NULL,
	[CONTENT] text NULL,
	[TIME_MESS] datetime default getdate() NULL,
	[URL] [nvarchar](200) NULL,
	[TYPE_MESS] [nvarchar](20) NULL,
	[FROM_ID] bigint NULL,
	[TO_ID] bigint NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LN]    Script Date: 10/17/2018 13:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LN](
	[ID] bigint identity(1,1) NOT NULL,
	[NAME] [nvarchar](50) NULL,
	[DESCRIBE] ntext NULL,
	[DATEUP] datetime default getdate() NULL,
	[IDOWNER] bigint NULL,
	[KIND] varchar(20) NULL,
	[STATUS] int NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IMAGE]    Script Date: 10/17/2018 13:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IMAGE](
	[ID] bigint identity(1,1) not null,
	[IDOWNER] bigint null,
	[TYPE] varchar(20) null,
	[IMG] image NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GENRE]    Script Date: 10/17/2018 13:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GENRE](
	[IDNOVEL] bigint NOT NULL,
	[VALUE] int NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDNOVEL] ASC,
	[VALUE] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BMFOLDER]    Script Date: 10/17/2018 13:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BMFOLDER](
	[ID] bigint identity(1,1) NOT NULL,
	[ID_ACC] bigint NULL,
	[TITLE] [nvarchar](100) NULL,
	[ISPARENT] [char](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[THREAD]    Script Date: 10/17/2018 13:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[THREAD](
	[ID] bigint identity(1,1) NOT NULL,
	[TITLE] nvarchar NULL,
	[CONTENT] nvarchar NULL,
	[ID_OWNER] bigint NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BLACKLIST]    Script Date: 10/17/2018 13:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BLACKLIST](
	[ID_SRC] bigint NOT NULL,
	[ID_TARGET_ACC] bigint NOT NULL,
	[TYPE_BLACKLIST] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_SRC] ASC,
	[ID_TARGET_ACC] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VOL]    Script Date: 10/17/2018 13:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VOL](
	[ID] bigint identity(1,1) NOT NULL,
	[ID_LN] bigint NULL,
	[TITLE] [nvarchar](50) NOT NULL,
	[DESCRIBE] ntext NULL,
	[DATEUP] datetime default getdate() NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PUBLISH_COMMENT]    Script Date: 10/17/2018 13:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PUBLISH_COMMENT](
	[ID_CMT]bigint NOT NULL,
	[ID_PUBLISH]bigint NOT NULL,
	[TYPE_CMT] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_CMT] ASC,
	[ID_PUBLISH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BM]    Script Date: 10/17/2018 13:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BM](
	[ID] bigint identity(1,1) NOT NULL,
	[ID_BMFOLDER]bigint NULL,
	[URL] text NULL,
	[TIME_BM] datetime default getdate() NULL,
	[TITLE] nvarchar NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JOININ]    Script Date: 10/17/2018 13:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JOININ](
	[ID_ACC] bigint NOT NULL,
	[ID_GROUP] bigint NOT NULL,
	[DATEJOIN] datetime default getdate() NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_ACC] ASC,
	[ID_GROUP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CHAP]    Script Date: 10/17/2018 13:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CHAP](
	[ID] bigint identity(1,1) NOT NULL,
	[ID_VOL] bigint NULL,
	[CONTENT] ntext NULL,
	[DATEUP] datetime default getdate() NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Check [CK__ACCOUNT__ISAUTO__014935CB]    Script Date: 10/17/2018 13:50:56 ******/
ALTER TABLE [dbo].[ACCOUNT]  WITH CHECK ADD CHECK  (([ISAUTO]='NO' OR [ISAUTO]='YES'))
GO
/****** Object:  Check [CK__ACCOUNT__ISBAN__023D5A04]    Script Date: 10/17/2018 13:50:56 ******/
ALTER TABLE [dbo].[ACCOUNT]  WITH CHECK ADD CHECK  (([ISBAN]='NO' OR [ISBAN]='YES'))
GO
/****** Object:  Check [CK__BMFOLDER__ISPARE__34C8D9D1]    Script Date: 10/17/2018 13:50:56 ******/
ALTER TABLE [dbo].[BMFOLDER]  WITH CHECK ADD CHECK  (([ISPARENT]='NO' OR [ISPARENT]='YES'))
GO
/****** Object:  ForeignKey [FK__GROUPACC__IDOWNE__07020F21]    Script Date: 10/17/2018 13:50:56 ******/
ALTER TABLE [dbo].[GROUPACC]  WITH CHECK ADD FOREIGN KEY([IDOWNER])
REFERENCES [dbo].[ACCOUNT] ([ID])
GO
/****** Object:  ForeignKey [FK__FOLLOWS__ID_ACC__25518C17]    Script Date: 10/17/2018 13:50:56 ******/
ALTER TABLE [dbo].[FOLLOWS]  WITH CHECK ADD FOREIGN KEY([ID_ACC])
REFERENCES [dbo].[ACCOUNT] ([ID])
GO
/****** Object:  ForeignKey [FK__COMMENT__ID_OWNE__4E88ABD4]    Script Date: 10/17/2018 13:50:56 ******/
ALTER TABLE [dbo].[COMMENT]  WITH CHECK ADD FOREIGN KEY([ID_OWNER])
REFERENCES [dbo].[ACCOUNT] ([ID])
GO
/****** Object:  ForeignKey [FK__MESS__FROM_ID__5FB337D6]    Script Date: 10/17/2018 13:50:56 ******/
ALTER TABLE [dbo].[MESS]  WITH CHECK ADD FOREIGN KEY([FROM_ID])
REFERENCES [dbo].[ACCOUNT] ([ID])
GO
/****** Object:  ForeignKey [FK__MESS__TO_ID__60A75C0F]    Script Date: 10/17/2018 13:50:56 ******/
ALTER TABLE [dbo].[MESS]  WITH CHECK ADD FOREIGN KEY([TO_ID])
REFERENCES [dbo].[ACCOUNT] ([ID])
GO
/****** Object:  ForeignKey [FK__LN__IDOWNER__24927208]    Script Date: 10/17/2018 13:50:56 ******/
ALTER TABLE [dbo].[LN]  WITH CHECK ADD FOREIGN KEY([IDOWNER])
REFERENCES [dbo].[ACCOUNT] ([ID])
GO
/****** Object:  ForeignKey [FK__BMFOLDER__ID_ACC__33D4B598]    Script Date: 10/17/2018 13:50:56 ******/
ALTER TABLE [dbo].[BMFOLDER]  WITH CHECK ADD FOREIGN KEY([ID_ACC])
REFERENCES [dbo].[ACCOUNT] ([ID])
GO
/****** Object:  ForeignKey [FK__THREAD__ID_OWNER__47DBAE45]    Script Date: 10/17/2018 13:50:56 ******/
ALTER TABLE [dbo].[THREAD]  WITH CHECK ADD FOREIGN KEY([ID_OWNER])
REFERENCES [dbo].[ACCOUNT] ([ID])
GO
/****** Object:  ForeignKey [FK__BLACKLIST__ID_TA__2A164134]    Script Date: 10/17/2018 13:50:56 ******/
ALTER TABLE [dbo].[BLACKLIST]  WITH CHECK ADD FOREIGN KEY([ID_TARGET_ACC])
REFERENCES [dbo].[ACCOUNT] ([ID])
GO
/****** Object:  ForeignKey [FK__VOL__ID_LN__3E52440B]    Script Date: 10/17/2018 13:50:56 ******/
ALTER TABLE [dbo].[VOL]  WITH CHECK ADD FOREIGN KEY([ID_LN])
REFERENCES [dbo].[LN] ([ID])
GO
/****** Object:  ForeignKey [FK__VOL__ID_GENRE__3E52asdzx]    Script Date: 10/17/2018 13:50:56 ******/
ALTER TABLE [dbo].[GENRE]  WITH CHECK ADD FOREIGN KEY([IDNOVEL])
REFERENCES [dbo].[LN] ([ID])
GO
/****** Object:  ForeignKey [FK__PUBLISH_C__ID_CM__208CD6FA]    Script Date: 10/17/2018 13:50:56 ******/
ALTER TABLE [dbo].[PUBLISH_COMMENT]  WITH CHECK ADD FOREIGN KEY([ID_CMT])
REFERENCES [dbo].[COMMENT] ([ID])
GO
/****** Object:  ForeignKey [FK__BM__ID_BMFOLDER__398D8EEE]    Script Date: 10/17/2018 13:50:56 ******/
ALTER TABLE [dbo].[BM]  WITH CHECK ADD FOREIGN KEY([ID_BMFOLDER])
REFERENCES [dbo].[BMFOLDER] ([ID])
GO
/****** Object:  ForeignKey [FK__JOININ__ID_ACC__2EDAF651]    Script Date: 10/17/2018 13:50:56 ******/
ALTER TABLE [dbo].[JOININ]  WITH CHECK ADD FOREIGN KEY([ID_ACC])
REFERENCES [dbo].[ACCOUNT] ([ID])
GO
/****** Object:  ForeignKey [FK__JOININ__ID_GROUP__2FCF1A8A]    Script Date: 10/17/2018 13:50:56 ******/
ALTER TABLE [dbo].[JOININ]  WITH CHECK ADD FOREIGN KEY([ID_GROUP])
REFERENCES [dbo].[GROUPACC] ([ID])
GO
/****** Object:  ForeignKey [FK__CHAP__ID_VOL__3493CFA7]    Script Date: 10/17/2018 13:50:56 ******/
ALTER TABLE [dbo].[CHAP]  WITH CHECK ADD FOREIGN KEY([ID_VOL])
REFERENCES [dbo].[VOL] ([ID])
GO