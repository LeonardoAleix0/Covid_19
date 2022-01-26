-- Worldwide
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

-- Percentage of death per cases worldwide:

Select  	location,
		date,
		total_cases,
		total_deaths,					 
	    	(total_deaths/total_cases)*100 AS percentage_of_death_per_world_cases
From 		covid_continent
WHERE 		location = 'World'
AND 		date = '2022-01-09'
GROUP BY    	location, date, total_deaths, total_cases

-- Percentage of death per population worldwide:

Select  	location,
		date,
		population,
		total_deaths,					 
	        (total_deaths/population)*100 AS percentage_of_death_per_world_population
From 		covid_continent
WHERE 		location = 'World'
AND 		date = '2022-01-09'
GROUP BY    	location, population, date, total_deaths


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

-- Percentage of death per population

Select  	location,
		date,
		population,
		total_deaths,					 
                (total_deaths/population)*100 AS percentage_of_death_per_world_population
From 		covid_continent
WHERE 		location = 'World'
AND 		date = '2022-01-09'
GROUP BY    	location, population, date, total_deaths


-- Continents
-- The total number of cases per continent

Select  	location,
		population,
		date,
		total_cases
From 		covid_continent
WHERE   	location in ('Africa', 'Asia', 'Europe', 'North America', 'South America', 'Oceania')
AND		date = '2022-01-09' 	
GROUP BY 	location, population, date, total_cases
ORDER BY 	total_cases desc

-- The percentage of cases per population

Select  	location,
		population,
		date,
		total_cases
    	        (total_cases/population)*100 AS percerntage_of_cases
From 		covid_continent
WHERE   	location in ('Africa', 'Asia', 'Europe', 'North America', 'South America', 'Oceania')
AND		date = '2022-01-09' 	
GROUP BY 	location, population, date, total_cases
ORDER BY 	percerntage_of_cases desc

-- The percentage of deaths per cases per continent

Select  	location,
		population,
		date,
		total_cases, 
		total_deaths,
    	        (total_deaths/total_cases)*100 AS percerntage_of_deaths
From 		covid_continent
WHERE   	location in ('Africa', 'Asia', 'Europe', 'North America', 'South America', 'Oceania')
AND		date = '2022-01-09' 	
GROUP BY 	location, population, date, total_cases, total_deaths
ORDER BY 	percerntage_of_deaths desc

-- The percentage of vaccination per population

Select  	cnt.location,
		cnt.population,
		cnt.date,
		vac.people_vaccinated, 
                (vac.people_vaccinated/cnt.population)*100 AS percentage_of_people_vaccinated
From 		covid_continent AS cnt
join 		covid_vaccinations AS vac
on		cnt.ind_cnt = vac.ind_vac
WHERE 		cnt.location in ('Africa', 'Asia', 'Europe', 'North America', 'South America', 'Oceania')
AND 		cnt.date = '2022-01-09'
GROUP BY        cnt.location, cnt.population, cnt.date, vac.people_vaccinated
ORDER BY 	percentage_of_people_vaccinated DESC

--






