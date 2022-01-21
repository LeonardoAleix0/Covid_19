-- Creating tables for Covid-19 Project

CREATE TABLE covid_vaccinations (	
    ind_vac NUMERIC,
    iso_code VARCHAR (40),
	continent TEXT,
	location TEXT,
	date DATE,
    new_tests NUMERIC,	
	total_tests NUMERIC,
    total_tests_per_thousand FLOAT8,
	new_tests_per_thousand FLOAT8,
	new_tests_smoothed NUMERIC,
	new_tests_smoothed_per_thousand FLOAT8,
    positive_rate FLOAT8,
	tests_per_case FLOAT8,	
	tests_units TEXT,
	total_vaccinations BIGINT,
	people_vaccinated BIGINT,
 	people_fully_vaccinated BIGINT,	 
	total_boosters BIGINT,
	new_vaccinations BIGINT
	new_vaccinations_smoothed BIGINT,
	total_vaccinations_per_hundred FLOAT8,
	people_vaccinated_per_hundred FLOAT8,
	people_fully_vaccinated_per_hundred FLOAT8,
    total_boosters_per_hundred FLOAT8,
	new_vaccinations_smoothed_per_million BIGINT,
	new_people_vaccinated_smoothed BIGINT,
	new_people_vaccinated_smoothed_per_hundred FLOAT8,
	stringency_index FLOAT8,
	population_density FLOAT8,	
	median_age FLOAT8,
	aged_65_older FLOAT8,
	aged_70_older FLOAT8,
	gdp_per_capita FLOAT8,
	extreme_poverty FLOAT8,
	cardiovasc_death_rate FLOAT8,
	diabetes_prevalence FLOAT8,
	female_smokers FLOAT8,
	male_smokers FLOAT8,
    handwashing_facilities FLOAT8,
    hospital_beds_per_thousand FLOAT8,
	life_expectancy FLOAT8,
	human_development_index FLOAT8,
	excess_mortality_cumulative_absolute BIGINT
	excess_mortality_cumulative FLOAT8,
	excess_mortality FLOAT8,
    excess_mortality_cumulative_per_million FLOAT8,
	);




