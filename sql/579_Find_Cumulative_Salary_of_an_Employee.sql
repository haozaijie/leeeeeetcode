select id, month, 
sum(salary) over (partition by id order by month asc 
                  rows between 2 preceding  and current row) as salary
from employee
where (id, month) not in (select id, max(month) from employee group by id)
order by id asc, month desc;
