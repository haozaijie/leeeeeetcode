#method 1 - use dense_rank()
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      select salary
      from
          (select distinct dense_rank() over (order by salary desc) rnk,
           salary
           from employee
           ) t
      where rnk=N 
  );
END

# method 2 - use limit offset and ifnull
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
declare M int;
set M=N-1;
  RETURN (
      # Write your MySQL query statement below.
      select ifnull(
          (select distinct salary
           from employee
           order by salary desc
           limit 1 offset M
           ), null
      )
  );
END
