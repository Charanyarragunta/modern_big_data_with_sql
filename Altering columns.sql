
--Creating New Column for Active Covid Cases
ALTER TABLE dbo.covid19case3
	ADD Active int;

UPDATE dbo.covid19case3
	SET Active = (Confirmed-Deaths-Cured);
	select * from dbo.covid19case3
  
  --Creating New Column for State-wise per day Confirmed Cases
ALTER TABLE dbo.covid19case3
	ADD PerDayConfirmed int;

WITH v_confirmed AS
(
    SELECT  Confirmed - LAG(Confirmed,1) OVER (PARTITION BY State ORDER BY Dates) AS perDayCase, 
			Dates, 
			State 
	FROM dbo.covid19case3
)
UPDATE dbo.covid19case3 SET dbo.covid19case3.PerDayConfirmed = v_confirmed.perDayCase
FROM v_confirmed
WHERE dbo.covid19case3.Dates = v_confirmed.Dates 
AND dbo.covid19case3.State = v_confirmed.State; 
delete from dbo.covid19case3 where perdaycured < 0;

--Creating New Column for State-wise per day Cured Cases
ALTER TABLE dbo.covid19case3
	ADD PerDayCured int;

WITH v_cured AS
(
    SELECT  Cured - LAG(Cured,1) OVER (PARTITION BY State ORDER BY Dates) AS perDayCase, 
			Dates, 
			State 
	FROM dbo.covid19case3
)
UPDATE dbo.covid19case3 SET dbo.covid19case3.PerDayCured = v_cured.perDayCase
FROM v_cured
WHERE dbo.covid19case3.Dates = v_cured.Dates
AND dbo.covid19case3.State = v_cured.State; 


--Creating New Column for State-wise per day Deaths Cases
ALTER TABLE dbo.covid19case3
	ADD PerDayDeaths int;

WITH v_deaths AS
(
    SELECT  Deaths - LAG(Deaths,1) OVER (PARTITION BY State ORDER BY Dates) AS perDayCase, 
			Dates, 
			State
	FROM dbo.covid19case3
)
UPDATE dbo.covid19case3 SET dbo.covid19case3.PerDayDeaths = v_deaths.perDayCase
FROM v_deaths
WHERE dbo.covid19case3.Dates = v_deaths.Dates
AND dbo.covid19case3.State = v_deaths.State; 