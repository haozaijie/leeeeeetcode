# max will take care of the null condition
select max(num) as num from 
(
    select num
    from my_numbers
    group by num
    having count(num)=1
) t;
