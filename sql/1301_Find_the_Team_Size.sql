# use window function
select employee_id, 
count(team_id) over (partition by team_id) as team_size
from employee;

# use cte
# with ts as (
#     select team_id, count(team_id) as cnt
#     from employee
#     group by team_id
# )

# select employee_id, ts.cnt as team_size
# from employee
# join ts
# on employee.team_id = ts.team_id;
