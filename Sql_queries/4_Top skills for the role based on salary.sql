select 
    skills,
    avg(salary_year_avg) as Salary,
    count(junction.job_id) 
from job_postings_fact as jobs
inner JOIN skills_job_dim as junction on jobs.job_id=junction.job_id
INNER JOIN skills_dim as skill on junction.skill_id=skill.skill_id
where   
    salary_year_avg is NOT NULL and job_title_short = 'Data Analyst'
group BY 
    skills
order by 
    salary desc 