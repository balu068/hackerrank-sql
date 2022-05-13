select a.start_date, min(b.end_date)from
(select start_date 
from projects 
where start_date not in (select end_Date from projects)) a,
(select end_date
from projects
where end_date not in(select start_date from projects)) b
where a.start_date < b.end_date
group by a.start_date
order by datediff(min(b.end_date), a.start_date), a.start_date