WITH RECURSIVE EmployeeHierarchy AS (
    SELECT 
        EmployeeID,
        ManagerID,
        FullName,
        0 AS Level
    FROM Employees
    WHERE ManagerID IS NULL  -- Start with top-level managers (root)

    UNION ALL

    SELECT 
        e.EmployeeID,
        e.ManagerID,
        e.FullName,
        eh.Level + 1
    FROM Employees e
    INNER JOIN EmployeeHierarchy eh
        ON e.ManagerID = eh.EmployeeID
)
SELECT * 
FROM EmployeeHierarchy
ORDER BY Level, EmployeeID;
