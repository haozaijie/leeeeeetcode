# method 1 - window function
select project_id, employee_id
from (
    select p.project_id, p.employee_id,
    rank() over (partition by p.project_id order by experience_years desc) rnk
    from project p 
    join employee e
    on p.employee_id = e.employee_id
    )  t
where rnk = 1;

# method 2 - subquery using max experience years
select p.project_id, p.employee_id
from project p
join employee e
on p.employee_id = e.employee_id
where (p.project_id, experience_years) in (
    select p.project_id, max(experience_years)
    from project p
    join employee e
    on p.employee_id = e.employee_id
    group by p.project_id
);
