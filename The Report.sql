/*Use CASE WHEN for columns, combine ORDER with CASE WHEN for condition sorting*/
select
(case
when Marks >69 then name
else NULL
end) as name,
(case
when marks = 100 then 10
else (marks div 10)+1
end) as grade,
marks
from students
order by grade desc, case when grade > 7 then name end,
case when grade <7 then marks end asc