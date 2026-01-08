with counting as (
    SELECT
    company_id,
    case 
    when count(job_id) <10 then 'small'
    when count(job_id) BETWEEN 10 and 50 then 'medium'
    else 'large'
    end as size_category
    from job_postings_fact
    group by company_id
    )

    SELECT 
    size_category,count(*) as no_ofjobs
    from counting 
    group by size_category 