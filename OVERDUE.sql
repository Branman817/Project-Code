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
IF EXISTS (SELECT * FROM sysobjects WHERE type = 'TR' AND name = 'OVERDUE')
     DROP TRIGGER OVERDUE
GO
CREATE TRIGGER OVERDUE
ON dbo.Tasks
FOR INSERT, UPDATE
AS

BEGIN
	SET NOCOUNT ON;
	UPDATE dbo.Tasks
	SET Color = '#ff0000'
	WHERE Tasks.DateCompleted < convert(date, getDate())
END

