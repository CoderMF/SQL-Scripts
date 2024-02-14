DECLARE @iaCode VARCHAR(10) = 'HS04'
 
SELECT
  CASE
    WHEN T1.IACode = T2.IACode THEN NULL
    ELSE T2.IACode
  END AS IACode,
  CASE
    WHEN T1.Name1_E = T2.Name1_E THEN NULL
    ELSE T2.Name1_E
  END AS Name1_E,
  CASE
    WHEN T1.Name1_F = T2.Name1_F THEN NULL
    ELSE T2.Name1_F
  END AS Name1_F,
  CASE
    WHEN T1.URL1  = T2.Url THEN NULL
    ELSE T2.URL
  END AS URL,
  CASE
    WHEN T1.TollFree  = T2.TollFree THEN NULL
    ELSE T2.TollFree
  END AS TollFree,
  CASE
    WHEN T1.WorkPhone  = T2.PhoneWork THEN NULL
    ELSE T2.PhoneWork
  END AS WorkPhone,
  CASE
    WHEN T1.FAX  = T2.FAX THEN NULL
    ELSE T2.FAX
  END AS FAX,
  CASE
    WHEN T1.Email  = T2.Email THEN NULL
    ELSE T2.Email
  END AS Email,
  CASE
    WHEN T1.Province  = T2.Province THEN NULL
    ELSE T2.Province
  END AS Province
FROM
  (SELECT IACode, Name1_E, Name1_F, URL1, TollFree, WorkPhone, FAX, Email, Province FROM RGMPRRAdmin.dbo.udf_GetIACodeStatementTeamInfo(@iaCode)) AS T1
JOIN
  (
    select a.IACode,r.DisplayValue as Name1_E,d.DisplayValue as Name1_F,tw.Url,i.TollFree,i.PhoneWork,i.Fax,i.Email,i.Province
	from MainIACode a
	INNER JOIN IACodeInfo i ON i.IACode = a.IACode
	INNER JOIN IACodeTeamName t ON t.IACode = a.IACode and t.Seq = 1
	INNer Join BizTeamIaCode b ON b.IACode = a.IACode 
	Inner Join  RGMPDomain.dbo.TeamName n ON n.BizTeamCOde = b.BizTeamCOde and n.LangCD = 'F' and n.Seq = 1
	Inner Join RGMPDomain.dbo.IIROCNAME d on d.IIrocnameid = n.IIrocnameid 
	INNER JOIN RGMPDomain.dbo.IIROCName r ON r.IIROCNameId = t.IIROCNameId
	INNER JOIN IACodeTeamWebAddress w ON w.IACode = a.IACode
	INNER JOIN RGMPDomain.dbo.WebAddress tw ON tw.WebAddressId = w.WebAddressId
    WHERE
      a.iaCode = @iaCode
  ) AS T2
ON
  T1.IACode = T2.IACode
ORDER BY
  T2.IACode