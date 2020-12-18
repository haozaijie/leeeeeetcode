select request_at as day,
case when count(status)=0 then 0.00
else round(sum(status!='completed')/count(status),2) 
end as `Cancellation Rate`
from trips t
join users c on t.client_id = c.users_id
join users d on t.driver_id = d.users_id
where c.banned= 'No' and d.banned='No'
and request_at between '2013-10-01' and '2013-10-03'
group by request_at
order by request_at;
