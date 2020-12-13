# should left join product table - this will provide sales as 0 for the product with no sales
select sales.product_id, ifnull(sum(quantity), 0) as total_quantity
from sales
left join product
on sales.product_id = product.product_id
group by sales.product_id
order by sales.product_id;
