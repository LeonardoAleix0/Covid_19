-- Creating tables for Covid-19 Project

CREATE TABLE covid_continent (

	ind_cnt NUMERIC,	
	iso_code VARCHAR (40),
	continent TEXT,
    	location TEXT,
	date DATE,
	population NUMERIC,	
	total_cases NUMERIC,
	new_cases NUMERIC,
	new_cases_smoothed FLOAT8,
	total_deaths NUMERIC,
	new_deaths NUMERIC,	
    	new_deaths_smoothed FLOAT8,
    	total_cases_per_million FLOAT8,
    	new_cases_per_million FLOAT8,
	new_cases_smoothed_per_million FLOAT8,
	total_deaths_per_million FLOAT8,
    	new_deaths_per_million FLOAT8,
	new_deaths_smoothed_per_million FLOAT8,
	reproduction_rate FLOAT8,
	icu_patients NUMERIC,
	icu_patients_per_million NUMERIC,
	hosp_patients NUMERIC,
	hosp_patients_per_million FLOAT8,
	weekly_icu_admissions NUMERIC,	
    	weekly_icu_admissions_per_million FLOAT8,
	weekly_hosp_admissions NUMERIC,
	weekly_hosp_admissions_per_million FLOAT8,
	excess_mortality_cumulative_per_million FLOAT8


);


