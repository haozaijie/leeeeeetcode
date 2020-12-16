# method 1 - distinct
select distinct author_id as id
from views 
where author_id = viewer_id
order by author_id;

# method 2 - group by. interesting that we can actually use alias in group by in mysql
SELECT author_id AS id FROM Views 
where author_id = viewer_id 
GROUP BY id
order by id;
