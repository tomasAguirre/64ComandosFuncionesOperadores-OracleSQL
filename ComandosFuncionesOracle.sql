-- comandos y funciones de sql oracle usando el esquema hr y la tabla dual
-- por jonathan aguirre 2/06/2017

--1. select
select *
from jobs

--2. where 
select * 
from jobs
where job_title = 'President'

--3. order by
select *
from jobs 
order by min_salary

-- 4. order by asc
select *
from jobs 
order by min_salary asc

-- 5. order by desc
select *
from jobs 
order by min_salary desc

--6. group by
select country_name,
        region_id
from countries
group by country_name,
            region_id

--7 having
select country_name,
        region_id
from countries
group by country_name,
            region_id
having region_id = 1 

--8. as
select country_id as "abreviacion",
        country_name as "pais",
        region_id as "region"
from countries

--9. distinct
select distinct(region_id)
from countries

--10 +
select min_salary + max_salary as "suma de min y max salarios"
from jobs

--11. -
select max_salary - min_salary as "resta de max y min salarios"
from jobs

--12 / 
select max_salary / min_salary as "division de max y min salarios"
from jobs

-- 13- mod, % en sql server
select mod(min_salary,2) as "modulo del salario minimo"
from jobs

-- 14 ascii
select ascii(job_id)
from jobs

-- 15 instr, charindex en sql server
SHOW INSTR('Corporate Floor','or', 3, 2)

--16. length, len en sql server
SELECT LENGTH(job_title) 
from jobs

--17. lower
select lower(job_title)
from jobs

--18, upper
select upper(job_title)
from jobs

--19 replace no quiere funcionar
REPLACE('123123tech', '123');

--20. contac
select concat(country_id, country_name) 
from countries

-- 21 ||
select country_id || country_name
from countries

--22. abs
select abs(-2)
from dual;

--23 cos
select cos(90)
from dual;

--24 sin
select sin(90)
from dual

--25. tan
select tan(90)
from dual

--26, avg
select avg(salary)
from employees

--27 bitand
select bitand(2,3)
from dual

--28. ceil
select ceil(12.3)
from dual

-- 29. count
select count(*)
from jobs

--30. exp
select exp(3)
from dual

--31. greatest separados por coma
select greatest(2,3,4,5)
from dual

-- 32. least separado por coma
select least(1,2,3,4,5)
from dual

-- 33. ln
select ln(20)
from dual

--34. max
select max(salary)
from employees

--35 min
select min(salary)
from employees

--36 power
select power(3,2)
from dual

--37 sqrt
select sqrt(4)
from dual

--38, trunc
select trunc(3.141551,2)
from dual

--39 log
select log(10,30)
from dual

--conversion
--40 bin_to_num
select bin_to_num(1,0,0,1)

-- 41 cast super importante esta funcion--------------------
select cast('22-aug-2014' as varchar(30))
from dual

--42 to_date
select to_date('20020315', 'yymmdd')
from dual

--43 to_number
select to_number('123','999')
from dual

--44 to_char
select to_char(1234,'9999')
from dual

--45 to_single_byte
select to_single_byte('hola')
from dual

-- funciones de tiempo, fechas -------------------------------------
--46 current_date
select current_Date
from dual

--47 dbtimezone
select DBTIMEZONE
from dual;

--48 extract super importante esta funcion
select extract(year from start_date)
from job_history

-- 49 last_day
select last_day(start_date)
from job_history

-- 50 months_between
select months_between(end_date,start_date)
from job_history

-- 51 sysdate
select sysdate
from dual

--52 add_months
select add_months(end_date, 3)
from job_history

--53 user
select user
from dual

-- 54 like
select *
from job_history
where department_id like 60

--55 desc
desc job_history

--56 in 
select *
from job_history
where department_id in(50,90)

--57 initcap
select initcap(job_id)
from job_history

--58 nchr
select nchr(24)
from dual

-- 59 LENGTH2
select length2(job_id)
from job_history

-- 60 soundex
select soundex('hola')
from dual

--61 DUMP
select DUMP('androgenes')
from dual

-- 62 or
select *
from countries
where country_id like 'AR' or country_id like'AU'

-- 63 and
select *
from countries
where country_id like 'AR' and region_id = 2

-- 64 inner join on
select job_history.start_date,
        jobs.job_title
from job_history 
inner join jobs 
on job_history.job_id = jobs.job_id;


