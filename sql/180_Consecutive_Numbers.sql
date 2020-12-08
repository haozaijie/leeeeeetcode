# simple joins
select distinct l1.num as consecutivenums
from logs l1
join logs l2 
on l1.id + 1 = l2.id and l1.num =l2.num
join logs l3
on l1.id + 2 = l3.id and l1.num =l3.num

# recursive CTE which works for any consecutive number
with recursive T(id,num,C) as (
    select l1.id, l1.num, 1 
    from logs l1
           
    union all
           
    select l2.id, l2.num, T.C+1
    from T
    join logs l2 on T.id + 1 =l2.id and T.num=l2.num
)
select distinct num as ConsecutiveNums
from T
where T.C >=3;
