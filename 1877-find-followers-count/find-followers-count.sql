select user_id, count(*) as followers_count
from Followers
group by user_id
order by 1