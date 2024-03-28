/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely. 
- Focuses on job postings with specified salaries (remove nulls).
- Why? Highlight the top-paying oppurtunities for Data Analysts, offering insights into employment oppurtunities. 
*/

-- Highest Paying Data Analyst Jobs - Remote/Close By
SELECT 
    job_id,
    job_title,
    job_location, 
    job_schedule_type,
    salary_year_avg, 
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim
    ON job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short = 'Data Analyst' 
    AND (job_location = 'Anywhere' OR job_location = 'Denver, CO')
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;

-- Count of Companies Hiring Remote Data Analyst
SELECT 
    name AS company_name,
    COUNT(company_dim.name) AS number_of_postings,
    ROUND(AVG(salary_year_avg)) AS avg_salary 
FROM
    job_postings_fact
LEFT JOIN company_dim
    ON job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short = 'Data Analyst' 
    AND (job_location = 'Anywhere')
    AND salary_year_avg IS NOT NULL
GROUP BY company_dim.name
ORDER BY number_of_postings DESC, avg_salary DESC
LIMIT 50;
