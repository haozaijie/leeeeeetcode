select name, bonus
from employee e
left join bonus b
on e.empid = b.empid
where bonus is null or bonus<1000; 
