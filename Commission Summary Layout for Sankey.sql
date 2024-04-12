
--select * from COMMWEB.COMM_DAILY_SUMMARY WHERE TRFITL_GROSS_REV = 0
--SELECT * FROM COMMWEB.VIEW_COMM_DAILY_SUMMARY_HIERARCHY
--drop view COMMWEB.VIEW_COMM_DAILY_SUMMARY_HIERARCHY

CREATE VIEW COMMWEB.VIEW_COMM_DAILY_SUMMARY_HIERARCHY AS
	SELECT
		IA_CODE,
		BUSINESS_DATE,
		TO_IA_CODE,
		'TRAN_TR_REV' AS Level_1,
		'TRFITL_GROSS_REV' AS Level_2,
		'TOTAL_GROSS_REV' AS Level_3,
		NULL AS Level_4,
		NULL AS Level_5,
		NULL AS Level_6,
		NULL AS Level_7,
		TRAN_TR_REV AS VALUE
	FROM COMMWEB.COMM_DAILY_SUMMARY

	UNION 

	SELECT
		IA_CODE,
		BUSINESS_DATE,
		TO_IA_CODE,
		'TRAN_TL_REV',
		'TRFITL_GROSS_REV',
		'TOTAL_GROSS_REV',
		NULL,
		NULL,
		NULL,
		NULL,
		TRAN_TL_REV 
	FROM COMMWEB.COMM_DAILY_SUMMARY

	UNION 

	SELECT
		IA_CODE,
		BUSINESS_DATE,
		TO_IA_CODE,
		'FI_REV',
		'TRFITL_GROSS_REV',
		'TOTAL_GROSS_REV',
		NULL,
		NULL,
		NULL,
		NULL,
		FI_REV
	FROM COMMWEB.COMM_DAILY_SUMMARY

	UNION 

	SELECT
		IA_CODE,
		BUSINESS_DATE,
		TO_IA_CODE,
		'INS_REV',
		'TOTAL_GROSS_REV',
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		INS_REV
	FROM COMMWEB.COMM_DAILY_SUMMARY

	UNION 

	SELECT
		IA_CODE,
		BUSINESS_DATE,
		TO_IA_CODE,
		'AMA_FEE_REV',
		'TOTAL_FEE_REV',
		'TOTAL_GROSS_REV',
		NULL,
		NULL,
		NULL,
		NULL,
		AMA_FEE_REV
	FROM COMMWEB.COMM_DAILY_SUMMARY

	UNION 

	SELECT
		IA_CODE,
		BUSINESS_DATE,
		TO_IA_CODE,
		'UMA_FEE_REV',
		'TOTAL_FEE_REV',
		'TOTAL_GROSS_REV',
		NULL,
		NULL,
		NULL,
		NULL,
		UMA_FEE_REV
	FROM COMMWEB.COMM_DAILY_SUMMARY

	UNION 

	SELECT
		IA_CODE,
		BUSINESS_DATE,
		TO_IA_CODE,
		'SMA_FEE_REV',
		'TOTAL_FEE_REV',
		'TOTAL_GROSS_REV',
		NULL,
		NULL,
		NULL,
		NULL,
		SMA_FEE_REV
	FROM COMMWEB.COMM_DAILY_SUMMARY

	UNION 

	SELECT
		IA_CODE,
		BUSINESS_DATE,
		TO_IA_CODE,
		'US_FEE_PMA_REV',
		'TOTAL_FEE_REV',
		'TOTAL_GROSS_REV',
		NULL,
		NULL,
		NULL,
		NULL,
		US_FEE_PMA_REV
	FROM COMMWEB.COMM_DAILY_SUMMARY

	UNION 

	SELECT
		IA_CODE,
		BUSINESS_DATE,
		TO_IA_CODE,
		'PMA_FEE_REV',
		'TOTAL_FEE_REV',
		'TOTAL_GROSS_REV',
		NULL,
		NULL,
		NULL,
		NULL,
		PMA_FEE_REV
	FROM COMMWEB.COMM_DAILY_SUMMARY

	UNION 

	SELECT
		IA_CODE,
		BUSINESS_DATE,
		TO_IA_CODE,
		'US_FEE_SMA_REV',
		'TOTAL_FEE_REV',
		'TOTAL_GROSS_REV',
		NULL,
		NULL,
		NULL,
		NULL,
		US_FEE_SMA_REV
	FROM COMMWEB.COMM_DAILY_SUMMARY

	UNION 

	SELECT
		IA_CODE,
		BUSINESS_DATE,
		TO_IA_CODE,
		'PMA_NEW_ISSUE_NOPAYOUT_REV',
		'TOTAL_GROSS_REV',
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		PMA_NEW_ISSUE_NOPAYOUT_REV
	FROM COMMWEB.COMM_DAILY_SUMMARY

	UNION 

	SELECT
		IA_CODE,
		BUSINESS_DATE,
		TO_IA_CODE,
		'NI_PAYOUT_REV',
		'TOTAL_GROSS_REV',
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NI_PAYOUT_REV
	FROM COMMWEB.COMM_DAILY_SUMMARY

	UNION 

	SELECT
		IA_CODE,
		BUSINESS_DATE,
		TO_IA_CODE,
		'REG_FEE_REV',
		'OTH_REV',
		'TOTAL_GROSS_REV',
		NULL,
		NULL,
		NULL,
		NULL,
		REG_FEE_REV
	FROM COMMWEB.COMM_DAILY_SUMMARY

	UNION 

	SELECT
		IA_CODE,
		BUSINESS_DATE,
		TO_IA_CODE,
		'EMP_REG_FEE_REV',
		'OTH_REV',
		'TOTAL_GROSS_REV',
		NULL,
		NULL,
		NULL,
		NULL,
		EMP_REG_FEE_REV
	FROM COMMWEB.COMM_DAILY_SUMMARY

	UNION 

	SELECT
		IA_CODE,
		BUSINESS_DATE,
		TO_IA_CODE,
		'GIC_COMM_REV',
		'OTH_REV',
		'TOTAL_GROSS_REV',
		NULL,
		NULL,
		NULL,
		NULL,
		GIC_COMM_REV
	FROM COMMWEB.COMM_DAILY_SUMMARY

	UNION 

	SELECT
		IA_CODE,
		BUSINESS_DATE,
		TO_IA_CODE,
		'TF_FEE_REV',
		'OTH_REV',
		'TOTAL_GROSS_REV',
		NULL,
		NULL,
		NULL,
		NULL,
		TF_FEE_REV 
	FROM COMMWEB.COMM_DAILY_SUMMARY

	UNION 

	SELECT
		IA_CODE,
		BUSINESS_DATE,
		TO_IA_CODE,
		NULL,
		NULL,
		'TOTAL_GROSS_REV',
		'NI_NETPAYOUT',
		'TOTAL_NET_PAYOUT',
		NULL,
		NULL,
		NI_NETPAYOUT
	FROM COMMWEB.COMM_DAILY_SUMMARY

	UNION 

	SELECT
		IA_CODE,
		BUSINESS_DATE,
		TO_IA_CODE,
		NULL,
		NULL,
		'TOTAL_GROSS_REV',
		'INS_NETPAYOUT',
		'TOTAL_NET_PAYOUT',
		NULL,
		NULL,
		INS_NETPAYOUT
	FROM COMMWEB.COMM_DAILY_SUMMARY

	UNION 

	SELECT
		IA_CODE,
		BUSINESS_DATE,
		TO_IA_CODE,
		NULL,
		NULL,
		'TOTAL_GROSS_REV',
		'OTH_NETPAYOUT',
		'TOTAL_NET_PAYOUT',
		NULL,
		NULL,
		OTH_NETPAYOUT
	FROM COMMWEB.COMM_DAILY_SUMMARY

	UNION 

	SELECT
		IA_CODE,
		BUSINESS_DATE,
		TO_IA_CODE,
		NULL,
		NULL,
		'TOTAL_GROSS_REV',
		'TRAN_TR_NETPAYOUT',
		'TOTAL_NET_PAYOUT',
		NULL,
		NULL,
		TRAN_TR_NETPAYOUT
	FROM COMMWEB.COMM_DAILY_SUMMARY

	UNION 

	SELECT
		IA_CODE,
		BUSINESS_DATE,
		TO_IA_CODE,
		NULL,
		NULL,
		'TOTAL_GROSS_REV',
		'FI_REV_PAYOUT_PCT',
		'TOTAL_NET_PAYOUT',
		NULL,
		NULL,
		FI_REV_PAYOUT_PCT
	FROM COMMWEB.COMM_DAILY_SUMMARY

	UNION 

	SELECT
		IA_CODE,
		BUSINESS_DATE,
		TO_IA_CODE,
		NULL,
		NULL,
		'TOTAL_GROSS_REV',
		'FEE_REV_PAYOUT_PCT',
		'TOTAL_NET_PAYOUT',
		NULL,
		NULL,
		FEE_REV_PAYOUT_PCT
	FROM COMMWEB.COMM_DAILY_SUMMARY

	UNION 

	SELECT
		IA_CODE,
		BUSINESS_DATE,
		TO_IA_CODE,
		NULL,
		NULL,
		NULL,
		NULL,
		'TOTAL_NET_PAYOUT',
		'PMA_EXCESS_TRADE',
		'FINAL_NET_PAYOUT',
		PMA_EXCESS_TRADE
	FROM COMMWEB.COMM_DAILY_SUMMARY

	UNION 

	SELECT
		IA_CODE,
		BUSINESS_DATE,
		TO_IA_CODE,
		NULL,
		NULL,
		NULL,
		NULL,
		'TOTAL_NET_PAYOUT',
		'DISCOUNT_FEE',
		'FINAL_NET_PAYOUT',
		DISCOUNT_FEE
	FROM COMMWEB.COMM_DAILY_SUMMARY

	UNION 

	SELECT
		IA_CODE,
		BUSINESS_DATE,
		TO_IA_CODE,
		NULL,
		NULL,
		NULL,
		NULL,
		'TOTAL_NET_PAYOUT',
		'AMA_EXCESS_TRADE',
		'FINAL_NET_PAYOUT',
		AMA_EXCESS_TRADE
	FROM COMMWEB.COMM_DAILY_SUMMARY;
--ORDER BY BUSINESS_DATE;

