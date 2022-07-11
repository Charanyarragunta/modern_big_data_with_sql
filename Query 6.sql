--Calculating the State-wise Mortality Rate
WITH cte AS
(SELECT  State,
		Max(Deaths) as Deaths,
		Max(Confirmed) as CovidCases
FROM dbo.covid19case3
GROUP BY STATE)
SELECT  State, 
		CAST(Round((Deaths/CovidCases)*100, 2) as float) AS DeathRate
FROM cte
ORDER BY DeathRate DESC;