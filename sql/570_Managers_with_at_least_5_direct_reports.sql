# method 1 - inner join and temp table
select name 
from employee
join (
    select managerid
    from employee
    group by managerid
    having count(id)>=5) t
where t.managerid = employee.id;

# method 2 - subquery
select name 
from employee e
where e.id in (
    select managerid
    from employee
    group by managerid
    having count(id)>=5);

## in general join is faster than subquery, but depends on the execution plan
