CREATE VIEW [COMMWEB].[VIEW_COMM_IA_CODE] AS 
	with emps as(

		   select distinct WinDomain, WinLogin, Email, EmployeeID,isDisabled from GMPCC.dbo.Employees

		   where IsDisabled = 0 and WinDomain = 'ADELAIDE' --and winlogin = 'jbrumer'

	)

	select IACd_FCC as IACode,IACd_RWL,isDisabled, EmployeeID, WinDomain, WinLogin, Email

	from emps

	cross apply GMPCommission.dbo.udf_GetAdvisorMappingsByUserID_CW('ADELAIDE\' + WinLogin,0) 


drop view VIEW_COMMWEB_IA_CODE

SELECT * FROM [COMMWEB].[VIEW_COMM_IA_CODE] where winLogin = 'wwoo'