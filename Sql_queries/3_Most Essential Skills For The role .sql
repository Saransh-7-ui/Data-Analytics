SELECT
    skills as "Skill Name",
    count(junction.job_id) as skill_count
from 
    job_postings_fact as jobs 
INNER JOIN skills_job_dim as junction on jobs.job_id=junction.job_id 
INNER JOIN skills_dim AS skill on skill.skill_id=junction.skill_id 
where 
    job_title_short='Data Analyst' and job_location like 'Anywhere' and salary_year_avg is not null           
group by  
    job_title_short,
    skills
order by 
    count(junction.job_id) DESC 
limit 5 