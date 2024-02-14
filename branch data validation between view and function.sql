select * from [RWL].[VIEW_RELATED_BRANCH] WHERE BRANCH = 'HNY'

SELECT Branch FROM gmpcc.dbo.udf_GetAllRelatedBranches('HNY')

-- Find differences between the two result sets
-- returns values that exist in the view but not in the result of the function
-- if nothing is returned, the set will be empty
DECLARE @code varchar(10) = 'HTO'
SELECT RELATED_BRANCH FROM [RWL].[VIEW_RELATED_BRANCH] WHERE BRANCH = @code
EXCEPT
SELECT Branch FROM gmpcc.dbo.udf_GetAllRelatedBranches(@code)


