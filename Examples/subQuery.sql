SELECT 
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    e.Salary,
    (SELECT AVG(Salary) 
     FROM Employees 
     WHERE DepartmentID = e.DepartmentID) AS AvgDepartmentSalary
FROM 
    Employees e
WHERE 
    e.Salary > (SELECT AVG(Salary) 
                FROM Employees);
