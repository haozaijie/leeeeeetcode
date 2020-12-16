# method 1 - use 2 unions
select id+1 as id, student
from seat
where mod(id,2)=1 and id not in (select max(id) from seat)

union

select id-1 as id, student
from seat
where mod(id,2)=0


union 
select id, student
from seat
where mod(id,2)=1 and id=(select max(id) from seat)
order by id;

# method 2 - use nested if in select
select if(mod(id,2)=0, id-1, if(id=(select count(*) from seat), id, id+1)) as id, student
from seat
order by id;

# we can use either max id or count, because the max id will equal to the count. But count could be an expensive operation when there are many rows.
