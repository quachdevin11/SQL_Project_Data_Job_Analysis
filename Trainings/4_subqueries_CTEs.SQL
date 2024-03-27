SELECT company_id, 
    name AS company_name 
FROM company_dim
WHERE company_id IN (
    SELECT
        company_id
    FROM
        job_postings_fact
    WHERE job_no_degree_mention = TRUE
ORDER BY company_id
); 


WITH jobs_per_comp AS (
    SELECT COUNT(company_id) AS number_of_jobs, 
        company_id
    FROM job_postings_fact
    GROUP BY company_id
)

SELECT company_dim.name AS company_name, 
    jobs_per_comp.number_of_jobs
FROM company_dim
LEFT JOIN jobs_per_comp ON jobs_per_comp.company_id = company_dim.company_id
ORDER BY number_of_jobs DESC;
