/*
Find the count of the number of remote job postings per skill
Display the top 5 skills by their demand in remote jobs
Include skill ID, name, and count of postings requiring the skill
*/

with top_skill as (
    SELECT
    count (job.job_id),skills,junc.skill_id
    from job_postings_fact as job 
    left join skills_job_dim as junc on junc.job_id=job.job_id
    left join skills_dim as skill on skill.skill_id=junc.skill_id
    where job_location='Anywhere' and job_title_short='Data Analyst'
    GROUP BY skills,junc.skill_id
    order by count(job.job_id) desc
    limit 5 
    )

SELECT * from top_skill