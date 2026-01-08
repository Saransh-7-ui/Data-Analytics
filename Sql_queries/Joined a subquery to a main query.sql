SELECT
skill.skills 
FROM skills_dim as skill
join 
(
    select 
    skill.skill_id, count(junc.job_id)
    from 
    skills_dim as skill
    left JOIN skills_job_dim as junc on junc.skill_id=skill.skill_id
    group by skill.skill_id
    order by count(junc.job_id) desc 
    LIMIT 5

) as tab ON skill.skill_id=tab.skill_id

