--Maximum Per-Day Confirmed case per State
SELECT  State,
		MaxPerDayConfirmed,
		Dates,
		Month
FROM
(SELECT  Dates,
		 State,
		 Month,
		 MAX(PerDayConfirmed) OVER (PARTITION BY State) AS MaxPerDayConfirmed,
		 DENSE_RANK() OVER (PARTITION BY State ORDER BY PerDayConfirmed desc) AS HighestConfirmed
FROM dbo.covid19case3) cte
WHERE HighestConfirmed = 1 
ORDER BY MaxPerDayConfirmed DESC;