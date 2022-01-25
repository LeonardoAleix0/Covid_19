-- Percentage of population infected worldwide

Select          location,
		population,
		date,
		total_cases,
		(total_cases/population)*100 AS percerntage_of_cases
From            covid_continent
WHERE           location = 'World' 
AND 	        date = '2022-01-09'
GROUP BY        location, population, date, total_cases


-- Percentage of population vaccinated worldwide

Select  	cnt.location,
		cnt.population,
		cnt.date,
		vac.people_vaccinated, 
ROUND		((vac.people_vaccinated/cnt.population), 2)*100 
		AS percentage_of_people_vaccinated
From 		covid_continent AS cnt
join 		covid_vaccinations AS vac
on		cnt.ind_cnt = vac.ind_vac
WHERE 		cnt.location = 'World'
AND 		cnt.date = '2022-01-09'
GROUP BY    	cnt.location, cnt.population, cnt.date, vac.people_vaccinated

-- Percentage of death per population and per cases

Select  	location,
		date,
		population,
		total_cases,
		total_deaths,					 
ROUND		((total_deaths/population), 5)*100 AS percentage_of_death_per_world_population,
ROUND		((total_deaths/total_cases), 5)*100 AS percentage_of_death_per_world_cases
From 		covid_continent
WHERE 		location = 'World'
AND 		date = '2022-01-09'
GROUP BY    	location, population, date, total_deaths, total_cases







