(select Concat(Name,"(", substr(Occupation,1,1),")") from OCCUPATIONS order by Name) /*Alphabetically ordered list of all names with first letter of profession*/
union
(select Concat('There are a total of ',count(occupation),' ',lower(occupation),'s.') from OCCUPATIONS group by occupation order by count(occupation)) /*Count amount for each profession*/