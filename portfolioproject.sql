SELECT * FROM `portfolio projects`.`covid project for portfolio`;
select * from `covid project for portfolio`
order by 3,4;
#select * from `covidvaccination portfolio project part 2`
#order by 3,4;

#Select data that we are going to be using 
select location,date,total_cases,new_cases, total_deaths
 from `portfolio projects`.`covid project for portfolio`
 order by 1,2;
 
 ##Looking at total cases vs total deaths 
 ##Shows Likelihood of dying if you contract covid in your country
 select location,date,total_cases, total_deaths ,(total_deaths/total_cases)*100 as Percentpopulationinfection 
 from `portfolio projects`.`covid project for portfolio`
 where location = 'Afghanistan'
 order by 1,2;
 
 
 
 ##Looking at totak cases VS Population
 ##Shows what percentage of population got covid
 select location,date, Population ,total_cases,(total_cases/population)*100 as deathpercentage
 from `portfolio projects`.`covid project for portfolio`
 where location = 'Afghanistan'
 order by 1,2;
 
 
 ##Looking at Countries with Highest Infection Rate Compared to population 
 select location,Population ,max(total_cases) as HighestInfectedCount ,MAX((total_deaths/total_cases))*100 as Percentpopulationinfected
 from `portfolio projects`.`covid project for portfolio`
 ## where location = 'Afghanistan'
 Group by Location, Population
 order by Percentpopulationinfected desc;
 
 ##Making continent notnull
 select * from `covid project for portfolio`
 where continent is not null
 order by 3,4;
 
 ##LET's break things down by continent
  select continent , max(cast(total_deaths as signed )) as Totaldeathcount
  from `portfolio projects`.`covid project for portfolio`
  ##where location like 'Afganisthan'
  where continent is not null
  group by continent
  order by totaldeathcount desc;
  
  
 ##Showing Countries with Hoghest Death Count Per Population
  select location , max(cast(total_deaths as signed )) as Totaldeathcount
  from `portfolio projects`.`covid project for portfolio`
  ##where location like 'Afganisthan'
  where continent is null
  group by location
  order by totaldeathcount desc;
  
  ## GLOBAL NUMBERS 
  select sum(new_cases) as total_cases , sum(cast(new_deaths as signed)) as total_deaths , sum(cast(new_deaths as signed))/sum(new_cases)*100 as deathpercentage
  from `portfolio projects`.`covid project for portfolio`
  where continent is not null
  ##group by date 
  order by 1,2;
  
  
  