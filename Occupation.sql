/*Join profession based on row position */


select a.name, b.name,c.name, d.name
from
(select name, row_number() over (order by name) row from OCCUPATIONS where occupation ='Doctor') a
full join 
(select name, row_number() over (order by name) row from OCCUPATIONS where occupation ='Professor') b
on a.row = b.row
full join 
(select name, row_number() over (order by name) row from OCCUPATIONS where occupation ='Singer') c
on b.row = c.row
full join 
(select name, row_number() over (order by name) row from OCCUPATIONS where occupation ='Actor') d
on b.row = d.row