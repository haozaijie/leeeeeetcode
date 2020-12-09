# method 1 - sub-query
select 
(
    select distinct salary 
    from employee
    order by salary desc
    limit 1 offset 1
) as secondhighestsalary;

# method 2 - ifnull
select ifnull(
    (
        select distinct salary 
        from employee
        order by salary desc
        limit 1 offset 1
    ),
    null
) as secondhighestsalary
