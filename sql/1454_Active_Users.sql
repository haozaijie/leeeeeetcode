# recursive CTE
with  recursive days_count as (
    select id, login_date, 1 as count from logins
    union all
    select l.id, l.login_date, count + 1
    from logins l
    join days_count c
    on l.id=c.id and date_add(c.login_date,interval 1 day) =     l.login_date)

select distinct a.id, a.name
from accounts a
join days_count d on d.id=a.id
where count > 4;

