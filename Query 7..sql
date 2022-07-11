--Finding the 'Time' when Covid Waves attacked the capital city 'Delhi'
WITH monthlySpike AS
(SELECT  State,
		 Dates,
		 Year,
		 Month,
		 PerDayConfirmed,
		 AVG(PerDayConfirmed) OVER (PARTITION BY Month) as Spike,
		 DENSE_RANK() OVER (PARTITION BY Month ORDER BY PerDayConfirmed DESC) AS rnk
FROM dbo.covid19case3
WHERE State = 'Delhi')
SELECT  State,
		Year,
		Month,
		ROUND(Spike,2) as AvgSpikeInCases
FROM monthlySpike
WHERE rnk = 1 AND PerDayConfirmed >3000
ORDER BY Dates;