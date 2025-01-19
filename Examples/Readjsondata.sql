SELECT 
    EmployeeID,
    JSON_VALUE(EmployeeData, '$.FirstName') AS FirstName,
    JSON_VALUE(EmployeeData, '$.LastName') AS LastName,
    JSON_QUERY(EmployeeData, '$.Skills') AS Skills
FROM 
    Employees
WHERE 
    ISJSON(EmployeeData) > 0;