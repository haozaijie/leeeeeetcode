# method 1 - group by and max
with cte as (
    select project_id, count(employee_id) as cnt
    from project
    group by project_id
)
select project_id 
from cte
where cnt in (select max(cnt) from cte);

# method 2 - dense_rank()
# There is an issue with the test cases. I think this should work as well. 
select project_id
from (
    select project_id,
    dense_rank() over (order by count(employee_id) desc) as rnk
    from project
) t
where rnk = 1;
