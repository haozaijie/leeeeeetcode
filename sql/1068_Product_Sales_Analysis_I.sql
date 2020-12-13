# method 1 - join
select distinct product_name, `year`, price
from sales
join product
on sales.product_id = product.product_id;

# method 2 - sales table might have a lot of duplicate products, first select distinct from it and then join with product tables will be faster
select distinct product_name, year, price
from (select distinct product_id, year, price from sales) s
join product p
on s.product_id = p.product_id;
