
-- DATA CLEANING PROJECT

select * 
from world_layoffs.layoffs
;

-- steps
-- 1. remove duplicates
-- 2. standardize the data
-- 3. null values or blank values
-- 3. remove unnecesary columns and rows

create table layoffs_staging 
like world_layoffs.layoffs;

insert layoffs_staging
select *
from layoffs
;

select *
from layoffs_staging
;


select *,
row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off, `date`
 ,stage, country, funds_raised_millions) as row_num
from layoffs_staging;

with duplicate_cte as 
(
select *,
row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off, `date`
 ,stage, country, funds_raised_millions) as row_num
from layoffs_staging
)
delete
from duplicate_cte
where row_num > 1;








CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select * 
from layoffs_staging2
where row_num > 1;

insert into layoffs_staging2
select *,
row_number() over(
partition by company, location, industry, total_laid_off, percentage_laid_off, `date`
 , stage, country,funds_raised_millions) as row_num
from layoffs_staging;

delete 
from layoffs_staging2
where row_num > 1;

select *
from layoffs_staging2
;


-- standardizaing data

select company, trim(company)
from layoffs_staging2;



