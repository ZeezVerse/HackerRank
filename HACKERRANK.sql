/*Query all columns for all American cities in the CITY table with populations larger than 100000. 
The CountryCode for America is USA*/.
select *
from city
where countrycode = "USA" AND population > 100000;

/*
Query the NAME field for all American cities in the CITY table with populations larger than 120000. 
The CountryCode for America is USA
*/
select name
from city
where countrycode = "USA" and population > 120000;

--Query all columns (attributes) for every row in the CITY table
SELECT*
FROM CITY

--Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.
select*
from city
where countrycode = "JPN";

--Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.
SELECT NAME
FROM CITY
WHERE COUNTRYCODE = "JPN";

--Query a list of CITY and STATE from the STATION table.
SELECT CITY,STATE
FROM STATION;

/*
Query a list of CITY names from STATION for cities that have an even ID number. 
Print the results in any order, but exclude duplicates from the answer.
*/
--Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
select count(city)- count(distinct(city))
from station;

/*
Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). 
If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
*/
select city,length(city)
from station
where length(city) = (select max(length(city)) from station);
select city,length(city)
from station
where length(city) = (select min(length(city)) from station)                  
order by city
limit 1;

--Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
select distinct(city)
from station
where city REGEXP '^[aeiou]';

--Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
select distinct(city)
from station
where city REGEXP '[aeiou]$';

/*
Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. 
Your result cannot contain duplicates.
*/
SELECT DISTINCT CITY
FROM STATION 
WHERE  (CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE 'O%' OR CITY LIKE 'U%') AND (CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u') ;


--Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates
SELECT DISTINCT CITY
FROM STATION 
WHERE NOT  (CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE 'O%' OR CITY LIKE 'U%');

--Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates
SELECT DISTINCT CITY
FROM STATION 
WHERE NOT (CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u') ;

/*
Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. 
Your result cannot contain duplicates.
*/
SELECT DISTINCT CITY
FROM STATION 
WHERE NOT ((CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE 'O%' OR CITY LIKE 'U%') AND (CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u')) ;

/*
Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. 
Your result cannot contain duplicates.*/
SELECT DISTINCT CITY
FROM STATION 
WHERE NOT ((CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE 'O%' OR CITY LIKE 'U%') OR (CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u')) ;

/*
Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your output by the last three characters of each name. 
If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
*/
SELECT Name
FROM STUDENTS
WHERE Marks > 75
ORDER BY RIGHT (Name,3), ID;

--Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
select name
from employee
order by name asc;

/*
Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than 2000  per month 
who have been employees for less than 10 months. Sort your result by ascending employee_id.
*/
select name
from employee
where salary > 2000 and months < 10
order by employee_id asc;