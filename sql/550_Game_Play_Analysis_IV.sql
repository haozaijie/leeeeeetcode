# method 1 
select round(
    (
    select count(distinct a1.player_id) as numerator
    from (select player_id, min(event_date) as first_date
          from activity
          group by player_id) a1
    join activity a2
    on a1.player_id=a2.player_id 
    and DATEDIFF(a2.event_date, a1.first_date)=1
)/(
    select count(distinct player_id) 
    from activity 
)
             ,2) as fraction;

# method 2 - use left join
select round(count(distinct a2.player_id)/
             count(distinct a1.player_id)
    ,2) as fraction
from activity a1
left join (select player_id, min(event_date) as first_date
           from activity
           group by player_id) a2
on a1.player_id=a2.player_id 
and DATEDIFF(a1.event_date, a2.first_date)=1;

 
