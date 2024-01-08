SELECT *
FROM US_Project.us_household_income;
 
 
 SELECT *
 FROM US_Project.us_household_income_statistics;


#REMOVING DUPLICATES by ID
SELECT id, COUNT(id)
FROM US_Project.us_household_income
GROUP BY id
HAVING COUNT(id) >1;



SELECT *
FROM(
SELECT row_id,
id,
ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) row_num
FROM US_Project.us_household_income) duplicates
WHERE row_num>1
;


DELETE FROM US_Project.us_household_income
WHERE row_id IN (
	SELECT row_id
	FROM(
		SELECT row_id,
		id,
		ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) row_num
		FROM US_Project.us_household_income
        ) duplicates
	WHERE row_num>1)
;
 
 #Checking duplicates for the other table
SELECT id, COUNT(id)
FROM US_Project.us_household_income_statistics
GROUP BY id
HAVING COUNT(id) >1;
 
 #Checking spelling mistakes for states
 SELECT DISTINCT(State_Name)
FROM US_Project.us_household_income
ORDER BY 1;
 
 UPDATE US_Project.us_household_income
 SET State_Name='Georgia'
 WHERE State_Name='georia';
 
 
  UPDATE US_Project.us_household_income
 SET State_Name='Alabama'
 WHERE State_Name='alabama';
 
 #Finding where the Place is Null
SELECT *
FROM US_Project.us_household_income
WHERE Place=''
ORDER BY 1;

SELECT *
FROM US_Project.us_household_income
WHERE County='Autauga County'
ORDER BY 1;

#Filling the Null Place
UPDATE US_Project.us_household_income
SET Place='Autaugaville'
WHERE County='Autauga County'
AND City='Vinemont';

#Checking the duplicates of Types
SELECT Type, COUNT(Type)
FROM US_Project.us_household_income
GROUP BY Type;

UPDATE US_Project.us_household_income
SET Type='Borough'
WHERE Type='Boroughs';



#Checking where water and land is 0, blank or null
SELECT ALand, AWater
FROM US_Project.us_household_income
WHERE (AWater=0 OR AWater='' OR AWater IS NULL)
And (ALand=0 OR ALand='' OR ALand IS NULL);
 
 



 
 