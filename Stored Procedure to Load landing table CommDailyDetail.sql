USE [TempDataLake]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [commweb_landing].[pr_Load_CommDailyDetail]

AS

BEGIN

DECLARE @ProcessDate date, @ApplicationName varchar(500), @ProcessZone varchar(500), @PackageName varchar(500), @TaskName varchar(500),
		@SrcTableName varchar(500), @TgtTableName varchar(500), @Comments varchar(500), @ProcessStatus varchar(500), 
		@StartTS datetime, @EndTS datetime,	@RowCount int, @ProcessUser varchar(100)
 
SET @ProcessDate = GETDATE()
SET @ApplicationName = 'COMMWEB'
SET @ProcessZone = 'Curation'
SET @PackageName = NULL 
SET @TaskName = NULL
SET @SrcTableName= 'GMPCommission.[SSRS].pr_GetCommissionTradeDetails' 
SET @TgtTableName = '[commweb_landing].[CommDailyDetail]'
SET @ProcessStatus = 'Started'
SET @StartTS = GETDATE()
SET @ProcessUser = USER_NAME()
 
 
DECLARE @LoadID int
 
/*-- Get LoadID: */
IF EXISTS (SELECT * FROM tempdb.dbo.sysobjects WHERE id = object_id('tempdb.dbo.#tmpLoadId'))  
BEGIN  
DROP TABLE #tmpLoadId  
END  
 
CREATE TABLE #tmpLoadId ( LoadId int NULL )
 
INSERT INTO #tmpLoadId
EXEC RWL.[pr_Insert_PROCESS_LOG_OnBegin] @ProcessDate, @ApplicationName, @ProcessZone, @PackageName, @TaskName,
		@SrcTableName, @TgtTableName, @ProcessStatus, @StartTS, @ProcessUser
 
SELECT @LoadID = LoadId FROM #tmpLoadId

	-- Copy current date from COMMWEB.COMM_DAILY_DETAIL 

DECLARE @UserID as varchar(100), @IACode as varchar(8), @ToIACode as varchar(8), @ProcessingDate as datetime, 
		@Type as int, @FilterOption as int,	@FLAGS as varchar(500),	@IncludeInactiveIACodes as bit

SET @UserID='Adelaide\mlam'
SET @IACode='0'
SET @ToIACode='0'	
SELECT @ProcessingDate = GMPCommission.[payout].[udf_GetMaxProcessingDate]()	-- Get most recent date from GMPCommission
SET @Type=2			--1:daily, 2:MTD
SET @FilterOption=0 --0: no filter, 1:ticketCharge<>0
SET @IncludeInactiveIACodes = 0
SET @FLAGS='Trades - FI $50 to $99.99,Trades - Insurance,Trades - New Issues,Trades - Other,Trades - PMA NI,Trades - Trades No Payout,Trades - Regular Trades,Trades - PMA No Payout,Trades - SMA No Payout,Fees - IAA,Fees - PMA,Fees - SMA,Fees - UMA'

BEGIN TRY

TRUNCATE TABLE [commweb_landing].[CommDailyDetail]

-- Create temporary table to store stored proc results --
IF EXISTS (SELECT * FROM tempdb.dbo.sysobjects WHERE id = object_id('tempdb.dbo.#tmpCDRDetails'))
	BEGIN
	DROP TABLE #tmpCDRDetails
	END

CREATE TABLE #tmpCDRDetails
(
	[IaId] [varchar](10) NULL,
	[ToIaId] [varchar](10) NULL,
	[TradeNumber] [varchar](20) NULL,
	[TradeDate] [datetime] NULL,
	[ProcessingDate] [datetime] NULL,
	[OrderNumber] [int] NULL,
	[OrderDate] [datetime] NULL,
	[SettlementDate] [datetime] NULL,
	[AccountId] [varchar](20) NULL,
	[Port_Type] [varchar](10) NULL,
	[ClientName] [varchar](100) NULL,
	[TradeRR] [varchar](20) NULL,
	[Flag] [varchar](20) NULL,
	[BuySell] [varchar](5) NULL,
	[Quantity] [decimal](18, 4) NULL,
	[SymbolDesc] [varchar](200) NULL,
	[Cusip] [varchar](20) NULL,
	[SecClass] [int] NULL,
	[SecTypeClass] [varchar](10) NULL,
	[Price] [decimal](18, 4) NULL,
	[GrossAmount] [decimal](18, 4) NULL,
	[GrossCommission] [decimal](18, 4) NULL,
	[GrossCommissionCAD] [decimal](18, 4) NULL,
	[Currency] [varchar](3) NULL,
	[MCGrossCommissionCAD] [decimal](18, 4) NULL,
	[MCGrossCommission] [decimal](18, 4) NULL,
	[SCGrossCommissionCAD] [decimal](18, 4) NULL,
	[SCGrossCommission] [decimal](18, 4) NULL,
	[GrossSplitPct] [decimal](18, 4) NULL,
	[PayoutPct] [decimal](18, 4) NULL,
	[NetCommission] [decimal](18, 4) NULL,
	[TicketCharge] [decimal](18, 4) NULL,
	[NetToRR] [decimal](18, 4) NULL,
	[IsDiscountFree] [varchar](2) NULL,
	[CommPercent] [varchar](20) NULL,	-- convert to decimal in landing
	[GroupSeq] [int] NULL,
	[RowOrder] [int] NULL,
	[PMAMZExcessFee] [decimal](18, 4) NULL,
	[PayoutStatus] [varchar](2) NULL,
	[FamilyHHID] [int] NULL
) ON [PRIMARY]

INSERT INTO [commweb_landing].[CommDailyDetail] (
	[IaId]
	,[ToIaId]
	,[TradeNumber]
	,[TradeDate]
	,[ProcessingDate]
	,[BusinessDate]
	,[OrderNumber]
	,[OrderDate]
	,[SettlementDate]
	,[AccountId]
	,[Port_Type]
	,[ClientName]
	,[TradeRR]
	,[Flag]
	,[BuySell]
	,[Quantity]
	,[SymbolDesc]
	,[Cusip]
	,[SecClass]
	,[SecTypeClass]
	,[Price]
	,[GrossAmount]
	,[GrossCommission]
	,[GrossCommissionCAD]
	,[Currency]
	,[MCGrossCommissionCAD]
	,[MCGrossCommission]
	,[SCGrossCommissionCAD]
	,[SCGrossCommission]
	,[GrossSplitPct]
	,[PayoutPct]
	,[NetCommission]
	,[TicketCharge]
	,[NetToRR]
	,[IsDiscountFree]
	,[CommPercent]
	,[GroupSeq]
	,[RowOrder]
	,[PMAMZExcessFee]
	,[PayoutStatus]
	,[FamilyHHID]
	)
	 SELECT
		 [IaId]
		,[ToIaId]
		,[TradeNumber]
		,[TradeDate]
		,[ProcessingDate]
		,@ProcessingDate as BusinessDate
		,[OrderNumber]
		,[OrderDate]
		,[SettlementDate]
		,[AccountId]
		,[Port_Type]
		,[ClientName]
		,[TradeRR]
		,[Flag]
		,[BuySell]
		,[Quantity]
		,[SymbolDesc]
		,[Cusip]
		,[SecClass]
		,[SecTypeClass]
		,[Price]
		,[GrossAmount]
		,[GrossCommission]
		,[GrossCommissionCAD]
		,[Currency]
		,[MCGrossCommissionCAD]
		,[MCGrossCommission]
		,[SCGrossCommissionCAD]
		,[SCGrossCommission]
		,CAST([GrossSplitPct] as decimal(8,4))
		,[PayoutPct]
		,[NetCommission]
		,[TicketCharge]
		,[NetToRR]
		,[IsDiscountFree]
		,CASE WHEN [CommPercent]='' THEN 0 ELSE CONVERT(decimal(8,4), [CommPercent]) END
		,[GroupSeq]
		,[RowOrder]
		,[PMAMZExcessFee]
		,[PayoutStatus]
		,[FamilyHHID]
	from #tmpCDRDetails
	EXEC GMPCommission.[SSRS].pr_GetCommissionTradeDetails @UserID, @IACode, @ToIACode, @ProcessingDate, @Type, @FilterOption, @FLAGS, @IncludeInactiveIACodes
	--from GMPCommission.[SSRS].pr_GetCommissionTradeDetails (@UserID, @IACode, @ToIACode, @ProcessingDate, @Type, @FilterOption, @FLAGS, @IncludeInactiveIACodes)


SELECT @RowCount=Count(*) FROM [commweb_landing].[CommDailyDetail] WHERE [BusinessDate]=(SELECT MAX([BUSINESSDATE]) FROM [commweb_landing].[CommDailyDetail])
	IF @RowCount > 0	-- Load is successful
		SET @ProcessStatus='Completed Successfully'	
		SET @Comments='SUCCESS: [commweb_landing].[CommDailyDetail] Loaded'
		SET @EndTS = GETDATE()
		EXEC RWL.[pr_Update_PROCESS_LOG_OnEnd] @LoadId, @ProcessStatus, @Comments, @EndTS, @RowCount
END TRY
BEGIN CATCH
    -- If there is an error
    SET @ProcessStatus = 'Error while loading'
    SET @Comments = 'ErrNum=' + CAST(ERROR_NUMBER() AS varchar(20)) + ' ' + ERROR_MESSAGE()
    SET @EndTS = GETDATE()
 
    EXEC RWL.[pr_Update_PROCESS_LOG_OnFailure] @LoadId, @ProcessStatus, @Comments, @EndTS
END CATCH


END
GO

