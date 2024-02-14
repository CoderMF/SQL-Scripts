-- COMMWEB
CREATE VIEW [COMMWEB].[VIEW_COMM_DAILY_DETAIL_REPORT_ENFR] AS 
SELECT
    SUBVIEW.ID,
    MAX(CASE WHEN [LANGUAGE] = 'en' THEN [Description] END) AS EN_Desc,
    MAX(CASE WHEN [LANGUAGE] = 'fr' THEN [Description] END) AS FR_Desc
FROM (
	SELECT 1 AS [ID], 'en' AS [Language], 'Commission DETAIL Report - Detail' AS [Description]
	UNION ALL
	SELECT 1, 'fr', 'Rapport DÉTAILLÉ sur les commissions – Détail'
	UNION ALL
	SELECT 2, 'en', 'Back to Summary Report'
	UNION ALL
	SELECT 2, 'fr', 'Retour au rapport sommaire'
	UNION ALL
	SELECT 11, 'en', 'Security Type Legend'
	UNION ALL
	SELECT 11, 'fr', 'Légende type titre'
	UNION ALL
	SELECT 12, 'en', 'Security Class Legend'
	UNION ALL
	SELECT 12, 'fr', 'Légende cat. titre'
	UNION ALL
	SELECT 13, 'en', 'Type'
	UNION ALL
	SELECT 13, 'fr', 'Type'
	UNION ALL
	SELECT 14, 'en', 'Description'
	UNION ALL
	SELECT 14, 'fr', 'Description'
	UNION ALL
	SELECT 15, 'en', 'Class'
	UNION ALL
	SELECT 15, 'fr', 'Cat.'
	UNION ALL
	SELECT 16, 'en', 'Description'
	UNION ALL
	SELECT 16, 'fr', 'Description'

	UNION ALL
	SELECT 21, 'en', 'Bond'
	UNION ALL
	SELECT 21, 'fr', 'Obligation'
	UNION ALL
	SELECT 22, 'en', 'Equity'
	UNION ALL
	SELECT 22, 'fr', 'Action'
	UNION ALL
	SELECT 23, 'en', 'Mutual Fund'
	UNION ALL
	SELECT 23, 'fr', 'Fonds commun de placement'
	UNION ALL
	SELECT 24, 'en', 'Option'
	UNION ALL
	SELECT 24, 'fr', 'Option'
	UNION ALL
	SELECT 25, 'en', 'ASSET BACKED'
	UNION ALL
	SELECT 25, 'fr', 'TACM'
	UNION ALL
	SELECT 26, 'en', 'MARKET BONDS'
	UNION ALL
	SELECT 26, 'fr', 'OBLIG. NÉGOCIABLES'
	UNION ALL
	SELECT 27, 'en', 'MKT BONDS – PROV SVGS BOND'
	UNION ALL
	SELECT 27, 'fr', 'OBLIG. NÉGOCIABLES – OBLIG. D’ÉPARGNE PROV.'
	UNION ALL
	SELECT 28, 'en', 'COMMON SHARES'
	UNION ALL
	SELECT 28, 'fr', 'ACTIONS ORDINAIRES'
	UNION ALL
	SELECT 29, 'en', 'LEGENDED AND RESTRICTED SHARES'
	UNION ALL
	SELECT 29, 'fr', 'ACTIONS SUBALTERNES ET AVEC REST. DE TRANSFERT'   
	UNION ALL
	SELECT 30, 'en', 'STRIPPED INSTRUMENT – COUPON'
	UNION ALL
	SELECT 30, 'fr', 'INSTRUMENT DÉMÉMBRÉ – COUPON'
	UNION ALL
	SELECT 31, 'en', 'STRIPPED INSTRUMENT – PRINCIPAL'
	UNION ALL
	SELECT 31, 'fr', 'INSTRUMENT DÉMÉMBRÉ – CAPITAL'
	UNION ALL
	SELECT 32, 'en', 'STRIPPED INSTRUMENT –  SENTINELS'
	UNION ALL
	SELECT 32, 'fr', 'INSTRUMENT DÉMÉMBRÉ – SENTINELS'
	UNION ALL
	SELECT 33, 'en', 'STRIPPED INSTRUMENT – TIGRS'
	UNION ALL
	SELECT 33, 'fr', 'INSTRUMENT DÉMEMBRÉ – TIGRS'
	UNION ALL
	SELECT 34, 'en', 'MONTHLY INCOME'
	UNION ALL
	SELECT 34, 'fr', 'REVENU MENSUEL'
	UNION ALL
	SELECT 35, 'en', 'EXCHANGE-TRADED FUND'
	UNION ALL
	SELECT 35, 'fr', 'FONDS NÉGOCIÉ EN BOURSE'
	UNION ALL
	SELECT 36, 'en', 'TRUST UNITS'
	UNION ALL
	SELECT 36, 'fr', 'PARTS DE FIDUCIE'
	UNION ALL
	SELECT 37, 'en', 'INSTALLMENT RECEIPT'
	UNION ALL
	SELECT 37, 'fr', 'REÇU DE VERSEMENT'
	UNION ALL
	SELECT 38, 'en', 'MUTUAL FUNDS'
	UNION ALL
	SELECT 38, 'fr', 'FONDS COMMUNS DE PLACEMENT'
	UNION ALL
	SELECT 39, 'en', 'SEGREGATED FUNDS'
	UNION ALL
	SELECT 39, 'fr', 'FONDS DISTINCTS'
	UNION ALL
	SELECT 40, 'en', 'MUTUAL FD – FIXED INC'
	UNION ALL
	SELECT 40, 'fr', 'FONDS COMM. – REV. FIXE'
	UNION ALL
	SELECT 41, 'en', 'MUTUAL FD – OTHER'
	UNION ALL
	SELECT 41, 'fr', 'FONDS COMM. – AUTRE'
	UNION ALL
	SELECT 42, 'en', 'MUTUAL FD – CASH/MONEY'
	UNION ALL
	SELECT 42, 'fr', 'FONDS COMM – LIQUIDITÉS/MARCHÉ MONÉTAIRE'
	UNION ALL
	SELECT 43, 'en', 'MUTUAL FD – EQUITY'
	UNION ALL
	SELECT 43, 'fr', 'FONDS COMM – ACTIONS'
	UNION ALL
	SELECT 44, 'en', 'MUTUAL FD – BALANCED'
	UNION ALL
	SELECT 44, 'fr', 'FONDS COMM – ÉQUILIBRÉ'
	UNION ALL
	SELECT 45, 'en', 'PREFERRED SHARES'
	UNION ALL
	SELECT 45, 'fr', 'ACTIONS PRIVILÉGIÉES'
	UNION ALL
	SELECT 46, 'en', 'LIMITED PARTNERSHIP'
	UNION ALL
	SELECT 46, 'fr', 'SOCIÉTÉ EN COMMANDITE'
	UNION ALL
	SELECT 47, 'en', 'RIGHTS/WARRANTS'
	UNION ALL
	SELECT 47, 'fr', 'DROITS/BONS DE SOUSC.'
	UNION ALL
	SELECT 48, 'en', 'UNITS'
	UNION ALL
	SELECT 48, 'fr', 'PARTS'
	UNION ALL
	SELECT 49, 'en', 'OPTIONS'
	UNION ALL
	SELECT 49, 'fr', 'OPTIONS'
	UNION ALL
	SELECT 50, 'en', 'OTHER INVESTMENTS'
	UNION ALL
	SELECT 50, 'fr', 'AUTRES PLACEMENTS'
	UNION ALL
	SELECT 51, 'en', 'MONEY MARKET'
	UNION ALL
	SELECT 51, 'fr', 'MARCHÉ MONÉTAIRE'
	UNION ALL
	SELECT 52, 'en', 'GIC’S'
	UNION ALL
	SELECT 52, 'fr', 'CPG'
	UNION ALL
	SELECT 53, 'en', 'CANADA SAVINGS BOND'
	UNION ALL
	SELECT 53, 'fr', 'OBLIG. D’ÉPARGNE DU CANADA'
	UNION ALL
	SELECT 54, 'en', 'PRIVATE COMPANIES'
	UNION ALL
	SELECT 54, 'fr', 'SOCIÉTÉS FERMÉES'
	UNION ALL
	SELECT 60, 'en', 'Trade Activity'
	UNION ALL
	SELECT 60, 'fr', 'Opération'
	UNION ALL
	SELECT 61, 'en', 'Proc Date'
	UNION ALL
	SELECT 61, 'fr', 'Date trait.'
	UNION ALL
	SELECT 62, 'en', 'Trade Num'
	UNION ALL
	SELECT 62, 'fr', 'No d’opér.'
	UNION ALL
	SELECT 63, 'en', 'Order Date'
	UNION ALL
	SELECT 63, 'fr', 'Date ordre'
	UNION ALL
	SELECT 64, 'en', 'Order #'
	UNION ALL
	SELECT 64, 'fr', 'No d’ordre'
	UNION ALL
	SELECT 65, 'en', 'IA'
	UNION ALL
	SELECT 65, 'fr', 'CP'
	UNION ALL
	SELECT 66, 'en', 'To IA'
	UNION ALL
	SELECT 66, 'fr', 'CP dest.'
	UNION ALL
	SELECT 67, 'en', 'Gross Split %'
	UNION ALL
	SELECT 67, 'fr', '% rép. comm. brutes'
	UNION ALL
	SELECT 68, 'en', 'Acct ID'
	UNION ALL
	SELECT 68, 'fr', 'No cpte'
	UNION ALL
	SELECT 88, 'en', 'FHID'
	UNION ALL
	SELECT 88, 'fr', 'FHID'
	UNION ALL
	SELECT 89, 'en', 'Payout'
	UNION ALL
	SELECT 89, 'fr', 'Paiement'
	UNION ALL
	SELECT 69, 'en', 'Port Type'
	UNION ALL
	SELECT 69, 'fr', 'Type port.'
	UNION ALL
	SELECT 70, 'en', 'Client Name'
	UNION ALL
	SELECT 70, 'fr', 'Nom client'
	UNION ALL
	SELECT 71, 'en', 'Flag'
	UNION ALL
	SELECT 71, 'fr', 'Indic.'
	UNION ALL
	SELECT 72, 'en', 'Buy Sell'
	UNION ALL
	SELECT 72, 'fr', 'Achat Vente'
	UNION ALL
	SELECT 73, 'en', 'Qty'
	UNION ALL
	SELECT 73, 'fr', 'Qté'
	UNION ALL
	SELECT 74, 'en', 'Symbol Desc'
	UNION ALL
	SELECT 74, 'fr', 'Desc. symbole'
	UNION ALL
	SELECT 75, 'en', 'Price'
	UNION ALL
	SELECT 75, 'fr', 'Prix'
	UNION ALL
	SELECT 76, 'en', 'Gross Amount'
	UNION ALL
	SELECT 76, 'fr', 'Montant brut'
	UNION ALL
	SELECT 77, 'en', 'Gross Comm'
	UNION ALL
	SELECT 77, 'fr', 'Comm. brute'
	UNION ALL
	SELECT 201, 'en', '% of Principal'
	UNION ALL
	SELECT 201, 'fr', '% du capital'
	UNION ALL
	SELECT 78, 'en', 'Curr'
	UNION ALL
	SELECT 78, 'fr', 'Dev.'
	UNION ALL
	SELECT 79, 'en', 'Gross Comm CAD'
	UNION ALL
	SELECT 79, 'fr', 'Comm. brute CAD'
	UNION ALL
	SELECT 80, 'en', 'Payout %'
	UNION ALL
	SELECT 80, 'fr', '% versé'
	UNION ALL
	SELECT 81, 'en', 'Net Comm CAD'
	UNION ALL
	SELECT 81, 'fr', 'Comm. nette CAD'
	UNION ALL
	SELECT 82, 'en', 'Disc Fee'
	UNION ALL
	SELECT 82, 'fr', 'Frais d’escompte'
	UNION ALL
	SELECT 83, 'en', 'Net to RR'
	UNION ALL
	SELECT 83, 'fr', 'Comm. nette du rep.'
	UNION ALL
	SELECT 84, 'en', 'Trade Date'
	UNION ALL
	SELECT 84, 'fr', 'Date opér.'
	UNION ALL
	SELECT 85, 'en', 'Settle Date'
	UNION ALL
	SELECT 85, 'fr', 'Date règl.'
	UNION ALL
	SELECT 86, 'en', 'Sec Class'
	UNION ALL
	SELECT 86, 'fr', 'Cat. titre'
	UNION ALL
	SELECT 87, 'en', 'Disc Free'
	UNION ALL
	SELECT 87, 'fr', 'Frais d’escompte à ne pas payés'
	UNION ALL
	SELECT 90, 'en', 'Fees'
	UNION ALL
	SELECT 90, 'fr', 'Frais'
	UNION ALL
	SELECT 91, 'en', 'Month'
	UNION ALL
	SELECT 91, 'fr', 'Mois'
	UNION ALL
	SELECT 92, 'en', 'Year'
	UNION ALL
	SELECT 92, 'fr', 'Année'
	UNION ALL
	SELECT 93, 'en', 'Client ID'
	UNION ALL
	SELECT 93, 'fr', 'No client'
	UNION ALL
	SELECT 94, 'en', 'Bucket'
	UNION ALL
	SELECT 94, 'fr', 'Bac'
	UNION ALL
	SELECT 95, 'en', 'Gross Comm CAD'
	UNION ALL
	SELECT 95, 'fr', 'Comm. brut CAD'
	UNION ALL
	SELECT 96, 'en', 'Group Seq'
	UNION ALL
	SELECT 96, 'fr', 'Group Seq'
) as SUBVIEW
GROUP BY SUBVIEW.ID;

SELECT* FROM [COMMWEB].[VIEW_COMM_DAILY_DETAIL_REPORT_ENFR]
