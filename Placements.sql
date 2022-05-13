select students.name
from students,
(select f.id as id, p1.salary as ss, p2.salary as fs
from friends as f, packages as p1, packages as p2
where p1.id = f.id and p2.id = f.friend_id) as new
where new.fs>new.ss and students.id = new.id
order by new.fs