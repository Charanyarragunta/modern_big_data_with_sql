--Total State-wise Confirmed cases till date
SELECT  State,
		MAX(Confirmed) AS TotalCases 
FROM dbo.covid19case3 
GROUP BY State 
ORDER BY TotalCases DESC;

