CREATE TABLE [dbo].[tbl_Event](
	[EventTypeId] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[EventType] [varchar](50) NULL,
	[EventTypeImage] varbinary(max)
	)
GO

--INSERT INTO tbl_Event VALUES('Marrige'),('Birth Day'),('Conference'),('Party'),('Other')
--GO


CREATE TABLE [dbo].[tbl_Costomer](
	[CostomerId] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Name] [varchar](50) NULL,
	[FatherName] [varchar](50) NULL,
	[Address] [varchar](200) NULL,
	[Mobile] [varchar](50) NULL,
	[Email] [varchar](50) NULL)
GO

CREATE TABLE [dbo].[tbl_BookedEvent](
	[BookedEventId] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[EventTypeId] [int] NULL REFERENCES [tbl_Event]([EventTypeId]) ,
	[CustomerId] [int] NULL REFERENCES [tbl_Costomer]([CostomerId]),
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[EntryDate] [datetime] NULL DEFAULT(GETDATE()))
	GO




CREATE proc [dbo].[sp_ViewSchedule]
as
select e.BookedEventId, c.Name as 'Customer',c.Email as 'Email Address',c.Mobile,ev.EventType as 'Event',e.StartTime as 'Start Time',e.EndTime as 'End Time',e.EntryDate as 'Date & Time' from 
tbl_BookedEvent e inner join tbl_Costomer c on e.CustomerId=c.CostomerId
inner join tbl_Event ev on e.EventTypeId=ev.EventTypeId
GO
