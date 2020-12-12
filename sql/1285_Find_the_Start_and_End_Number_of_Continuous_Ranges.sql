# the consecutive rows should have same  (actual id - rank). For the range of consecutive numbers, the start id the one with smallest id and the end id the one with largest
with cte as (
    select log_id, log_id - rank() over (order by log_id) as diff
    from logs
)

select min(log_id) as start_id, max(log_id) as end_id
from cte
group by diff;
