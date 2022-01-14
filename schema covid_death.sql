-- Creating tables for Covid-19 Project


CREATE TABLE covid_death (	
         iso_code VARCHAR (40),
	 continent TEXT,
	 locations TEXT,
	 dates DATE,
	 population NUMERIC,	
	 total_cases NUMERIC,
	 new_cases NUMERIC,
	 new_cases_smoothed FLOAT8,
	 total_deaths NUMERIC,
	 new_deaths NUMERIC
	 );	


