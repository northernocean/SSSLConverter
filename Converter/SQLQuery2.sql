USE [MESDB]
GO

/****** Object:  Table [prs].[RecipeDetail]    Script Date: 12/18/2020 4:45:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [prs].[RecipeDetail](
	[RecipeDetailId] [int] IDENTITY(1,1) NOT NULL,
	[RecipeRevisionId] [int] NOT NULL,
	[StepNum] [int] NOT NULL,
	[PressureRampSP] [decimal](8, 2) NOT NULL,
	[PressureRampTimeSP] [decimal](8, 2) NOT NULL,
	[PressureHoldSP] [decimal](8, 2) NOT NULL,
	[PressureHoldTimeSP] [decimal](8, 2) NOT NULL,
	[TemperatureRampSP] [decimal](8, 2) NOT NULL,
	[TemperatureRampTimeSP] [decimal](8, 2) NOT NULL,
	[TemperatureHoldSP] [decimal](8, 2) NOT NULL,
	[TemperatureHoldTimeSP] [decimal](8, 2) NOT NULL,
	[BumpTime] [decimal](8, 2) NOT NULL,
	[BumpTemperature] [decimal](8, 2) NOT NULL,
	[SelectHeatCoolSegment] [bit] NOT NULL,
 CONSTRAINT [PK_prs_RecipeDetail] PRIMARY KEY CLUSTERED 
(
	[RecipeDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [prs].[RecipeDetail]  WITH CHECK ADD  CONSTRAINT [FK_prs_RecipeDetail_prs_RecipeRevision] FOREIGN KEY([RecipeRevisionId])
REFERENCES [prs].[RecipeRevision] ([RecipeRevisionId])
GO

ALTER TABLE [prs].[RecipeDetail] CHECK CONSTRAINT [FK_prs_RecipeDetail_prs_RecipeRevision]
GO

ALTER TABLE [prs].[RecipeDetail]  WITH CHECK ADD CHECK  (([BumpTime]>=(0) AND [BumpTime]<=(1000)))
GO

ALTER TABLE [prs].[RecipeDetail]  WITH CHECK ADD CHECK  (([BumpTemperature]>=(0) AND [BumpTemperature]<=(1000)))
GO

ALTER TABLE [prs].[RecipeDetail]  WITH CHECK ADD CHECK  (([PressureHoldSP]>=(0) AND [PressureHoldSP]<=(1000)))
GO

ALTER TABLE [prs].[RecipeDetail]  WITH CHECK ADD CHECK  (([PressureHoldTimeSP]>=(0) AND [PressureHoldTimeSP]<=(1000)))
GO

ALTER TABLE [prs].[RecipeDetail]  WITH CHECK ADD CHECK  (([PressureRampSP]>=(0) AND [PressureRampSP]<=(1000)))
GO

ALTER TABLE [prs].[RecipeDetail]  WITH CHECK ADD CHECK  (([PressureRampTimeSP]>=(0) AND [PressureRampTimeSP]<=(1000)))
GO

ALTER TABLE [prs].[RecipeDetail]  WITH CHECK ADD CHECK  (([TemperatureHoldSP]>=(0) AND [TemperatureHoldSP]<=(1000)))
GO

ALTER TABLE [prs].[RecipeDetail]  WITH CHECK ADD CHECK  (([TemperatureHoldTimeSP]>=(0) AND [TemperatureHoldTimeSP]<=(1000)))
GO

ALTER TABLE [prs].[RecipeDetail]  WITH CHECK ADD CHECK  (([TemperatureRampSP]>=(0) AND [TemperatureRampSP]<=(1000)))
GO

ALTER TABLE [prs].[RecipeDetail]  WITH CHECK ADD CHECK  (([TemperatureRampTimeSP]>=(0) AND [TemperatureRampTimeSP]<=(1000)))
GO


