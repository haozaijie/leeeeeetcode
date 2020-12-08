# windows function - dense_rank() and cte
with top3 as (
    select dense_rank() over(partition by departmentid order by salary desc) rnk,
    departmentid,
    name,
    salary
    from employee
)

select  d.name as department, top3.name as employee, salary
from top3
join department d
on top3.departmentid=d.id
where rnk<=3;

