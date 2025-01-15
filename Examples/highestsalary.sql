CREATE TABLE employee
(
 id INT NOT NULL,
 name VARCHAR(50) NOT NULL,
 salary INT NOT NULL	
)


INSERT INTO employee(id,name,salary)
VALUES
(1,'Albert', 20000),
(2,'Jon', 15000),
(3,'Ron', 11000),
(4,'Alex', 15000),
(5,'Rony', 10000),
(6,'Andy', 9000)




/* Find first highest salary of employee  */
SELECT MAX(salary) FROM employee

;WITH cte_first_highest_salary AS
(
	SELECT salary, DENSE_RANK() OVER(ORDER BY salary DESC) AS rank FROM employee
)

SELECT DISTINCT salary FROM cte_first_highest_salary WHERE rank = 1;


/* Find second highest salary of employee */

SELECT MAX(salary) FROM employee
WHERE salary < (SELECT MAX(salary) FROM employee)

;WITH cte_second_highest_salary AS
(
	SELECT salary, DENSE_RANK() OVER(ORDER BY salary DESC) AS rank FROM employee
)

SELECT DISTINCT salary FROM cte_second_highest_salary WHERE rank = 2;


/* Find N-th salary of employee */

DECLARE @nhighestsalary INT = 3

SELECT salary FROM employee e1
WHERE (@nhighestsalary-1) = (SELECT COUNT(DISTINCT salary) FROM employee e2 WHERE e1.salary > e2.salary)

;WITH cte_third_highest_salary AS
(
	SELECT salary, DENSE_RANK() OVER(ORDER BY salary DESC) AS rank FROM employee
)

SELECT DISTINCT salary FROM cte_third_highest_salary WHERE rank = @nhighestsalary;




