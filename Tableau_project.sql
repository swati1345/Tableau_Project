
--QUERIES FOR TABLEAU PROJECT

SELECT * 
FROM portfolio_sql..covid_death

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From portfolio_sql..covid_death
where continent is not null 
order by 1,2

--NOW LET'S COUNT DEATH ACCORDING TO LOCATION



Select location, SUM(cast(new_deaths as int)) as TotalDeathCount
From portfolio_sql..covid_death
Where continent is null 
and location not in ('World', 'European Union', 'International')
Group by location
order by TotalDeathCount desc

Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From portfolio_sql..covid_death
Group by Location, Population
order by PercentPopulationInfected desc

Select Location, Population,date, MAX(total_cases) as HighestInfectionCount, Max((total_cases/population))*100 as PercentPopulationInfected
From portfolio_sql..covid_death
Group by Location, Population, date
order by PercentPopulationInfected desc