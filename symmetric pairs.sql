/*Check the symmetric with notice: 1. must have at least 2 similar pairs if x=y; 2. use condition x>y or y>x only for remove duplicate*/
select new.x,new.y from
(select f1.x as x,f1.y as y, count(*) as c
from functions f1, functions f2
where f1.x=f2.y and f2.x=f1.y
group by f1.x,f1.y) as new
where new.y>new.x or (new.y=new.x and c>1)
order by new.x