WITH counting as (
    SELECT
    company.name,company.company_id,count(jobs.job_id) as total_jobs 
    from company_dim as company 
    left JOIN job_postings_fact as jobs on company.company_id=jobs.company_id
    GROUP BY company.name,company.company_id
)
select * from counting where total_jobs=0

SELECT
company_id,name,
case
 when total_jobs < 10 then 'Small'  
 when total_jobs BETWEEN 10 and 50 then 'Medium'  
 when total_jobs >50 then 'Large'
 when total_jobs = 0 then 'No_jobs'
 end as "Size_Category"
from counting
