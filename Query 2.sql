SELECT  Dates,
		Active,
		sum(Active) over (order by Dates Rows 4 preceding) as Last5dayActiveCases
FROM dbo.covid19case3 
where State='Delhi'
order by dates asc;
