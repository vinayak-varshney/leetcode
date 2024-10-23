select 
    s1.student_id,
    s1.student_name,
    s2.subject_name, 
    count(s3.student_id) as attended_exams 
from students s1
CROSS JOIN 
    subjects s2
LEFT JOIN 
    examinations s3
on s3.student_id=s1.student_id
AND s2.subject_name = s3.subject_name
group by s1.student_id,s1.student_name,s2.subject_name
ORDER BY 
    s1.student_id, s2.subject_name;

