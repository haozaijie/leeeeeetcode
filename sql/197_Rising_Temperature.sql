select w1.id 
from weather w1
join weather w2
on w1.recordDate = DATE_ADD(w2.recordDate, interval 1 day)
# can use either date_add or datediff
# on datediff(w1.recordDate, w2.recordDate)=1
and w1.temperature > w2.temperature
