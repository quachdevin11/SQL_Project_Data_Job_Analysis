SELECT job_posted_date
FROM job_postings_fact
LIMIT 10;


CREATE TABlE jan_2023_jobs AS 
    SELECT 
        *
    FROM 
        job_postings_fact
    WHERE 
        EXTRACT(MONTH FROM job_posted_date) = 1; 

CREATE TABlE feb_2023_jobs AS 
    SELECT 
        *
    FROM 
        job_postings_fact
    WHERE 
        EXTRACT(MONTH FROM job_posted_date) = 2; 

CREATE TABlE mar_2023_jobs AS 
    SELECT 
        *
    FROM 
        job_postings_fact
    WHERE 
        EXTRACT(MONTH FROM job_posted_date) = 3; 


        