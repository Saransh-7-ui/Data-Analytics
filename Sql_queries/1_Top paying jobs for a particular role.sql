SELECT
    jobs.job_id,
    job_title_short as "Role",
    salary_year_avg as "Annual Salary" ,
    name as "Company Name",
    job_location as "Job Location", 
    job_schedule_type as "Job Scedule",
    job_posted_date As "Posting date"
from 
job_postings_fact as jobs 
LEFT JOIN company_dim as companies on jobs.company_id=companies.company_id
where 
    job_title_short='Data Analyst' and salary_year_avg is not null and job_location like 'Anywhere'
ORDER BY 
    salary_year_avg DESC
limit 20 