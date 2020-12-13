# method 1 - subquery and union
select product_id, new_price as price
from products
where (product_id, change_date) in 
    (select product_id, max(change_date) as recent_date
    from products
    where change_date <='2019-08-16'
    group by product_id
    )

union all

select product_id, 10 as price
from products
group by product_id
having min(change_date) > '2019-08-16';


# method 2 - left join and if null
select distinct p.product_id, ifnull(t.new_price, 10) as price
from products p
left join 
    (select *
     from products
     where (product_id, change_date) in
         (select product_id, max(change_date) as recent_date
          from products
          where change_date <='2019-08-16'
          group by product_id 
         )
    ) t   
on p.product_id =t.product_id;
