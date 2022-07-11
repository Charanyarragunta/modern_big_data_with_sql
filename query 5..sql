--Maximum Per-Day Deaths case per State
SELECT  State,
		MaxPerDayDeaths,
		Dates,
		Month
FROM
(SELECT  Dates,
		 State,
		 Month,
		 MAX(PerDayDeaths) OVER (PARTITION BY State) AS MaxPerDayDeaths,
		 DENSE_RANK() OVER (PARTITION BY State ORDER BY PerDayDeaths desc) AS HighestDeaths
FROM dbo.covid19case3) cte
WHERE HighestDeaths = 1 
ORDER BY MaxPerDayDeaths DESC;