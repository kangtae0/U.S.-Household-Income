SELECT * 
FROM US_Project.us_household_income;

SELECT * 
FROM US_Project.us_household_income_statistics;


#Looking the biggest land and many water by state
#TOP 10 Land
SELECT State_Name, SUM(ALand), SUM(AWater)
FROM US_Project.us_household_income
GROUP BY State_Name
ORDER BY 2 desc
LIMIT 10;

#TOP 10 Water
SELECT State_Name, SUM(ALand), SUM(AWater)
FROM US_Project.us_household_income
GROUP BY State_Name
ORDER BY 3 desc
LIMIT 10;


#Excluding where the mean is 0
SELECT *
FROM US_Project.us_household_income u
INNER JOIN US_Project.us_household_income_statistics us
	ON u.id=us.id
WHERE Mean <> 0;

#checking the average of income by states
SELECT u.State_Name, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM US_Project.us_household_income u
INNER JOIN US_Project.us_household_income_statistics us
	ON u.id=us.id
WHERE Mean <> 0
GROUP BY u.State_Name
ORDER BY 2 desc
LIMIT 10
;

SELECT Type, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM US_Project.us_household_income u
INNER JOIN US_Project.us_household_income_statistics us
	ON u.id=us.id
WHERE Mean <> 0
GROUP BY Type
ORDER BY 1 desc
LIMIT 10
;

#Type of areas which has the highest income
SELECT Type, COUNT(Type), ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM US_Project.us_household_income u
INNER JOIN US_Project.us_household_income_statistics us
	ON u.id=us.id
WHERE Mean <> 0
GROUP BY Type
ORDER BY 3 desc
LIMIT 20
;

SELECT Type, COUNT(Type), ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM US_Project.us_household_income u
INNER JOIN US_Project.us_household_income_statistics us
	ON u.id=us.id
WHERE Mean <> 0
GROUP BY Type
HAVING COUNT(Type)>100
ORDER BY 4 desc
LIMIT 20
;

#Looking which state is a type of community whuch is a lowest income
SELECT *
FROM US_Project.us_household_income u
WHERE Type='Community';

#Looking which city in state have the highest income
SELECT u.State_Name, City,  ROUND(AVG(Mean),1) AS Average_Income, ROUND(AVG(Median ),1)
FROM US_Project.us_household_income u
JOIN US_Project.us_household_income_statistics us
	ON u.id=us.id
GROUP BY u.State_Name, City
ORDER BY 3 desc;
    
    
    
    
    
    
    
    