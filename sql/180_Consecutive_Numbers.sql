# simple joins
select distinct l1.num as consecutivenums
from logs l1
join logs l2 
on l1.id + 1 = l2.id and l1.num =l2.num
join logs l3
on l1.id + 2 = l3.id and l1.num =l3.num

# methods that work for any consecutive number
