# method 1
select distinct p1.email
from person p1
join person p2
on p1.email=p2.email and p1.id<p2.id

# method 2 - use group by and having
select email
from person
group by email
having count(email)>1;

