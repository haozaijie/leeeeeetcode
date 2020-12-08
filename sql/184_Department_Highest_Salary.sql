# method 1 - cte and join
with dmax as (
    select departmentid, max(salary) as salary
    from employee
    group by departmentid
)

select d.name as department,e.name as employee, dmax.salary
from dmax
join employee e on dmax.salary=e.salary and dmax.departmentid=e.departmentid
join department d on dmax.departmentid=d.id;

# method 2 - window function
select department, employee, salary
from (
    select rank() over (partition by departmentid order by salary desc) rnk, 
    d.name as department, e.name as employee,salary
    from employee e
    join department d
    on e.departmentid = d.id
) t
where rnk=1;

