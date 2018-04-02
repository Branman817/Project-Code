-- ================================================
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
IF OBJECT_ID(N'Sales.bonus_reminder', N'TR') IS NOT NULL
    exec sp_executesql N'DROP TRIGGER Sales.bonus_reminder';
GO


CREATE OR ALTER TRIGGER late_ptrigger
	ON dbo.Projects
	FOR UPDATE
	AS
BEGIN
	UPDATE Tasks
	SET Tasks.Color = "Red"
	WHERE Projects.Deadline(date) < getdate();

END
GO
