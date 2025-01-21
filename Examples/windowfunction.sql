SELECT 
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    d.DepartmentName,
    ROW_NUMBER() OVER (PARTITION BY d.DepartmentID ORDER BY e.HireDate) AS RowNum,
    RANK() OVER (PARTITION BY d.DepartmentID ORDER BY e.Salary DESC) AS Rank,
    SUM(e.Salary) OVER (PARTITION BY d.DepartmentID) AS TotalDepartmentSalary
FROM 
    Employees e
JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID;