select w.id, p.age, w.coins_needed, w.power
from Wands as w
join Wands_Property as p
on (w.code = p.code)
where p.is_evil = 0 /*condition to exclude the evil wands*/
and w.coins_needed =  (SELECT MIN(coins_needed) FROM Wands WHERE code = w.code AND power = w.power) /* find min coins by self join */
order by w.power desc, p.age desc