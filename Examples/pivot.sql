SELECT *
FROM (
    SELECT 
        e.DepartmentID,
        e.EmployeeID,
        e.Salary
    FROM Employees e
) SourceTable
PIVOT (
    SUM(Salary)
    FOR DepartmentID IN ([1], [2], [3], [4])
) PivotTable;
