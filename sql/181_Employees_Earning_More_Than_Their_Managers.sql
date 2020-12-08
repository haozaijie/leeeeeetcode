# method1 - use join
select e.name as employee
from Employee e
join Employee m
on e.managerid = m.id
where e.salary> m.salary

#method2 - use where clause
select e.name as employee
from Employee e, Employee m 
where e.managerid = m.id and e.salary> m.salary
