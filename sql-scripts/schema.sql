
/****** Object:  Database [4T]    Script Date: 1/1/2019 5:30:30 PM ******/
CREATE DATABASE [4T]
GO
USE [4T]
GO
/****** Object:  Table [dbo].[ACCOUNT]    Script Date: 1/1/2019 5:30:30 PM ******/
CREATE TABLE [dbo].[ACCOUNT](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DISPLAYEDNAME] [nvarchar](50) NULL,
	[USERNAME] [nvarchar](50) NOT NULL,
	[PASSWORD] [nvarchar](50) NOT NULL,
	[EMAIL] [nvarchar](50) NOT NULL,
	[DATECREATE] [datetime] NULL,
	[ROLE] [int] NOT NULL,
	[ISAUTO] [char](3) NULL,
	[ISPIN] [char](3) NULL,
	[ISBAN] [char](3) NULL,
 CONSTRAINT [PK__ACCOUNT__3214EC2729F74017] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BLACKLIST]    Script Date: 1/1/2019 5:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BLACKLIST](
	[ID_SRC] [bigint] NOT NULL,
	[ID_TARGET_ACC] [bigint] NOT NULL,
	[TYPE_BLACKLIST] [char](10) NULL,
 CONSTRAINT [PK__BLACKLIS__AFB6C98A92ED4020] PRIMARY KEY CLUSTERED 
(
	[ID_SRC] ASC,
	[ID_TARGET_ACC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BM]    Script Date: 1/1/2019 5:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BM](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_BMFOLDER] [bigint] NULL,
	[URL] [text] NULL,
	[TIME_BM] [datetime] NULL,
	[TITLE] [ntext] NULL,
	[DETAIL] [ntext] NULL,
 CONSTRAINT [PK__BM__3214EC2757458835] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BMFOLDER]    Script Date: 1/1/2019 5:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BMFOLDER](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_ACC] [bigint] NULL,
	[TITLE] [ntext] NULL,
	[ISPARENT] [char](3) NULL,
 CONSTRAINT [PK__BMFOLDER__3214EC27D5356D11] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CENSORING]    Script Date: 1/1/2019 5:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CENSORING](
	[TARGET_ID] [bigint] NOT NULL,
	[OWNER_ID] [bigint] NOT NULL,
	[STREAM] [nchar](10) NOT NULL,
	[CAME_DATE] [datetime] NULL,
	[OUT_DATE] [datetime] NULL,
	[IS_PUBLISHED] [bit] NULL,
 CONSTRAINT [PK_CENSORING] PRIMARY KEY CLUSTERED 
(
	[TARGET_ID] ASC,
	[OWNER_ID] ASC,
	[STREAM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHAP]    Script Date: 1/1/2019 5:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHAP](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_VOL] [bigint] NULL,
	[ID_NOVEL] [bigint] NULL,
	[TITLE] [ntext] NULL,
	[CONTENT] [ntext] NULL,
	[DATEUP] [datetime] NULL,
 CONSTRAINT [PK__CHAP__3214EC277615F5BB] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COMMENT]    Script Date: 1/1/2019 5:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMMENT](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_OWNER] [bigint] NULL,
	[CONTENT] [ntext] NULL,
	[CREATETIME] [datetime] NULL,
 CONSTRAINT [PK__COMMENT__3214EC274D836E7F] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FOLLOW]    Script Date: 1/1/2019 5:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FOLLOW](
	[TARGET_ID] [bigint] NOT NULL,
	[HOST_ID] [bigint] NOT NULL,
	[STREAM] [nvarchar](10) NOT NULL,
	[DATEUP] [datetime] NULL,
 CONSTRAINT [PK_FOLLOW] PRIMARY KEY CLUSTERED 
(
	[TARGET_ID] ASC,
	[HOST_ID] ASC,
	[STREAM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GENRE]    Script Date: 1/1/2019 5:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GENRE](
	[IDNOVEL] [bigint] NOT NULL,
	[VALUE] [int] NOT NULL,
 CONSTRAINT [PK__GENRE__D3D6873D08497A93] PRIMARY KEY CLUSTERED 
(
	[IDNOVEL] ASC,
	[VALUE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GROUPACC]    Script Date: 1/1/2019 5:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GROUPACC](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](50) NULL,
	[DESCRIBE] [nvarchar](100) NULL,
	[DATECREATE] [datetime] NULL,
	[IDOWNER] [bigint] NULL,
 CONSTRAINT [PK__GROUPACC__3214EC27D59E9054] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IMAGE]    Script Date: 1/1/2019 5:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IMAGE](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[IDOWNER] [bigint] NULL,
	[TYPE] [varchar](20) NULL,
	[IMG] [image] NULL,
 CONSTRAINT [PK__IMAGE__3214EC27F22C8A9B] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IMAGES]    Script Date: 1/1/2019 5:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IMAGES](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DATA] [image] NOT NULL,
	[DATEUP] [datetime] NOT NULL,
	[ETAG] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[INBOX]    Script Date: 1/1/2019 5:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INBOX](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ACCID] [bigint] NOT NULL,
	[MESSAGE] [ntext] NOT NULL,
	[DATE] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JOININ]    Script Date: 1/1/2019 5:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JOININ](
	[ID_ACC] [bigint] NOT NULL,
	[ID_GROUP] [bigint] NOT NULL,
	[DATEJOIN] [datetime] NULL,
 CONSTRAINT [PK__JOININ__F29D0FE0938126FC] PRIMARY KEY CLUSTERED 
(
	[ID_ACC] ASC,
	[ID_GROUP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LIKING]    Script Date: 1/1/2019 5:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LIKING](
	[ACC_ID] [bigint] NOT NULL,
	[TARGET_ID] [bigint] NOT NULL,
	[STREAM] [varchar](10) NOT NULL,
	[DATEUP] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LN]    Script Date: 1/1/2019 5:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LN](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[NAME] [ntext] NULL,
	[DESCRIBE] [ntext] NULL,
	[DATEUP] [datetime] NULL,
	[IDOWNER] [bigint] NULL,
	[IDGROUP] [bigint] NULL,
	[KIND] [varchar](20) NULL,
	[STATUS] [int] NULL,
	[COVERID] [bigint] NULL,
	[TOTAL_VIEW] [bigint] NULL,
 CONSTRAINT [PK__LN__3214EC27AF7CB6BF] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PUBLISH_COMMENT]    Script Date: 1/1/2019 5:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PUBLISH_COMMENT](
	[ID_CMT] [bigint] NOT NULL,
	[ID_PUBLISH] [bigint] NOT NULL,
	[TYPE_CMT] [nvarchar](10) NULL,
 CONSTRAINT [PK__PUBLISH___F3748B7E25AF59F9] PRIMARY KEY CLUSTERED 
(
	[ID_CMT] ASC,
	[ID_PUBLISH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THREAD]    Script Date: 1/1/2019 5:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THREAD](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[TITLE] [ntext] NULL,
	[CONTENT] [ntext] NULL,
	[ID_OWNER] [bigint] NULL,
	[DATEUP] [datetime] NULL,
 CONSTRAINT [PK__THREAD__3214EC274C5D2434] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VIEWING]    Script Date: 1/1/2019 5:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VIEWING](
	[VIEWDATE] [datetime] NOT NULL,
	[STREAM] [varchar](15) NULL,
	[ACCID] [bigint] NULL,
	[TARGET_ID] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VOL]    Script Date: 1/1/2019 5:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VOL](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_LN] [bigint] NULL,
	[TITLE] [ntext] NOT NULL,
	[DESCRIBE] [ntext] NULL,
	[DATEUP] [datetime] NULL,
 CONSTRAINT [PK__VOL__3214EC2788EA23CB] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ACCOUNT] ADD  CONSTRAINT [DF__ACCOUNT__DATECRE__37A5467C]  DEFAULT ((getdate() AT TIME ZONE 'SE Asia Standard Time')) FOR [DATECREATE]
GO
ALTER TABLE [dbo].[BM] ADD  CONSTRAINT [DF__BM__TIME_BM__5629CD9C]  DEFAULT ((getdate() AT TIME ZONE 'SE Asia Standard Time')) FOR [TIME_BM]
GO
ALTER TABLE [dbo].[CENSORING] ADD  CONSTRAINT [DF__CENSORING__CAMEDATE]  DEFAULT ((getdate() AT TIME ZONE 'SE Asia Standard Time')) FOR [CAME_DATE]
GO
ALTER TABLE [dbo].[CHAP] ADD  CONSTRAINT [DF__CHAP__DATEUP__5BE2A6F2]  DEFAULT ((getdate() AT TIME ZONE 'SE Asia Standard Time')) FOR [DATEUP]
GO
ALTER TABLE [dbo].[COMMENT] ADD  CONSTRAINT [DF__COMMENT__CREATET__3F466844]  DEFAULT ((getdate() AT TIME ZONE 'SE Asia Standard Time')) FOR [CREATETIME]
GO
ALTER TABLE [dbo].[FOLLOW] ADD  CONSTRAINT [DF__FOLLOW__DATEUP]  DEFAULT ((getdate() AT TIME ZONE 'SE Asia Standard Time')) FOR [DATEUP]
GO
ALTER TABLE [dbo].[GROUPACC] ADD  CONSTRAINT [DF__GROUPACC__DATECR__3A81B327]  DEFAULT ((getdate() AT TIME ZONE 'SE Asia Standard Time')) FOR [DATECREATE]
GO
ALTER TABLE [dbo].[IMAGES] ADD  CONSTRAINT [DF__IMAGES__DATEUP__ASDA7F]  DEFAULT ((getdate() AT TIME ZONE 'SE Asia Standard Time')) FOR [DATEUP]
GO
ALTER TABLE [dbo].[INBOX] ADD  CONSTRAINT [DF__INBOX__DATE__AUTO]  DEFAULT ((getdate() AT TIME ZONE 'SE Asia Standard Time')) FOR [DATE]
GO
ALTER TABLE [dbo].[JOININ] ADD  CONSTRAINT [DF__JOININ__DATEJOIN__59063A47]  DEFAULT ((getdate() AT TIME ZONE 'SE Asia Standard Time')) FOR [DATEJOIN]
GO
ALTER TABLE [dbo].[LIKING] ADD  CONSTRAINT [DF__LIKING__DATEUP]  DEFAULT ((getdate() AT TIME ZONE 'SE Asia Standard Time')) FOR [DATEUP]
GO
ALTER TABLE [dbo].[LN] ADD  CONSTRAINT [DF__LN__DATEUP__44FF419A]  DEFAULT ((getdate() AT TIME ZONE 'SE Asia Standard Time')) FOR [DATEUP]
GO
ALTER TABLE [dbo].[LN] ADD  DEFAULT ((0)) FOR [TOTAL_VIEW]
GO
ALTER TABLE [dbo].[VIEWING] ADD  CONSTRAINT [DF__VIEW__VIEWDATE]  DEFAULT ((getdate() AT TIME ZONE 'SE Asia Standard Time')) FOR [VIEWDATE]
GO
ALTER TABLE [dbo].[VOL] ADD  CONSTRAINT [DF__VOL__DATEUP__5165187F]  DEFAULT ((getdate() AT TIME ZONE 'SE Asia Standard Time')) FOR [DATEUP]
GO
ALTER TABLE [dbo].[BLACKLIST]  WITH CHECK ADD  CONSTRAINT [FK__BLACKLIST__ID_TA__6754599E] FOREIGN KEY([ID_TARGET_ACC])
REFERENCES [dbo].[ACCOUNT] ([ID])
GO
ALTER TABLE [dbo].[BLACKLIST] CHECK CONSTRAINT [FK__BLACKLIST__ID_TA__6754599E]
GO
ALTER TABLE [dbo].[BM]  WITH CHECK ADD  CONSTRAINT [FK__BM__ID_BMFOLDER__6B24EA82] FOREIGN KEY([ID_BMFOLDER])
REFERENCES [dbo].[BMFOLDER] ([ID])
GO
ALTER TABLE [dbo].[BM] CHECK CONSTRAINT [FK__BM__ID_BMFOLDER__6B24EA82]
GO
ALTER TABLE [dbo].[BMFOLDER]  WITH CHECK ADD  CONSTRAINT [FK__BMFOLDER__ID_ACC__656C112C] FOREIGN KEY([ID_ACC])
REFERENCES [dbo].[ACCOUNT] ([ID])
GO
ALTER TABLE [dbo].[BMFOLDER] CHECK CONSTRAINT [FK__BMFOLDER__ID_ACC__656C112C]
GO
ALTER TABLE [dbo].[CHAP]  WITH CHECK ADD  CONSTRAINT [FK__CHAP__ID_NOVEL__6EF57B66] FOREIGN KEY([ID_NOVEL])
REFERENCES [dbo].[LN] ([ID])
GO
ALTER TABLE [dbo].[CHAP] CHECK CONSTRAINT [FK__CHAP__ID_NOVEL__6EF57B66]
GO
ALTER TABLE [dbo].[CHAP]  WITH CHECK ADD  CONSTRAINT [FK__CHAP__ID_VOL__6E01572D] FOREIGN KEY([ID_VOL])
REFERENCES [dbo].[VOL] ([ID])
GO
ALTER TABLE [dbo].[CHAP] CHECK CONSTRAINT [FK__CHAP__ID_VOL__6E01572D]
GO
ALTER TABLE [dbo].[COMMENT]  WITH CHECK ADD  CONSTRAINT [FK__COMMENT__ID_OWNE__619B8048] FOREIGN KEY([ID_OWNER])
REFERENCES [dbo].[ACCOUNT] ([ID])
GO
ALTER TABLE [dbo].[COMMENT] CHECK CONSTRAINT [FK__COMMENT__ID_OWNE__619B8048]
GO
ALTER TABLE [dbo].[GENRE]  WITH CHECK ADD  CONSTRAINT [FK__GENRE__IDNOVEL__693CA210] FOREIGN KEY([IDNOVEL])
REFERENCES [dbo].[LN] ([ID])
GO
ALTER TABLE [dbo].[GENRE] CHECK CONSTRAINT [FK__GENRE__IDNOVEL__693CA210]
GO
ALTER TABLE [dbo].[GROUPACC]  WITH CHECK ADD  CONSTRAINT [FK__GROUPACC__IDOWNE__5FB337D6] FOREIGN KEY([IDOWNER])
REFERENCES [dbo].[ACCOUNT] ([ID])
GO
ALTER TABLE [dbo].[GROUPACC] CHECK CONSTRAINT [FK__GROUPACC__IDOWNE__5FB337D6]
GO
ALTER TABLE [dbo].[INBOX]  WITH CHECK ADD  CONSTRAINT [FK__INBOX__ACCID_ACCOUNT__ID] FOREIGN KEY([ACCID])
REFERENCES [dbo].[ACCOUNT] ([ID])
GO
ALTER TABLE [dbo].[INBOX] CHECK CONSTRAINT [FK__INBOX__ACCID_ACCOUNT__ID]
GO
ALTER TABLE [dbo].[JOININ]  WITH CHECK ADD  CONSTRAINT [FK__JOININ__ID_ACC__6C190EBB] FOREIGN KEY([ID_ACC])
REFERENCES [dbo].[ACCOUNT] ([ID])
GO
ALTER TABLE [dbo].[JOININ] CHECK CONSTRAINT [FK__JOININ__ID_ACC__6C190EBB]
GO
ALTER TABLE [dbo].[JOININ]  WITH CHECK ADD  CONSTRAINT [FK__JOININ__ID_GROUP__6D0D32F4] FOREIGN KEY([ID_GROUP])
REFERENCES [dbo].[GROUPACC] ([ID])
GO
ALTER TABLE [dbo].[JOININ] CHECK CONSTRAINT [FK__JOININ__ID_GROUP__6D0D32F4]
GO
ALTER TABLE [dbo].[LN]  WITH CHECK ADD  CONSTRAINT [FK__LN__COVERID] FOREIGN KEY([COVERID])
REFERENCES [dbo].[IMAGES] ([ID])
GO
ALTER TABLE [dbo].[LN] CHECK CONSTRAINT [FK__LN__COVERID]
GO
ALTER TABLE [dbo].[LN]  WITH CHECK ADD  CONSTRAINT [FK__LN__IDOWNER__6477ECF3] FOREIGN KEY([IDOWNER])
REFERENCES [dbo].[ACCOUNT] ([ID])
GO
ALTER TABLE [dbo].[LN] CHECK CONSTRAINT [FK__LN__IDOWNER__6477ECF3]
GO
ALTER TABLE [dbo].[PUBLISH_COMMENT]  WITH CHECK ADD  CONSTRAINT [FK__PUBLISH_C__ID_CM__6A30C649] FOREIGN KEY([ID_CMT])
REFERENCES [dbo].[COMMENT] ([ID])
GO
ALTER TABLE [dbo].[PUBLISH_COMMENT] CHECK CONSTRAINT [FK__PUBLISH_C__ID_CM__6A30C649]
GO
ALTER TABLE [dbo].[THREAD]  WITH CHECK ADD  CONSTRAINT [FK__THREAD__ID_OWNER__66603565] FOREIGN KEY([ID_OWNER])
REFERENCES [dbo].[ACCOUNT] ([ID])
GO
ALTER TABLE [dbo].[THREAD] CHECK CONSTRAINT [FK__THREAD__ID_OWNER__66603565]
GO
ALTER TABLE [dbo].[VOL]  WITH CHECK ADD  CONSTRAINT [FK__VOL__ID_LN__68487DD7] FOREIGN KEY([ID_LN])
REFERENCES [dbo].[LN] ([ID])
GO
ALTER TABLE [dbo].[VOL] CHECK CONSTRAINT [FK__VOL__ID_LN__68487DD7]
GO
ALTER TABLE [dbo].[ACCOUNT]  WITH CHECK ADD  CONSTRAINT [CK__ACCOUNT__ISAUTO__5CD6CB2B] CHECK  (([ISAUTO]='NO' OR [ISAUTO]='YES'))
GO
ALTER TABLE [dbo].[ACCOUNT] CHECK CONSTRAINT [CK__ACCOUNT__ISAUTO__5CD6CB2B]
GO
ALTER TABLE [dbo].[ACCOUNT]  WITH CHECK ADD  CONSTRAINT [CK__ACCOUNT__ISBAN__5DCAEF64] CHECK  (([ISBAN]='NO' OR [ISBAN]='YES'))
GO
ALTER TABLE [dbo].[ACCOUNT] CHECK CONSTRAINT [CK__ACCOUNT__ISBAN__5DCAEF64]
GO
ALTER TABLE [dbo].[BMFOLDER]  WITH CHECK ADD  CONSTRAINT [CK__BMFOLDER__ISPARE__5EBF139D] CHECK  (([ISPARENT]='NO' OR [ISPARENT]='YES'))
GO
ALTER TABLE [dbo].[BMFOLDER] CHECK CONSTRAINT [CK__BMFOLDER__ISPARE__5EBF139D]
GO
USE [master]
GO
ALTER DATABASE [4T] SET  READ_WRITE 
GO
