# Look at the raw file to copy code (better formatting too)
### Select Queries
1. Daily Temperatures

SELECT 
    DATE_TRUNC('day', TIMESTAMP) AS Date,
    AVG(CLDCVR) AS Avg_CLDCVR,
    AVG(FEELSLIKE) AS Avg_FEELSLIKE,
    AVG(PRECIP) AS Avg_PRECIP,
    AVG(RELHUM) AS Avg_RELHUM,
    AVG(SNOWFALL) AS Avg_SNOWFALL,
    AVG(TEMP) AS Avg_TEMP,
    AVG(WINDDIR) AS Avg_WINDDIR,
    AVG(WINDSPD) AS Avg_WINDSPD
FROM 
    weather_data
GROUP BY 
    Date
ORDER BY 
    Date;


2. Weekly Temperatures

SELECT 
    DATE_TRUNC('week', TIMESTAMP) AS Week_Start_Date,
    AVG(CLDCVR) AS Avg_CLDCVR,
    AVG(FEELSLIKE) AS Avg_FEELSLIKE,
    AVG(PRECIP) AS Avg_PRECIP,
    AVG(RELHUM) AS Avg_RELHUM,
    AVG(SNOWFALL) AS Avg_SNOWFALL,
    AVG(TEMP) AS Avg_TEMP,
    AVG(WINDDIR) AS Avg_WINDDIR,
    AVG(WINDSPD) AS Avg_WINDSPD
FROM 
    weather_data
GROUP BY 
    Week_Start_Date
ORDER BY 
    Week_Start_Date;


3. Monthly Temperatures

SELECT 
    DATE_TRUNC('month', TIMESTAMP) AS Month_Start_Date,
    AVG(CLDCVR) AS Avg_CLDCVR,
    AVG(FEELSLIKE) AS Avg_FEELSLIKE,
    AVG(PRECIP) AS Avg_PRECIP,
    AVG(RELHUM) AS Avg_RELHUM,
    AVG(SNOWFALL) AS Avg_SNOWFALL,
    AVG(TEMP) AS Avg_TEMP,
    AVG(WINDDIR) AS Avg_WINDDIR,
    AVG(WINDSPD) AS Avg_WINDSPD
FROM 
    weather_data
GROUP BY 
    Month_Start_Date
ORDER BY 
    Month_Start_Date;


### Create Table Queries

1. Daily Temperatures

CREATE TABLE daily_weather_data AS
SELECT
    DATE_TRUNC('day', TIMESTAMP) AS Date,
    AVG(CLDCVR) AS Avg_CLDCVR,
    AVG(FEELSLIKE) AS Avg_FEELSLIKE,
    AVG(PRECIP) AS Avg_PRECIP,
    AVG(RELHUM) AS Avg_RELHUM,
    AVG(SNOWFALL) AS Avg_SNOWFALL,
    AVG(TEMP) AS Avg_TEMP,
    AVG(WINDDIR) AS Avg_WINDDIR,
    AVG(WINDSPD) AS Avg_WINDSPD
FROM weather_data
GROUP BY Date
ORDER BY Date;

2. Weekly Temperatures

CREATE TABLE weekly_weather_data AS
SELECT 
    DATE_TRUNC('week', TIMESTAMP) AS Week_Start_Date,
    AVG(CLDCVR) AS Avg_CLDCVR,
    AVG(FEELSLIKE) AS Avg_FEELSLIKE,
    AVG(PRECIP) AS Avg_PRECIP,
    AVG(RELHUM) AS Avg_RELHUM,
    AVG(SNOWFALL) AS Avg_SNOWFALL,
    AVG(TEMP) AS Avg_TEMP,
    AVG(WINDDIR) AS Avg_WINDDIR,
    AVG(WINDSPD) AS Avg_WINDSPD
FROM 
    weather_data
GROUP BY 
    Week_Start_Date
ORDER BY 
    Week_Start_Date;


4. Monthly Temperatures

CREATE TABLE monthly_weather_data AS
SELECT 
    DATE_TRUNC('month', TIMESTAMP) AS Month_Start_Date,
    AVG(CLDCVR) AS Avg_CLDCVR,
    AVG(FEELSLIKE) AS Avg_FEELSLIKE,
    AVG(PRECIP) AS Avg_PRECIP,
    AVG(RELHUM) AS Avg_RELHUM,
    AVG(SNOWFALL) AS Avg_SNOWFALL,
    AVG(TEMP) AS Avg_TEMP,
    AVG(WINDDIR) AS Avg_WINDDIR,
    AVG(WINDSPD) AS Avg_WINDSPD
FROM 
    weather_data
GROUP BY 
    Month_Start_Date
ORDER BY 
    Month_Start_Date;

