with cte as (select candidateid, count(candidateid)
            from vote
            group by candidateid
            order by count(candidateid) desc
            limit 1)
select name from
candidate
join cte
on candidate.id = cte.candidateid;
