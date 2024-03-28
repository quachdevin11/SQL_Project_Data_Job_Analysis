/*
Question: What are the top skills based on salary?
*/

SELECT skills, 
    ROUND(avg(salary_year_avg)) AS avg_salary
FROM job_postings_fact 
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE job_title_short = 'Data Analyst'
    AND job_work_from_home = TRUE
    AND salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25;


/*
Prompting CHATGPT:

Prompt: 
Below is a CSV of the top 25 paying data analyst skills I found in job postings in 2023, can you analyze the skill column and display insights? 
Can you conclude 3 insights from this data? no yapping

CSV:
"skills","avg_salary"
"pyspark","208172"
"bitbucket","189155"
"couchbase","160515"
"watson","160515"
"datarobot","155486"
"gitlab","154500"
"swift","153750"
"jupyter","152777"
"pandas","151821"
"elasticsearch","145000"
"golang","145000"
"numpy","143513"
"databricks","141907"
"linux","136508"
"kubernetes","132500"
"atlassian","131162"
"twilio","127000"
"airflow","126103"
"scikit-learn","125781"
"jenkins","125436"
"notion","125000"
"scala","124903"
"postgresql","123879"
"gcp","122500"
"microstrategy","121619"


Results:
The demand for data analysts spans across a diverse range of skills, including programming languages, database technologies, cloud platforms, and collaboration tools.

Emerging technologies such as PySpark, Kubernetes, Elasticsearch, and Databricks are increasingly sought after, reflecting the need for handling large-scale data and deploying advanced analytics solutions.

Integration of DevOps practices, evidenced by skills related to version control systems, continuous integration, and workflow automation, underscores the importance of collaboration, efficiency, and reproducibility in data analysis workflows.

*/