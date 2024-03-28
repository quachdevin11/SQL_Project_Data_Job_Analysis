/*
Question: What are the most optimal skills to learn (aka high in demand and high-paying) 
*/

/* 
METHOD 1
WITH 
top_demand_skills AS (
    SELECT skills_dim.skill_id,
        skills_dim.skills, 
        count(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact 
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
    WHERE job_title_short = 'Data Analyst'
        AND job_work_from_home = TRUE
        AND salary_year_avg IS NOT NULL
    GROUP BY skills_dim.skill_id
),

top_paying_skills AS (
    SELECT skills_job_dim.skill_id, 
        ROUND(avg(salary_year_avg)) AS avg_salary
    FROM job_postings_fact 
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
    WHERE job_title_short = 'Data Analyst'
        AND job_work_from_home = TRUE
        AND salary_year_avg IS NOT NULL
    GROUP BY skills_job_dim.skill_id
)

SELECT top_demand_skills.skill_id, 
    top_demand_skills.skills,
    demand_count, 
    avg_salary
FROM top_demand_skills
INNER JOIN top_paying_skills ON top_demand_skills.skill_id = top_paying_skills.skill_id 
WHERE demand_count > 10
ORDER BY demand_count DESC, avg_salary DESC
LIMIT 25
*/


-- METHOD 2
SELECT 
    skills_dim.skill_id,
    skills_dim.skills, 
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg)) AS avg_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE job_title_short = 'Data Analyst'
    AND job_work_from_home = TRUE
    AND salary_year_avg IS NOT NULL
GROUP BY skills_dim.skill_id
HAVING COUNT(skills_job_dim.job_id) > 10
ORDER BY 
    avg_salary DESC,
    demand_count DESC
LIMIT 25; 
