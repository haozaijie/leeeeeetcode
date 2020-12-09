# method 1 - use subquery
select distinct a.player_id, a.device_id
from (
    select player_id, min(event_date) as event_date
    from activity
    group by player_id
) t
join activity a on t.player_id=a.player_id and t.event_date=a.event_date;

# method2 - T SQL using first value and partition 
select distinct player_id
    , first_value(device_id) over (partition by player_id order by event_date)  as device_id
from activity;
