-- Worldwide
-- Percentage of population infected worldwide

Select          location,
		population,
		date,
		total_cases,
		(total_cases/population)*100 AS percerntage_of_cases
From            covid_continent
WHERE           location = 'World' 
AND 	        date = '2022-01-27'
GROUP BY        location, population, date, total_cases

-- Percentage of death per cases worldwide:

Select  	location,
		date,
		total_cases,
		total_deaths,					 
	    	(total_deaths/total_cases)*100 AS percentage_of_death_per_world_cases
From 		covid_continent
WHERE 		location = 'World'
AND 		date = '2022-01-27'
GROUP BY    	location, date, total_deaths, total_cases

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
AND 		cnt.date = '2022-01-27'
GROUP BY    	cnt.location, cnt.population, cnt.date, vac.people_vaccinated

-- Percentage of death per population worldwide:

Select  	location,
		date,
		population,
		total_deaths,					 
	        (total_deaths/population)*100 AS percentage_of_death_per_world_population
From 		covid_continent
WHERE 		location = 'World'
AND 		date = '2022-01-27'
GROUP BY    	location, population, date, total_deaths

-- Total deaths 2020 vs 2021

SELECT 		location,
SUM		(CASE WHEN date BETWEEN '2020-01-22' AND  '2021-01-23' THEN new_deaths END)
AS 		total_deaths_in_2020,
SUM		(CASE WHEN date BETWEEN '2021-01-23' AND  '2022-01-22' THEN new_deaths END)
AS 		total_deaths_in_2021
FROM 		covid_continent
WHERE 		location = 'World' 
GROUP BY 	location



-- Continents
-- The total number of cases per continent

Select  	location,
		population,
		date,
		total_cases
From 		covid_continent
WHERE   	location in ('Africa', 'Asia', 'Europe', 'North America', 'South America', 'Oceania')
AND		date = '2022-01-27' 	
GROUP BY 	location, population, date, total_cases
ORDER BY 	total_cases desc

-- The percentage of cases per population per continent

Select  	location,
		population,
		date,
		total_cases,
    	        (total_cases/population)*100 AS percerntage_of_cases
From 		covid_continent
WHERE   	location in ('Africa', 'Asia', 'Europe', 'North America', 'South America', 'Oceania')
AND		date = '2022-01-27' 	
GROUP BY 	location, population, date, total_cases
ORDER BY 	percerntage_of_cases desc


-- The percentage of vaccination per population per continent

Select  	cnt.location,
		cnt.population,
		cnt.date,
		vac.people_vaccinated, 
                (vac.people_vaccinated/cnt.population)*100 AS percentage_of_people_vaccinated
From 		covid_continent AS cnt
join 		covid_vaccinations AS vac
on		cnt.ind_cnt = vac.ind_vac
WHERE 		cnt.location in ('Africa', 'Asia', 'Europe', 'North America', 'South America', 'Oceania')
AND 		cnt.date = '2022-01-27'
GROUP BY        cnt.location, cnt.population, cnt.date, vac.people_vaccinated
ORDER BY 	percentage_of_people_vaccinated DESC

-- The percentage of deaths per cases per continent

Select  	location,
		population,
		date,
		total_cases, 
		total_deaths,
    	        (total_deaths/total_cases)*100 AS percerntage_of_deaths
From 		covid_continent
WHERE   	location in ('Africa', 'Asia', 'Europe', 'North America', 'South America', 'Oceania')
AND		date = '2022-01-27' 	
GROUP BY 	location, population, date, total_cases, total_deaths
ORDER BY 	percerntage_of_deaths desc


-- Countries

-- Top 10 countries by total cases

SELECT 		location,
 		population,
MAX		(total_cases) as total_cases
FROM 		covid_countries
WHERE 		(total_cases/population) IS NOT NULL
Group BY 	location, population
ORDER BY 	total_cases DESC
limit 		10


-- Top 10 countries by population infected percentage

SELECT      	location,
 		population,
MAX		(total_cases) as total_cases,
MAX 		(total_cases/population)*100 AS percentage_of_cases
FROM 		covid_countries
WHERE 		(total_cases/population) IS NOT NULL
Group BY 	location, population
ORDER BY 	percentage_of_cases DESC
limit 		10

-- Top 10 countries by vaccination percentage

SELECT 		ct.location,
		ct.population,
		ct.date,
		vc.people_vaccinated,
		(vc.people_vaccinated/ct.population)*100 AS percentage_of_people_vaccinated
FROM 		covid_countries AS ct
Join 		covid_vaccinations AS vc
ON   		ct.ind_con = vc.ind_vac
WHERE   	ct.date = '2022-01-27' 
AND 		vc.people_vaccinated IS NOT NULL
GROUP BY 	ct.location, ct.population, ct.date, vc.people_vaccinated
Order BY 	percentage_of_people_vaccinated DESC
Limit 		10

-- Top 10 countries by deaths percentage

SELECT 		location,
		population,
		date,
		total_deaths,
		(total_deaths/population)*100 AS percentage_of_deaths
FROM 		covid_countries
WHERE   	date = '2022-01-27' 
AND 		total_deaths IS NOT NULL
GROUP BY 	location, population, date, total_deaths
Order BY 	total_deaths DESC
Limit 		10

-- Top 10 countries by death 2020 vs 2021

SELECT 		location,
MAX		(CASE WHEN date BETWEEN '2020-01-22' AND  '2021-01-23' THEN total_deaths END)
AS 		total_deaths_in_2020,
MAX		(CASE WHEN date BETWEEN '2021-01-23' AND  '2022-01-22' THEN total_deaths END) -
MAX		(CASE WHEN date BETWEEN '2020-01-22' AND  '2021-01-23' THEN total_deaths END)
AS 		total_deaths_in_2021
FROM 		covid_countries
WHERE 		location in ('United States', 'Brazil', 'India', 'Russia', 'Mexico', 
		'Peru', 'United Kingdom', 'Indonesia', 'Italy', 'Iran')
GROUP BY 	location
ORDER BY 	total_deaths_in_2021 DESC




