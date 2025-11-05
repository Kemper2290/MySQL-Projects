select *
from parks_and_recreation.employee_salary
where first_name = 'Leslie';

select * 
from parks_and_recreation.employee_salary
where salary >= 50000;


select * 
from parks_and_recreation.employee_demographics
where (first_name="Leslie" and age = 44 ) or age > 55;

select * 
from parks_and_recreation.employee_salary
where first_name like 'a__%'
;


select gender
from parks_and_recreation.employee_demographics
group by gender;



select gender, avg(age)
from parks_and_recreation.employee_demographics
group by gender;

select occupation, salary
from parks_and_recreation.employee_salary
group by occupation, salary
;


select gender, avg(age), max(age), min(age), count(age)
from parks_and_recreation.employee_demographics
group by gender;

select *
from parks_and_recreation.employee_demographics
order by gender, age desc
;


select gender, avg(age)
from parks_and_recreation.employee_demographics
group by gender
having avg(age) > 40
;

select occupation, avg(salary)
from parks_and_recreation.employee_salary
where occupation like '%manager%'
group by occupation
having avg(salary) > 75000
;


select *
from parks_and_recreation.employee_demographics;

select *
from parks_and_recreation.employee_salary;

select *
from parks_and_recreation.employee_demographics
inner join parks_and_recreation.employee_salary
	on employee_demographics.employee_id=employee_salary.employee_id
;

select dem.employee_id, age, occupation
from parks_and_recreation.employee_demographics as dem
inner join parks_and_recreation.employee_salary as sal
	on dem.employee_id=sal.employee_id
;

-- outer joins


select *
from parks_and_recreation.employee_demographics as dem
left join parks_and_recreation.employee_salary as sal
	on dem.employee_id=sal.employee_id
;


select *
from parks_and_recreation.employee_demographics as dem
right join parks_and_recreation.employee_salary as sal
	on dem.employee_id=sal.employee_id
;

-- self join

select emp1.employee_id as emp_santa, emp1.first_name as first_name_santa,emp1.last_name as last_name_santa,
	emp2.employee_id as emp_name, emp2.first_name as first_name_emp,emp2.last_name as last_name_emp
from parks_and_recreation.employee_salary emp1
join parks_and_recreation.employee_salary emp2
	on emp1.employee_id + 1= emp2.employee_id
;



-- joining multiple tables together

select *
from parks_and_recreation.employee_demographics as dem
inner join parks_and_recreation.employee_salary as sal
	on dem.employee_id=sal.employee_id
    
inner join parks_and_recreation.parks_departments as pd
	on sal.dept_id = pd.department_id
;

select * 
from parks_and_recreation.parks_departments
;


-- Unions

select first_name, last_name
from parks_and_recreation.employee_demographics
union all
select first_name, last_name
from parks_and_recreation.employee_salary
;


select first_name, last_name, 'Old Man' as Label
from parks_and_recreation.employee_demographics
where age > 40 and gender = "Male"
union
select first_name,last_name, "Old Lady" as Label 
from parks_and_recreation.employee_demographics
where age > 40 and gender = "Female"
union
select first_name,last_name, "Highly Paid Employee" as label
from parks_and_recreation.employee_salary
where salary  > 70000
;

-- string functions

select length("skyfall");

select first_name, Length(first_name)
from parks_and_recreation.employee_demographics
order by 2;


-- case statement

select first_name, last_name, age, 
case
	when age <= 30 then "Young"
    when age between 31 and 50 then "Old"
    when age >= 50 then "On Deaths door"
end as age_bracket
from parks_and_recreation.employee_demographics
;

-- pay increase and bonus
-- < 50000 = 5%
-- > 50000 = 7%
-- finance = 10% bonus

select first_name, last_name, salary,
case
	when salary < 50000 then salary*1.05
    when salary > 50000 then salary*1.07
	when dept_id = 6 then salary*1.1
end as NEW_Salary
from parks_and_recreation.employee_salary
;

-- subqueries

select * 
from employee_demographics
where employee_id in 
					( select employee_id
						from employee_salary
                        where dept_id = 1)


;

select first_name, salary,
(select avg(salary) from employee_salary)
from employee_salary

;

select gender, avg( age), max(age), min(age), count(age)
from employee_demographics
group by gender
;

select avg(age)
from employee_demographics
;





