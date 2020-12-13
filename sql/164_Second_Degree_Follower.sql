# method 1 - join and group by 
select f1.follower, count(distinct f2.follower) as num
from follow f1
join follow f2
on f1.follower = f2.followee
where f1.follower != f2.follower
group by f1.follower
order by f1.follower;

# method 2 - subquery and where
# slice the table to get the rows where the followee who is also a follower, then group by to get num
select followee as follower, count(distinct follower) as num
from follow
where followee in (
    select  follower from follow
)
group by followee
order by followee;

# method 3 - subquery and having
# this is similar to method 3, but use having instead of where. Having is post-filter while where is pre-filter. Where should be faster than having for larget dataset. Having can be applied to aggregated data while where can only be applied to unaggregated data
select followee as follower, count(distinct follower) as num
from follow 
group by followee
having followee in (select follower from follow)
order by followee;
