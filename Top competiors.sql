select new.hacker_id, h.name
from
(select s.hacker_id as hacker_id, sum(s.score - d.score) as score, count(*) as count
from submissions as s
left join challenges as c
on s.challenge_id = c.challenge_id
/* Join s table with c table before join d table to set the condition*/
left join difficulty as d
on d.difficulty_level = c.difficulty_level
group by s.hacker_id, (s.score - d.score)
having score = 0) as new, /*condition between table s and d after merged*/
hackers as h
where new.hacker_id = h.hacker_id and new.count >1 /*merge with table h to get the name column*/
order by new.count desc, new.hacker_id