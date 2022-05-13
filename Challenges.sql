select c.hacker_id, h.name, count(c.challenge_id) total
from challenges as c, hackers as h
where h.hacker_id = c.hacker_id
group by c.hacker_id, h.name
having count(c.challenge_id) not in 
    (select new2.total2 from
                    /* count the number hacker that create the same amount of challenge to exclude if the amount of challenge not max*/
        (select count(new.hacker_id) c, new.total1 as total2 from
                    /*count the challenge that each hacker created */
            (select count(c.challenge_id) as total1, c.hacker_id as hacker_id
            from challenges as c
            group by c.hacker_id) new  
        group by new.total1
        having count(new.hacker_id) >1) new2
        order by new2.total2 desc
        offset 1 rows) /*exclude the max from the list to keep it in the result*/
order by total desc, c.hacker_id