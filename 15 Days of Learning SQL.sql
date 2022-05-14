with data1 as (select temp1.submission_date submission_date, count(temp1.hacker_id) count from
(select s.submission_date submission_date, s.hacker_id hacker_id, row_number() over (partition by hacker_id order by submission_date) day_join, datediff(day,'2016-03-01',submission_date)+1 datediff
from Submissions as s
group by s.submission_date, s.hacker_id) as temp1
where temp1.datediff = temp1.day_join
group by temp1.submission_date)

select temp1.submission_date, data1.count, temp1.hacker_id, h.name from
(select temp.submission_date, temp.hacker_id, row_number() over (partition by temp.submission_date order by temp.sub_count desc, temp.hacker_id) sub_rank from
(select s.submission_date, s.hacker_id, count(s.submission_id) as sub_count
from submissions as s
group by s.submission_date, s.hacker_id) as temp) as temp1
left join data1
on data1.submission_date=temp1.submission_date
left join hackers h
on temp1.hacker_id = h.hacker_id
where temp1.sub_rank =1