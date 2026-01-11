with cte as (
    SELECT
        distinct junction.job_id, 
        job_title_short ,
        salary_year_avg
    from job_postings_fact as jobs 
    inner JOIN skills_job_dim as junction on junction.job_id=jobs.job_id
    where job_location ='Anywhere' and salary_year_avg is not null and job_title_short like 'Data Analyst'
    order by 
        salary_year_avg desc LIMIT 10 
    
    )

select cte.*, skills
from cte as cte 
JOIN skills_job_dim as junction ON cte.job_id = junction.job_id
inner join skills_dim as skill on skill.skill_id =junction.skill_id
