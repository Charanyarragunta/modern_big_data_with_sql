SELECT  State,
		MAX(Confirmed) AS Total_Cases,
		MAX(Cured) AS Total_Cured, 
		MAX(Deaths) AS Total_Deaths 
FROM dbo.covid19case3 
GROUP BY State 
ORDER BY Total_Cases DESC;