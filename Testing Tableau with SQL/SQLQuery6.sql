select * from hrdata1;
--Employee _ account
select sum(employee_count) from hrdata1;


-- Attrition account
select *from hrdata1  where attrition='Yes'
select count(attrition) from hrdata1 where attrition='Yes';


--Attrition Rate

SELECT 
COUNT(attrition) AS attrition_count,
SUM(employee_count*100.0) AS total_employee_count
FROM hrdata1
WHERE attrition ='yes'


--Active Employee

	SELECT (SELECT SUM(employee_count))- (SELECT COUNT(attrition))
	FROM hrdata1
	WHERE attrition = 'yes'

--Average age

SELECT (ROUND(avg(age),0)) FROM hrdata1

--Attrition by Gender

SELECT gender,
	   COUNT(attrition) AS attrition_count
FROM hrdata1
WHERE attrition='yes'
GROUP BY gender 
ORDER BY attrition_count desc;

--Department wise atttrition

SELECT department,
	   COUNT(attrition),
	   ROUND(CAST(count(attrition)AS NUMERIC)*100/(COUNT(attrition)), 2) AS attrition_percentage
FROM hrdata1
WHERE attrition='yes'
GROUP BY department
ORDER BY attrition_percentage DESC;

--# of Employee by Age Group
SELECT age,
SUM(employee_count) AS employee_count 
FROM hrdata1
GROUP BY age
order by age;

--Education Field wise Attrition

SELECT education_field, 
	   COUNT(attrition) as attrition_count 
FROM hrdata1
where attrition='Yes'
group by education_field
order by attrition_count desc;

--Attrition Rate by Gender for different Age Group
select age_band, 
	   gender, 
	   COUNT(attrition) as attrition, 
       ROUND(CAST(count(attrition)AS NUMERIC)*100/(COUNT(attrition)), 2) AS attrition_percentage
from hrdata1
where attrition = 'Yes'
group by age_band,
         gender
order by age_band, 
         gender desc;









