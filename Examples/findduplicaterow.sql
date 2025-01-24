SELECT 
  employee_id,
  last_name,
  first_name,
  dept_id,
  manager_id,
  salary,
  COUNT(*) AS number_of_rows
FROM employee
GROUP BY
  employee_id,
  last_name,
  first_name,
  dept_id,
  manager_id,
  salary
HAVING COUNT(*) > 1