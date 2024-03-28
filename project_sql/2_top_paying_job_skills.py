import matplotlib.pyplot as plt

# Define skills and their counts
skills = ['SQL', 'Python', 'Tableau', 'R', 'Pandas', 'Excel']
skill_counts = [10, 10, 7, 6, 5, 4]

# Create bar chart
plt.figure(figsize=(10, 6))
plt.barh(skills, skill_counts, color='navy')
plt.xlabel('Number of Mentions')
plt.ylabel('Skills')
plt.title('Top Skills Mentioned in Data Analyst Roles')
plt.gca().invert_yaxis()  # Invert y-axis to display the most mentioned skill on top
plt.show()