/* Find the median of the list by numbering the rows -> find the mid position -> reference to find the median */
select round(n1.lat_n,4) from
(select row_number() over (order by lat_n) as r, lat_n from STATION) as n1, (select ((count(lat_n)+1) div 2) as c from STATION) as n2
where n2.c = n1.r