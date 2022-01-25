Select          location,
		population,
		date,
		total_cases,
		(total_cases/population)*100 AS percerntage_of_cases
From            covid_continent
WHERE           location = 'World' 
AND 	        date = '2022-01-09'
GROUP BY        location, population, date, total_cases


Select          location,
		population,
		date,
		total_cases AS total_cases,
		(total_cases/population)*100 AS percerntage_of_cases
From            covid_continent
WHERE           location in (‘Africa’, ‘Asia’, ‘Europe’, ‘North America’, ‘South America’, ‘Oceania’)
AND		date = ‘2022-01-09’ 	
GROUP BY        location, population, date, total_cases
ORDER BY        percerntage_of_cases desc




