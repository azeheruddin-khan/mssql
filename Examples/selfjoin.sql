SELECT 
  e1.first_name ||' '|| e1.last_name AS manager_name,
  e2.first_name ||' '|| e2.last_name AS employee_name
FROM employee e1
JOIN employee e2
ON e1.employee_id = e2.manager_id