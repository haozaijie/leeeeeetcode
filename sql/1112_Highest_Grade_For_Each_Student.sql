# use rank() over partition by
select student_id, course_id, grade
from (
    select student_id, course_id, grade,
    rank() over (partition by student_id order by grade desc, course_id) as rnk
    from enrollments) t
where rnk =1;
