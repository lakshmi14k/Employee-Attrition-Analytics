-- Average tenure by department
SELECT 
    Department,
    COUNT(*) AS HeadCount,
    AVG(YearsAtCompany) AS AvgTenure,
    AVG(YearsInCurrentRole) AS AvgYearsInRole
FROM Raw
GROUP BY Department
ORDER BY AvgTenure DESC;

-- Flag high-risk employees
SELECT 
    EmployeeNumber,
    Department,
    JobRole,
    YearsAtCompany,
    JobSatisfaction,
    EnvironmentSatisfaction,
    OverTime,
    Attrition,
    CASE 
        WHEN JobSatisfaction <= 2 
          AND EnvironmentSatisfaction <= 2 
          AND OverTime = 1 THEN 'High Risk'
        WHEN JobSatisfaction <= 2 
          OR EnvironmentSatisfaction <= 2 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS RetentionRisk
FROM Raw
ORDER BY RetentionRisk;

--Attrition by department rate
SELECT 
    Department,
    COUNT(*) AS HeadCount,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS AttritionCount,
    ROUND(100.0 * SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS AttritionRate
FROM Raw
GROUP BY Department
ORDER BY AttritionRate DESC;

--Tenure cohorts
SELECT 
    CASE 
        WHEN YearsAtCompany <= 2 THEN '0-2 Years'
        WHEN YearsAtCompany <= 5 THEN '3-5 Years'
        WHEN YearsAtCompany <= 10 THEN '6-10 Years'
        ELSE '10+ Years'
    END AS TenureBucket,
    COUNT(*) AS HeadCount,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount,
    ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS AttritionRate
FROM Raw
GROUP BY 
    CASE 
        WHEN YearsAtCompany <= 2 THEN '0-2 Years'
        WHEN YearsAtCompany <= 5 THEN '3-5 Years'
        WHEN YearsAtCompany <= 10 THEN '6-10 Years'
        ELSE '10+ Years'
    END
ORDER BY AttritionRate DESC;

--Monthly income vs attrition
SELECT 
    Attrition,
    COUNT(*) AS HeadCount,
    AVG(MonthlyIncome) AS AvgIncome,
    MIN(MonthlyIncome) AS MinIncome,
    MAX(MonthlyIncome) AS MaxIncome
FROM Raw
GROUP BY Attrition;