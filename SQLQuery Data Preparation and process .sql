/*

Process Data 

*/

-- I use Microsoft Excel and SQL for cleaning and analyzing data, and Tableau for visualization.


-- Data Preparation (Cleaning & Processing)

select *
from [bellabeat].[dbo].[daily_activity]


-- Identify and Remove Duplicate Values

SELECT *, 
COUNT(*) AS duplicatecount
FROM [bellabeat].[dbo].[daily_activity]
GROUP BY id,
ActivityDate,
TotalSteps,
TotalDistance,
TrackerDistance,
LoggedActivitiesDistance,
VeryActiveDistance,
ModeratelyActiveDistance,
LightActiveDistance,
SedentaryActiveDistance,
VeryActiveMinutes,
FairlyActiveMinutes,
LightlyActiveMinutes,
SedentaryMinutes,
Calories
HAVING COUNT(*) >1;


-- Identify and Remove Null Values

SELECT * 
FROM [bellabeat].[dbo].[daily_activity]
WHERE  Id IS NULL 
OR ActivityDate IS NULL
OR TotalSteps IS NULL
OR TotalDistance IS NULL
OR TrackerDistance IS NULL
OR VeryActiveMinutes IS NULL
OR SedentaryMinutes IS NULL
OR Calories IS NULL;




