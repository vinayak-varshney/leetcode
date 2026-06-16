select max(num) as num from (
    select num, count(*) as count
    from Mynumbers
    group by num
    having count=1
) as unique_num