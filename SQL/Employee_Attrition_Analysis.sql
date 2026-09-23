-- Employee Attrition Analysis
-- Dataset: IBM HR Analytics Employee Attrition & Performance
CREATE DATABASE IF NOT EXISTS employee_attrition;
USE employee_attrition;

-- Create the table from the CSV before loading data.
-- After importing the CSV, run these analysis queries.

SELECT COUNT(*) AS Total_Employees FROM hr_data;

SELECT COUNT(*) AS Employees_Left
FROM hr_data
WHERE Attrition = 'Yes';

SELECT COUNT(*) AS Employees_Stayed
FROM hr_data
WHERE Attrition = 'No';

SELECT ROUND(
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2
) AS Attrition_Rate
FROM hr_data;

SELECT Department,
       COUNT(*) AS Total_Employees,
       SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Employees_Left,
       ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS Attrition_Rate
FROM hr_data
GROUP BY Department
ORDER BY Attrition_Rate DESC;

SELECT JobRole,
       COUNT(*) AS Total_Employees,
       SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Employees_Left,
       ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS Attrition_Rate
FROM hr_data
GROUP BY JobRole
ORDER BY Attrition_Rate DESC;

SELECT OverTime,
       COUNT(*) AS Total_Employees,
       SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Employees_Left,
       ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS Attrition_Rate
FROM hr_data
GROUP BY OverTime
ORDER BY Attrition_Rate DESC;

SELECT
CASE WHEN Age<=25 THEN '18-25'
     WHEN Age<=35 THEN '26-35'
     WHEN Age<=45 THEN '36-45'
     WHEN Age<=55 THEN '46-55'
     ELSE '56+' END AS Age_Group,
COUNT(*) AS Total_Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Employees_Left,
ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS Attrition_Rate
FROM hr_data
GROUP BY Age_Group
ORDER BY Attrition_Rate DESC;

SELECT Attrition, ROUND(AVG(MonthlyIncome),2) AS Avg_Monthly_Income
FROM hr_data
GROUP BY Attrition;

SELECT JobSatisfaction,
       COUNT(*) AS Total_Employees,
       SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Employees_Left,
       ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS Attrition_Rate
FROM hr_data
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;
