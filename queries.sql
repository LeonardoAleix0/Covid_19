-- Worldwide
-- Percentage of population infected worldwide

SELECT          location,
MAX		(population) AS population,
MAX		(total_cases) AS total_cases,
MAX		(total_cases/population)*100 AS percentage_of_cases
FROM            covid_continent
WHERE           location = 'World' 
GROUP BY        location

-- Percentage of death per cases worldwide:

Select  	location,
MAX			(total_cases) AS total_cases,
MAX		    (total_deaths) AS total_deaths,					 
MAX	    	(total_deaths)/MAX(total_cases)*100 AS percentage_of_death_cases
From 		covid_continent
WHERE 		location = 'World'
GROUP BY    	location

-- Percentage of population vaccinated worldwide

WITH cte AS (
SELECT  	cnt.location,
		cnt.population,
		vac.people_vaccinated 
FROM 		covid_continent AS cnt
JOIN 		covid_vaccinations AS vac
ON		cnt.ind_cnt = vac.ind_vac
WHERE 		cnt.location = 'World'
GROUP BY    	cnt.location, cnt.population, vac.people_vaccinated
)
SELECT		location,
MAX		(population) as population,
MAX		(people_vaccinated) as people_vaccinated,
MAX		(people_vaccinated)/max(population) as percentage_of_people_vaccinated
FROM 		cte
GROUP BY 	location


-- Percentage of death per population worldwide:

SELECT  	location,
MAX		(population) AS population,
MAX		(total_deaths) AS total_deaths,					 
MAX	        (total_deaths)/MAX (population)*100 AS percentage_of_death_per_world_population
From 		covid_continent
WHERE 		location = 'World'
GROUP BY    	location


-- Total deaths 2020 vs 2021

SELECT 		location,
SUM		(CASE WHEN date BETWEEN '2020-01-01' AND  '2020-12-31' THEN new_deaths END)
AS 		total_deaths_in_2020,
SUM		(CASE WHEN date BETWEEN '2021-01-01' AND  '2021-12-31' THEN new_deaths END)
AS 		total_deaths_in_2021
FROM 		covid_continent
WHERE 		location = 'World' 
GROUP BY 	location


-- Continents
-- The total number of cases per continent

SELECT  	location,
MAX		(population) AS population,
MAX		(total_cases) AS total_cases
FROM 		covid_continent
WHERE   	location in ('Africa', 'Asia', 'Europe', 'North America', 'South America', 'Oceania')	
GROUP BY 	location
ORDER BY 	total_cases desc


-- The percentage of cases per population per continent

SELECT  	location,
MAX		(population) AS population,
MAX		(total_cases) AS total_cases,
MAX    	        (total_cases)/MAX(population)*100 AS percerntage_of_cases
From 		covid_continent
WHERE   	location in ('Africa', 'Asia', 'Europe', 'North America', 'South America', 'Oceania') 	
GROUP BY 	location
ORDER BY 	percerntage_of_cases desc



-- The percentage of vaccination per population per continent

Select  	cnt.location,
MAX		(cnt.population) AS population,
MAX		(vac.people_vaccinated) AS people_vaccinated, 
MAX             (vac.people_vaccinated)/MAX(cnt.population)*100 AS percentage_of_people_vaccinated
From 		covid_continent AS cnt
join 		covid_vaccinations AS vac
on		cnt.ind_cnt = vac.ind_vac
WHERE 		cnt.location in ('Africa', 'Asia', 'Europe', 'North America', 'South America', 'Oceania')
--AND 		cnt.date = '2022-01-27'
GROUP BY        cnt.location
ORDER BY 	percentage_of_people_vaccinated DESC

-- The percentage of deaths per cases per continent

SELECT  	location,
MAX		(total_cases) AS total_cases, 
MAX		(total_deaths) AS total_deaths,
MAX    	        (total_deaths)/MAX(total_cases)*100 AS percerntage_of_deaths
FROM 		covid_continent
WHERE   	location in ('Africa', 'Asia', 'Europe', 'North America', 'South America', 'Oceania')
GROUP BY 	location
ORDER BY 	percerntage_of_deaths DESC


-- Total deaths 2020 vs 2021 (Continents)

SELECT 		location,
SUM		(CASE WHEN date BETWEEN '2020-01-01' AND  '2020-12-31' THEN new_deaths END)
AS 		total_deaths_in_2020,
SUM		(CASE WHEN date BETWEEN '2021-01-01' AND  '2021-12-31' THEN new_deaths END)
AS 		total_deaths_in_2021
FROM 		covid_continent
WHERE   	location in ('Africa', 'Asia', 'Europe', 'North America', 'South America', 'Oceania')
GROUP BY 	location


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

with cte as (
SELECT 		ct.location,
		ct.population,
		ct.date,
		vc.people_vaccinated,
		(vc.people_vaccinated/ct.population)*100 AS per_of_people_vac
FROM 		covid_countries AS ct
Join 		covid_vaccinations AS vc
ON   		ct.ind_con = vc.ind_vac
WHERE   	vc.people_vaccinated IS NOT NULL
GROUP BY 	ct.location, ct.population, ct.date, vc.people_vaccinated

)
select 		location,
		population,
MAX		(people_vaccinated) as total_vaccinations,
MAX		(per_of_people_vac) as percentage_of_people_vaccinated
From 		cte
WHERE		location != 'Pitcairn'
Group BY 	location, population
order by 	percentage_of_people_vaccinated desc
Limit 10

-- Top 10 countries by deaths percentage

SELECT 		location,
MAX		(population) AS  population,
MAX		(total_deaths) AS total_deaths,
MAX		(total_deaths)/MAX(population)*100 AS percentage_of_deaths
FROM 		covid_countries
WHERE   	total_deaths IS NOT NULL 
GROUP BY 	location
ORDER BY 	percentage_of_deaths DESC
LIMIT 		10

-- Top 10 countries by death 2020 vs 2021

SELECT 		location,
SUM			(CASE WHEN date BETWEEN '2020-01-22' AND  '2021-01-23' THEN new_deaths END)
AS 			total_deaths_in_2020,
SUM			(CASE WHEN date BETWEEN '2021-01-23' AND  '2022-01-22' THEN new_deaths END)
AS 			total_deaths_in_2021
FROM 		covid_countries
WHERE 		location in ('United States', 'Brazil', 'India', 'Russia', 'Mexico', 
			'Peru', 'United Kingdom', 'Indonesia', 'Italy', 'Colombia')
GROUP BY 	location
ORDER BY 	total_deaths_in_2021 DESC




