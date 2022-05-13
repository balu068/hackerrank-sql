/*Join 5 table together based on company_code*/

select c.company_code, c.founder, l.lead,s.senior,m.manager,e.employee
from company as c
left join (select count(distinct lead_manager_code) as lead, company_code from employee group by company_code) as l
on l.company_code = c.company_code
left join (select count(distinct senior_manager_code) as senior, company_code from employee group by company_code) as s
on s.company_code = c.company_code
left join (select count(distinct manager_code) as manager, company_code from employee group by company_code) as m
on m.company_code = c.company_code
left join (select count(distinct employee_code) as employee, company_code from employee group by company_code) as e
on e.company_code = c.company_code
order by c.company_code