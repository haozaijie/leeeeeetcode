# method 1 - subquery 
select product_id, year as first_year, quantity, price
from sales
where (product_id, year) in (
    select product_id, min(year) over(partition by product_id)
    from sales
);

# method 2 - inner join(more efficient compared to inner join)
select s.product_id, s.year as first_year, quantity, price
from sales s
inner join (
    select distinct product_id, min(year) over(partition by product_id) as min_year
    from sales
) t
on s.product_id=t.product_id
and s.year=t.min_year;
