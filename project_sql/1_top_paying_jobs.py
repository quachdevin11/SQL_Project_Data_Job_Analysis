import pandas as pd
import matplotlib.pyplot as plt
from io import StringIO

# CSV data exported from SQL query
csv_data = '''
"job_id","job_title","job_location","job_schedule_type","salary_year_avg","job_posted_date","company_name"
226942,"Data Analyst","Anywhere","Full-time","650000.0","2023-02-20 15:13:33","Mantys"
547382,"Director of Analytics","Anywhere","Full-time","336500.0","2023-08-23 12:04:42","Meta"
552322,"Associate Director- Data Insights","Anywhere","Full-time","255829.5","2023-06-18 16:03:12","AT&T"
99305,"Data Analyst, Marketing","Anywhere","Full-time","232423.0","2023-12-05 20:00:40","Pinterest Job Advertisements"
1021647,"Data Analyst (Hybrid/Remote)","Anywhere","Full-time","217000.0","2023-01-17 00:17:23","Uclahealthcareers"
168310,"Principal Data Analyst (Remote)","Anywhere","Full-time","205000.0","2023-08-09 11:00:01","SmartAsset"
731368,"Director, Data Analyst - HYBRID","Anywhere","Full-time","189309.0","2023-12-07 15:00:13","Inclusively"
310660,"Principal Data Analyst, AV Performance Analysis","Anywhere","Full-time","189000.0","2023-01-05 00:00:25","Motional"
1749593,"Principal Data Analyst","Anywhere","Full-time","186000.0","2023-07-11 16:00:05","SmartAsset"
387860,"ERM Data Analyst","Anywhere","Full-time","184000.0","2023-06-09 08:01:04","Get It Recruit - Information Technology"
'''

# Load CSV data into a DataFrame
df = pd.read_csv(StringIO(csv_data))

# Extract job titles and corresponding average salaries
titles = df['job_title'].head(10)
salaries = df['salary_year_avg'].head(10)

# Plotting the chart
plt.figure(figsize=(10, 6))
plt.barh(titles, salaries, color='navy')
plt.title('Top 10 Average Salaries by Job Title in 2023')
plt.ylabel('Job Title')
plt.xlabel('Average Yearly Salary (USD)')
plt.gca().invert_yaxis()  # Invert y-axis to display highest salary at the top
plt.show()