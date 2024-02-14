DECLARE @iaCode VARCHAR(10) = 'H%';

WITH tempTable as ( 
	SELECT DISTINCT ic.IACodeContactInfoId,ic.seq,tm.DisplayValue 
	FROM IACodeContactTitle ic 
	INNER JOIN RGMPDomain.dbo.TitleMaster tm ON tm.TitleId = ic.TitleId AND tm.LangCd = 'E' 
	LEFT JOIN IACodeContactInfo c ON c.IACodeContactInfoId = ic.IACodeContactInfoId AND c.IsOnStatement = 1
)
, TempTable2 as (
	select distinct c.IACodeContactInfoId,
		STUFF((
			SELECT  ', ' + displayValue
			from tempTable a
			where a.IACodeContactInfoId = c.IACodeContactInfoId
			ORDER BY seq
			FOR xml Path('')),1,2,'') as Title1_E
	from tempTable c
)
,tempTable1 as (
	SELECT DISTINCT ic.IACodeContactInfoId,ic.seq,tm.DisplayValue
	FROM IACodeContactTitle ic
	LEFT JOIN IACodeContactInfo c ON c.IACodeContactInfoId = ic.IACodeContactInfoId AND c.IsOnStatement = 1 
	INNER JOIN RGMPDomain.dbo.EmployeeTitle et ON et.TitleId = ic.TitleId  and et.EmployeeId = c.EmployeeId
	INNER JOIN RGMPDomain.dbo.TitleMaster tm ON tm.TitleId = et.TitleId AND tm.LangCd = 'F' AND et.FrenchTitleGenderCd = tm.GenderCd 
)
, TempTable3 as (
	select distinct c.IACodeContactInfoId,
		STUFF((
				SELECT  ', ' + displayValue
				from tempTable1 a
				where a.IACodeContactInfoId = c.IACodeContactInfoId
				ORDER BY seq
				FOR xml Path('')),1,2,'') as Title1_F
	from tempTable1 c
)
, tempTable4 as (
	SELECT DISTINCT cc.IACodeContactInfoId,cc.seq,cm.DisplayValue
	FROM IACodeContactCredential cc
	INNER JOIN RGMPDomain.dbo.CredentialMaster cm ON cm.CredentialId = cc.CredentialId AND cm.LangCd = 'E'
	LEFT JOIN IACodeContactInfo c ON c.IACodeContactInfoId = cc.IACodeContactInfoId AND c.IsOnStatement = 1
)
, TempTable5 as (
	select distinct c.IACodeContactInfoId,
		STUFF((
			SELECT  ', ' + displayValue
			from tempTable4 a
			where a.IACodeContactInfoId = c.IACodeContactInfoId
			ORDER BY seq
			FOR xml Path('')),1,2,'') as Cred1E
	from tempTable4 c
)
, tempTable6 as (
	SELECT DISTINCT cc.IACodeContactInfoId,cc.seq,cm.DisplayValue
	FROM IACodeContactCredential cc
	INNER JOIN RGMPDomain.dbo.CredentialMaster cm ON cm.CredentialId = cc.CredentialId AND cm.LangCd = 'F'
	LEFT JOIN IACodeContactInfo c ON c.IACodeContactInfoId = cc.IACodeContactInfoId AND c.IsOnStatement = 1
), TempTable7 as (
	select distinct c.IACodeContactInfoId,
		STUFF((
			SELECT  ', ' + displayValue
			from tempTable6 a
			where a.IACodeContactInfoId = c.IACodeContactInfoId
			ORDER BY seq
			FOR xml Path('')),1,2,'') as Cred1F
	from tempTable6 c
)

SELECT DISTINCT
	T2.IACODE,
	CASE
		WHEN T1.seq = T2.seq THEN ''
		WHEN T1.seq = '' and T2.seq IS NULL THEN ''
		ELSE CAST(T2.seq AS VARCHAR(10))
	END AS seq,
	CASE
		WHEN T1.seq = T2.seq THEN ''
		ELSE CAST(T1.seq AS VARCHAR(10))
	END AS seq_FCC, 
	CASE
		WHEN T1.ContactName = T2.ContactName THEN ''
		WHEN T1.ContactName = '' and T2.ContactName IS NULL THEN ''
		ELSE T2.ContactName
	END AS ContactName,
	CASE
		WHEN T1.ContactName = T2.ContactName THEN ''
		ELSE T1.ContactName
	END AS ContactName_FCC, 
	CASE
		WHEN T1.Phone = T2.Phone THEN ''
		WHEN T1.Phone = '' and T2.Phone IS NULL THEN ''
		ELSE T2.Phone
	END AS Phone,
	CASE
		WHEN T1.Phone = T2.Phone THEN ''
		ELSE T1.Phone
	END AS Phone_FCC, 
	CASE
		WHEN T1.Fax = T2.Fax THEN ''
		WHEN T1.Fax = '' and T2.Fax IS NULL THEN ''
		ELSE T2.Fax
	END AS Fax,
	CASE
		WHEN T1.Fax = T2.Fax THEN ''
		ELSE T1.Fax
	END AS Fax_FCC, 
	CASE
		WHEN T1.Email = T2.Email THEN ''
		WHEN T1.Email = '' and T2.Email IS NULL THEN ''
		ELSE T2.Email
	END AS Email,
	CASE
		WHEN T1.Email = T2.Email THEN ''
		ELSE T1.Email
	END AS Email_FCC, 
	CASE
		WHEN T1.IsAdvisor = T2.isAdvisor THEN ''
		WHEN T1.IsAdvisor = '' and T2.IsAdvisor IS NULL THEN ''
		ELSE CAST(T2.IsAdvisor AS VARCHAR(10))
	END AS isAdvisor,
	CASE
		WHEN T1.isAdvisor = T2.isAdvisor THEN ''
		ELSE CAST(T1.IsAdvisor AS VARCHAR(10))
	END AS isAdvisor_FCC, 
	T2.EmployeeID,
	CASE
		WHEN T1.Title1_E = T2.Title1_E THEN ''
		WHEN T1.Title1_E = '' and T2.Title1_E IS NULL THEN ''
		ELSE T2.Title1_E
	END AS Title1_E,
	CASE
		WHEN T1.Title1_E = T2.Title1_E THEN ''
		ELSE T1.Title1_E
	END AS Title1_E_FCC, 
	CASE
		WHEN T1.Title1_F = T2.Title1_F THEN ''
		WHEN T1.Title1_F = '' and T2.Title1_F IS NULL THEN ''
		ELSE T2.Title1_F
	END AS Title1_F,
	CASE
		WHEN T1.Title1_F = T2.Title1_F THEN ''
		ELSE T1.Title1_F
	END AS Title1_F_FCC, 
	CASE
		WHEN T1.Cred1E = T2.Cred1E THEN ''
		WHEN T1.Cred1E = '' and T2.Cred1E IS NULL THEN ''
		ELSE T2.Cred1E
	END AS Cred1E,
	CASE
		WHEN T1.Cred1E = T2.Cred1E THEN ''
		ELSE T1.Cred1E
	END AS Cred1E_FCC, 
	CASE
		WHEN T1.Cred1F = T2.Cred1F THEN ''
		WHEN T1.Cred1F = '' and T2.Cred1F IS NULL THEN ''
		ELSE T2.Cred1F
	END AS Cred1F,
	CASE
		WHEN T1.Cred1F = T2.Cred1F THEN ''
		ELSE T1.Cred1F
	END AS Cred1F_FCC
FROM 
	(SELECT IACode,Seq,ContactName,Phone,Fax,Email,IsAdvisor,EmployeeId,Title1_E,Title1_F,Cred1E,Cred1F FROM RGMPRRAdmin.dbo.udf_GetIACodeStatementEmployeeInfo(NULL) WHERE IACode like @iaCode + '%') AS T1
INNER JOIN
	(SELECT a.IACode,
		c.seq AS seq,
		c.ContactName as ContactName,
		c.Phone as Phone,
		c.Fax as Fax,
		c.Email as Email,
		c.IsAdvisor as IsAdvisor,
		c.EmployeeId as EmployeeId,
		TT2.Title1_E,
		TT3.Title1_F,
		TT5.Cred1E,
		TT7.Cred1F
	FROM MainIACode a
	INNER JOIN IACodeInfo i ON i.IACode = a.IACode
	LEFT JOIN IACodeContactInfo c ON c.IACode = a.IACode AND c.IsOnStatement = 1
	LEFT JOIN TempTable2 TT2 on TT2.IACodeContactInfoId = c.IACodeContactInfoId
	LEFT JOIN TempTable3 TT3 ON TT3.IACodeContactInfoId = c.IACodeContactInfoId
	LEFT JOIN TempTable5 TT5 ON TT5.IACodeContactInfoId = c.IACodeContactInfoId
	LEFT JOIN TempTable7 TT7 ON TT7.IACodeContactInfoId = c.IACodeContactInfoId
	WHERE a.iaCode LIKE @iaCode + '%') AS T2
ON
  T1.IACode = T2.IACode and t1.ContactName = t2.ContactName;
