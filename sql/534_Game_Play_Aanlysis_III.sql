# method 1 - window function
select player_id, event_date,
sum(games_played) over (partition by player_id order by event_date asc) as games_played_so_far
from activity a1
order by player_id asc, event_date desc;


# method 2 - inner join and group by
select a1.player_id, a1.event_date, sum(a2.games_played) as games_played_so_far
from activity a1
join activity a2
on a1.player_id = a2.player_id
and a1.event_date >= a2.event_date
group by a1.player_id, a1.event_date
order by a1.player_id, a1.event_date;

