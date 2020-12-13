# use concat, left and substring function
# double pipe does not work in mysql, concat can be used for not just mysql and sql server
# substring(string, start, length), length parameter is optional. If omitted, the whole string from the start position will be returned
select user_id, concat(upper(left(name, 1)), lower(substring(name, 2)))  as name
from users
order by user_id;
