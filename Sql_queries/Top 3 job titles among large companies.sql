with job as(
    select 
    company_id
    from job_postings_fact 
    group by company_id
    having 
    case 
    when count(job_id) > 50 then 1
    end = 1
    order by count(job_id) desc
   
   
)

select fact.job_title,count(job_id) from job as jobs
left join job_postings_fact as fact on fact.company_id=jobs.company_id
where jobs.company_id in (select jobs.company_id from job)
group BY fact.job_title
order by count(job_id) desc 
limit 3