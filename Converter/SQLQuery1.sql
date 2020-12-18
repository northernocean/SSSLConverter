USE [MESDB]
GO

/****** Object:  Table [prs].[Recipe]    Script Date: 12/18/2020 4:45:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [prs].[Recipe](
	[RecipeId] [int] IDENTITY(1,1) NOT NULL,
	[Number] [int] NOT NULL,
	[Name] [nvarchar](20) NULL,
	[Description] [nvarchar](50) NULL,
	[Notes] [nvarchar](500) NULL,
	[ActiveRevision] [int] NULL,
	[CreationDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[UpdatedBy] [nvarchar](100) NULL,
	[IsArchived] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_prs_Recipe] PRIMARY KEY CLUSTERED 
(
	[RecipeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [prs].[Recipe] ADD  CONSTRAINT [df_prs_Recipe_ActiveRevision]  DEFAULT ((-1)) FOR [ActiveRevision]
GO

ALTER TABLE [prs].[Recipe] ADD  CONSTRAINT [df_prs_Recipe_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO

ALTER TABLE [prs].[Recipe] ADD  CONSTRAINT [df_prs_Recipe_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO

ALTER TABLE [prs].[Recipe] ADD  CONSTRAINT [df_prs_Recipe_IsArchived]  DEFAULT ((0)) FOR [IsArchived]
GO

ALTER TABLE [prs].[Recipe] ADD  CONSTRAINT [df_prs_Recipe_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO


