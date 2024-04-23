CREATE VIEW [COMMWEB].[VIEW_COMM_IA_CODE] AS 
	with emps as(

		   select distinct WinDomain, WinLogin, Email, EmployeeID,isDisabled from GMPCC.dbo.Employees

		   where IsDisabled = 0 and WinDomain = 'ADELAIDE' --and winlogin = 'jbrumer'

	)

	select IACd_FCC as IACode,IACd_RWL,isDisabled, EmployeeID, WinDomain, WinLogin, Email

	from emps

	cross apply GMPCommission.dbo.udf_GetAdvisorMappingsByUserID_CW('ADELAIDE\' + WinLogin,0) 

	-- following ETL process to ensure fast load time when being used
INSERT INTO [COMMWEB].[COMM_IA_CODE]
	(IA_CODE, IA_CODE_RWL,EMP_ID,WIN_DOMAIN,WIN_LOGIN,EMP_EMAIL)
	SELECT
		IACode, IACd_RWL, EmployeeID, WinDomain, WinLogin, Email
	FROM
		[COMMWEB].[VIEW_COMM_IA_CODE];

SELECT * FROM [COMMWEB].[VIEW_COMM_IA_CODE] where winLogin = 'jbrumer'

select * from [COMMWEB].[COMM_IA_CODE]
