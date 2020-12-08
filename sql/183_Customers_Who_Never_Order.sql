# method 1 - use not in
select name as customers
from customers c
where id not in
(select customerid from orders);

# method 2 - use not exists
select name as customers
from customers
where not exists (
    select orders.customerid from orders where orders.customerid=customers.id
);
