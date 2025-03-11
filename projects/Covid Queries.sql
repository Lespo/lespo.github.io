--Total Cases vs Total Deaths

Select Location, date, total_cases,total_deaths, (cast(total_deaths as decimal))/(cast(total_cases as decimal))*100 as DeathPercentage
from PortfolioProject..CovidDeaths
Where location like '%africa%'
order by 1,2 desc

--Total Cases vs Population

Select Location, date, total_cases,population, (cast(total_cases as float))/(cast(population as float))*100 as PercentOfPopulationPerCase
from PortfolioProject..CovidDeaths
Where location like '%South africa%'
order by 1,2 desc

--Countries with highest infection rate compated to population

Select Location, population, MAX(total_cases) as HighestInfectionCount, MAX((cast(total_cases as float))/(cast(population as float)))*100 as PercentOfPopulationInfected
from PortfolioProject..CovidDeaths
--Where location like '%south africa%'
Group by location, population
order by PercentOfPopulationInfected desc

--Highest Death Count Per Population Per Country

Select Location, population, MAX(cast(total_deaths as int)) as TotalDeathCount
from PortfolioProject..CovidDeaths
--Where location like '%south africa%'
Where continent is not null
Group by location, population
order by TotalDeathCount desc

--Highest Death Count Per Population Per Continent

Select continent, MAX(cast(total_deaths as int)) as TotalDeathCount
from PortfolioProject..CovidDeaths
--Where location like '%south africa%'
Where continent is not null
Group by continent
order by TotalDeathCount desc

-- Global Numbers

Select date, SUM(new_cases) as TotalCases, SUM(cast(new_deaths as int)) as TotalDeaths, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as DeathPercentage
from PortfolioProject..CovidDeaths
where continent is not null
group by date
order by 1,2

--Total Population vs Total Vaccinations

Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(convert(float,vac.new_vaccinations)) 
OVER (Partition BY dea.location Order by dea.date) as RollingPeopleVaccinated
From PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
order by 2,3

-- USE CTE

With PopVSVac (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
as
(
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(convert(float,vac.new_vaccinations)) 
OVER (Partition BY dea.location Order by dea.date) as RollingPeopleVaccinated
From PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
--order by 2,3
)
Select *, (RollingPeopleVaccinated/Population)*100
From PopVSVac

--TEMP TABLE

Create Table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_Vaccinations numeric,
RollingPeopleVaccinated numeric
)

Insert into #PercentPopulationVaccinated
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(convert(float,vac.new_vaccinations)) 
OVER (Partition BY dea.location Order by dea.date) as RollingPeopleVaccinated
From PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
--order by 2,3

Select *, (RollingPeopleVaccinated/Population)*100
From #PercentPopulationVaccinated


--Create a View

Create View PercentPopulationVaccinated as
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(convert(float,vac.new_vaccinations)) 
OVER (Partition BY dea.location Order by dea.date) as RollingPeopleVaccinated
From PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
--order by 2,3

Select *
From PercentPopulationVaccinated