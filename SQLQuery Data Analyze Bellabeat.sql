/*

Analyze Data 

*/


-- View the trend of users steps per day (with Day of Week)

SELECT 
    CONVERT(DATE, ActivityDate) AS ActivityDate,
    DATENAME(WEEKDAY, ActivityDate) AS DayOfWeek,
    ROUND(AVG(TotalSteps), 0) AS average_steps
FROM [bellabeat].[dbo].[daily_activity]
GROUP BY CONVERT(DATE, ActivityDate)
ORDER BY ActivityDate;



-- Determine the most active hour of the day.

SELECT DATEPART(HOUR, ActivityHour) AS hour,
ROUND(AVG(TotalSteps), 2) AS average_steps
FROM [bellabeat].[dbo].[hourly_activity]
GROUP BY DATEPART(HOUR, ActivityHour)
ORDER BY average_steps DESC;



-- Average Sleep Duration per Day

SELECT 
CONVERT(DATE, SleepDay) AS sleepdate,
DATENAME(WEEKDAY, SleepDay) AS DayOfWeek,
ROUND(AVG(TotalMinutesAsleep) / 60, 2) AS average_sleep
FROM [bellabeat].[dbo].[sleep_day]
GROUP BY SleepDay
ORDER BY sleepdate ;



-- Average Sleep Duration per Day and Per User

SELECT id, CONVERT(DATE, SleepDay) AS sleepdate,
ROUND(AVG(TotalMinutesAsleep) / 60, 2) AS average_sleep
FROM [bellabeat].[dbo].[sleep_day]
GROUP BY id, CONVERT(DATE, SleepDay)
ORDER BY sleepdate;



-- Correlation Between Activity and Sleep  (with Day of Week)

SELECT 
	DATENAME(WEEKDAY, activity.ActivityDate) AS DayOfWeek,  
    activity.TotalSteps, 
    sleep.totalMinutesAsleep / 60 AS TotalSleepHour
FROM [bellabeat].[dbo].[daily_activity] AS activity
JOIN [bellabeat].[dbo].[sleep_day] AS sleep
ON activity.id = sleep.id



-- Analysis of Calories Burned Based on Activity (with Day of Week)

SELECT 
DATENAME(WEEKDAY, TotalSteps) AS DayOfWeek,  
TotalSteps, SUM(Calories) AS total_calories
FROM [bellabeat].[dbo].[daily_activity] 
GROUP BY TotalSteps, Id
ORDER BY TotalSteps DESC;



-- Daily Average Heart Rate vs Total Steps
-- Make sure User Id is same

SELECT   
	CAST(activity.ActivityDate AS DATE) AS Date,
    activity.TotalSteps, 
    AVG(CAST(heart_rate.Value AS INT)) AS avg_heart_rate
FROM [bellabeat].[dbo].[daily_activity] AS activity
JOIN [bellabeat].[dbo].[heartrate_seconds] AS heart_rate
ON CAST(activity.ActivityDate AS DATE) = CAST(heart_rate.Time AS DATE)
AND activity.Id = heart_rate.Id  
GROUP BY activity.TotalSteps, activity.ActivityDate
ORDER BY Date;





