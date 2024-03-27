/*
Find job postings from the first quarter that have a salary greater than $70k 
- Combine job posting tables from the first quarter of 2023
- Gets job postings with an average year;y salary > $70,000
*/

WITH first_quarter_salary AS (
    SELECT job_title_short,
        salary_year_avg
    FROM
        jan_2023_jobs

    UNION all

    SELECT job_title_short,
        salary_year_avg
    FROM
        feb_2023_jobs

    UNION ALL

    SELECT job_title_short,
        salary_year_avg
    FROM
        mar_2023_jobs
)

SELECT job_title_short,
    salary_year_avg
FROM
    first_quarter_salary
WHERE
    salary_year_avg > 70000
ORDER BY salary_year_avg DESC; 
