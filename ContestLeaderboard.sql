select h. hacker_id, h.name, new2.score
from hackers as h
right join 
(select new.hacker_id as id, sum(new.score) as score /*calculate sum score for each hacker*/
from
(select hacker_id, challenge_id, max(score) score from submissions /*find the max score of each challenge for each hacker*/
group by hacker_id, challenge_id) as new
group by new.hacker_id
having score>0) new2
on new2.id = h.hacker_id
order by new2.score desc, hacker_id