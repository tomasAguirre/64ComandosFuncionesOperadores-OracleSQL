-- comandos y funciones de sql oracle usando el esquema hr y la tabla dual
-- por jonathan aguirre 2/06/2017

-- cabe aclarar antes, que la tabla dual es una tabla de una sola
-- columna y se usa para probar funciones o calculos rapidos
-- es decir por ejemplo para consultar una funcion sin aplicar dicha
-- funcion a los elementos de una tabla y probar en un solo valor
-- para mas informacion de esta tabla por favor consulte : 
-- https://docs.oracle.com/cd/B19306_01/server.102/b14200/queries009.htm

--1. select
-- la sentencia select imprime en pantalla el resultado de una 
-- consutla a una base de datos
select *
from jobs

--2. where
-- la sentencia where es un codicional de una consulta sql
-- en el se coloca la condicion de los datos que se desean ver
select * 
from jobs
where job_title = 'President'

--3. order by
-- order by es una sentencia en sql que ordena el resultado de las 
-- consultas a la base de datos sin especificar como ordenar
-- por default ordena de menor a mayor los resultados
select *
from jobs 
order by min_salary

-- 4. order by asc
-- order by asc ordena en forma asendete los resultados del a consulta
select *
from jobs 
order by min_salary asc

-- 5. order by desc
-- order by desc ordena en forma desendente los resultados de la consulta
select *
from jobs 
order by min_salary desc

--6. group by
-- group by permite agregar funciones (count, max, min, sum..)
-- agrupando el resultado en columnas 
select country_name,
        region_id
from countries
group by country_name,
            region_id

--7 having
-- having es como la sentencia where pero se usa cuando se usa group by
select country_name,
        region_id
from countries
group by country_name,
            region_id
having region_id = 1 

--8. as
-- as es una sentencia que permite colocar un alias "otro nombre" a una columna
select country_id as "abreviacion",
        country_name as "pais",
        region_id as "region"
from countries

--9. distinct
-- distinct sirve para filtrar resultados que poseen el mismo valor
-- a que se muestre una unica ves el valor que se repite varias veces el 
-- valor que resulta de la consulta
select distinct(region_id)
from countries

--10 +
-- + es un operador matematico que puede usarse para sumar numeros
-- o sumarle dias a una fecha
select min_salary + max_salary as "suma de min y max salarios"
from jobs

--11. -
-- - es un operador matematico que puede usarse para restar numeros
-- o restar dias a una fecha
select max_salary - min_salary as "resta de max y min salarios"
from jobs

--12 / 
-- / es un operador matematico que sirve para dividir 2 numeros
select max_salary / min_salary as "division de max y min salarios"
from jobs

-- 13- mod, % en sql server
-- mod sirve para obtener el modulo (residuo) de 2 numeros divididos
-- mod(dividendo, divisor)
select mod(min_salary,2) as "modulo del salario minimo"
from jobs

-- 14 ascii
-- ascii es una funcion que retorna el codigo numerico 
-- que representa dicho caracter
select ascii(job_id)
from jobs

-- 15 instr, charindex en sql server
-- instr busca una sub cadena en una cadena indicando la
-- posicion inicial de busqueda y otro valor que seria la
-- n-esima aparicion de la cadena si se omite esta valor es 1
Select INSTR('Corporate Floor','or', 3, 2)
from dual;

--16. length, len en sql server
-- esta funcion retorna el tamaño de una cadena de texto
SELECT LENGTH(job_title) 
from jobs

--17. lower
-- esta funcion convierte todas las letras de una cadena de texto
-- en sus respectivos caracteres en minuscula
select lower(job_title)
from jobs

--18, upper
-- esta funcion convierte todas las letras de una cadena de texto
-- en sus respectivos caracteres en mayuscula
select upper(job_title)
from jobs


--19 replace 
-- la funcion replace quita los caracteres que se colocan como
-- segundo parametro de la funcion de la cadena que se coloca como
-- primer parametro de la funcion
select REPLACE('123123tech', '123')
from dual;

--20. concat
-- concat sirve para concatenar dos canedas de caracteres 
select concat(country_id, country_name) 
from countries

-- 21 ||
-- || es similar a concat concatena caracteres
select country_id || country_name
from countries

--22. abs
-- abs calcula el valor absoluto de un numero
select abs(-2)
from dual;

--23 cos
-- calcula el coseno de un numero
select cos(90)
from dual;

--24 sin
-- calcula el seno de un numero
select sin(90)
from dual

--25. tan
-- calcula la tangente de un numero
select tan(90)
from dual

--26, avg
-- calcula el valor promedio de un conjunto de numeros
select avg(salary)
from employees

--27 bitand
-- esta funcion retorna un entero que representa una operacion and 
-- entre los bites de los numeros que se ingresas como parametros
select bitand(2,3)
from dual

--28. ceil
-- la funcion ceil redondea un numero entero
select ceil(12.3)
from dual

-- 29. count
-- count cuenta la cantidad de registros devueltos por una consulta
select count(*)
from jobs

--30. exp
-- exp es la funcion matematica de logaritmo e = 2.71828183....
select exp(3)
from dual

--31. greatest separados por coma
-- retorna el valor mas grande de un conjunto de numeros separados por comas
select greatest(2,3,4,5)
from dual

-- 32. least separado por coma
-- retorna el menor valor de un conjunto de numeros separados por comas
select least(1,2,3,4,5)
from dual

-- 33. ln
-- funcion matematica que retorna el logaritmo natural de un numero
select ln(20)
from dual

--34. max
-- funcion que retorna el mayor valor de todos los registros de una consulta
select max(salary)
from employees

--35 min
-- funcion que retorna el menor valor de todos los registros de una consulta
select min(salary)
from employees

--36 power
-- funcion potencia en la cual el primer argumento se eleva a la 
-- potencia del segundo argumento
select power(3,2)
from dual

--37 sqrt
-- funcion matematica que retorna la raiz cuadrada de un numero
select sqrt(4)
from dual

--38, trunc
-- funcion que trunca los decimales de un numero
-- dejando la cantidad de decimales equivalentes a el segundo parametro
select trunc(3.141551,2)
from dual

--39 log
-- logaritmo del primer_parametro base segundo_parametro
select log(10,30)
from dual

--conversion
--40 bin_to_num
-- convierte un nuero binario a un numero entero
select bin_to_num(1,0,0,1)
from dual;

-- 41 cast super importante esta funcion--------------------
-- convierte una valor al valor que especifiquemos despues del as
select cast('22-aug-2014' as varchar(30))
from dual

--42 to_date
-- convierte un valor numerico a un valor de fecha
-- se tiene que especificar el formato de la fecha 
-- como segundo parametro
select to_date('20020315', 'yymmdd')
from dual

--43 to_number
-- convierte caracteres a numeros
select to_number('123','999')
from dual

--44 to_char
-- convierte de numeros a caracteres
select to_char(1234,'9999')
from dual

--45 to_single_byte
-- esta funcion retorna caracteres converidos
-- a su correspodiente caracter single byte
select to_single_byte('hola')
from dual

-- funciones de tiempo, fechas -------------------------------------
--46 current_date
-- retorna la fecha actual
select current_Date
from dual

--47 dbtimezone
-- retorna el uso horario de la base de datos
select DBTIMEZONE
from dual;

--48 extract super importante esta funcion
-- esta funcion retorna el dia, mes, año, ect
-- de una fecha (se tiene que especificar que se desea extraer de la fecha)
select extract(year from start_date)
from job_history

-- 49 last_day
-- esta funcion retorna el ultimo dia de un mes de una respectiva fecha
select last_day(start_date)
from job_history

-- 50 months_between
-- esta funcion retorna la cantidad de meses entre 2 fechas
select months_between(end_date,start_date)
from job_history

-- 51 sysdate
-- esta funcion retorna la fecha del sistema
select sysdate
from dual

--52 add_months
-- esta funcion permite agregar meses a una fecha
select add_months(end_date, 3)
from job_history

--53 user
-- esta funcion permite determinar el actual usuario conectado
select user
from dual

-- 54 like
-- like es similar a = se usa para expresiones regulares 
select *
from job_history
where department_id like 60

--55 desc
-- describe una tabla, vista, sinonimo, paquete o funcion
desc job_history

--56 in 
-- in permite realizar una busqueda entre un conjunto de datos
-- que retorne la consulta 
select *
from job_history
where department_id in(50,90)

--57 initcap
-- esta funcion muestra el primer caracter de una cadena de texto
-- en mayuscula y el resto de los caracteres en minuscula
select initcap(job_id)
from job_history

--58 nchr
-- esta funcion retorna un caracter basado en el codigo numerico
-- internacional establecido
select nchr(84)
from dual

-- 59 LENGTH2
-- retorna el tamaño de una cadena de texto usando
-- el codigo de puntos ucs2
select length2(job_id)
from job_history

-- 60 soundex
-- retorna la representacion fonetica (la manera en que suena)
select soundex('hola')
from dual

--61 DUMP
-- retorna una cadena varcha2 cuyo valor incluye el codigo de tipo de data
-- el tamaño en bytes y la representacion interna de la expersion
select DUMP('androgenes')
from dual

-- 62 or
-- este es un operador logico que 
-- con una condicion que se cumpla se realizara la consulta 
select *
from countries
where country_id like 'AR' or country_id like'AU'

-- 63 and
-- este es un operador logico que 
-- obliga que 2 condiciones se cumplan para realizar una consulta
select *
from countries
where country_id like 'AR' and region_id = 2

-- 64 inner join on
-- inner join permite enlazar datos entre tablas para realizar consultas
-- siempre y cuando las tablas tengan algun termino en comun 
select job_history.start_date,
        jobs.job_title
from job_history 
inner join jobs 
on job_history.job_id = jobs.job_id;


