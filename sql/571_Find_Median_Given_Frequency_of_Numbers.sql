with temp as (
    select number, frequency, sum(frequency) over (order by number rows     between unbounded preceding and current row) as cnt
    from numbers
),
total as (select sum(frequency) as total_cnt from numbers )

select ((select number from temp
        where cnt>= (select floor((total_cnt+1)/2) from total) 
        limit 1) + (select number from temp 
        where cnt>= (select floor((total_cnt+2)/2) from total)
        limit 1))/2 as median;
