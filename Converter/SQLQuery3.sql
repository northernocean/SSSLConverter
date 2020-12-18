USE [MESDB]
GO

/****** Object:  Table [prs].[RecipeRevision]    Script Date: 12/18/2020 4:45:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [prs].[RecipeRevision](
	[RecipeRevisionId] [int] IDENTITY(1,1) NOT NULL,
	[RecipeId] [int] NOT NULL,
	[MajorRevision] [int] NOT NULL,
	[MinorRevision] [int] NOT NULL,
	[UpdateRevision] [int] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[IsArchived] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[BookLength] [decimal](18, 5) NOT NULL,
	[BookWidth] [decimal](18, 5) NOT NULL,
	[RevisionNote] [nvarchar](500) NULL,
 CONSTRAINT [PK_prs_RecipeRevision] PRIMARY KEY CLUSTERED 
(
	[RecipeRevisionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [df_prs_RecipeVersion] UNIQUE NONCLUSTERED 
(
	[RecipeId] ASC,
	[MajorRevision] ASC,
	[MinorRevision] ASC,
	[UpdateRevision] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [prs].[RecipeRevision] ADD  CONSTRAINT [df_prs_RecipeRevision_MajorRevision]  DEFAULT ((0)) FOR [MajorRevision]
GO

ALTER TABLE [prs].[RecipeRevision] ADD  CONSTRAINT [df_prs_RecipeRevision_MinorRevision]  DEFAULT ((0)) FOR [MinorRevision]
GO

ALTER TABLE [prs].[RecipeRevision] ADD  CONSTRAINT [df_prs_RecipeRevision_UpdateRevision]  DEFAULT ((0)) FOR [UpdateRevision]
GO

ALTER TABLE [prs].[RecipeRevision] ADD  CONSTRAINT [df_prs_RecipeRevision_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO

ALTER TABLE [prs].[RecipeRevision] ADD  CONSTRAINT [df_prs_RecipeRevision_IsArchived]  DEFAULT ((0)) FOR [IsArchived]
GO

ALTER TABLE [prs].[RecipeRevision] ADD  CONSTRAINT [df_prs_RecipeRevision_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO

ALTER TABLE [prs].[RecipeRevision] ADD  CONSTRAINT [df_prs_RecipeRevision_BookLength]  DEFAULT ((0)) FOR [BookLength]
GO

ALTER TABLE [prs].[RecipeRevision] ADD  CONSTRAINT [df_prs_RecipeRevision_BookWidth]  DEFAULT ((0)) FOR [BookWidth]
GO

ALTER TABLE [prs].[RecipeRevision]  WITH CHECK ADD  CONSTRAINT [FK_prs_RecipeRevision_prs_Recipe] FOREIGN KEY([RecipeId])
REFERENCES [prs].[Recipe] ([RecipeId])
GO

ALTER TABLE [prs].[RecipeRevision] CHECK CONSTRAINT [FK_prs_RecipeRevision_prs_Recipe]
GO

ALTER TABLE [prs].[RecipeRevision]  WITH CHECK ADD CHECK  (([BookLength]>=(0) AND [BookLength]<=(1000)))
GO

ALTER TABLE [prs].[RecipeRevision]  WITH CHECK ADD CHECK  (([BookWidth]>=(0) AND [BookWidth]<=(1000)))
GO


