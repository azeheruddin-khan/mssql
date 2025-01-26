DECLARE @table1  TABLE 
(
 ID INT NOT NULL
)

DECLARE @table2  TABLE 
(
 ID INT NOT NULL
)

INSERT INTO @table1
VALUES(1),(2),(3),(4),(5)

INSERT INTO @table2
VALUES(4),(5),(6),(7),(8)

-- 𝐈𝐧𝐧𝐞𝐫 𝐉𝐨𝐢𝐧: Retrieves records with matching values in both tables.
SELECT 
	t1.ID,
	t2.ID 
FROM @table1 t1 
INNER JOIN  @table2 t2 ON t1.ID = t2.ID

-- 𝐋𝐞𝐟𝐭 𝐉𝐨𝐢𝐧: Retrieves all records from the left table and matching records from the right table.
SELECT 
	t1.ID,
	t2.ID 
FROM @table1 t1 
LEFT JOIN  @table2 t2 ON t1.ID = t2.ID

-- 𝐋𝐞𝐟𝐭 𝐉𝐨𝐢𝐧 𝐰𝐢𝐭𝐡 𝐍𝐮𝐥𝐥 𝐂𝐡𝐞𝐜𝐤: Filters only the records where there is no match in the right table (NULL values).
SELECT 
	t1.ID,
	t2.ID 
FROM @table1 t1 
LEFT JOIN  @table2 t2 ON t1.ID = t2.ID
WHERE t2.ID IS NULL

-- 𝐑𝐢𝐠𝐡𝐭 𝐉𝐨𝐢𝐧: Retrieves all records from the right table and matching records from the left table.

SELECT 
	t1.ID,
	t2.ID 
FROM @table1 t1 
RIGHT JOIN  @table2 t2 ON t1.ID = t2.ID

-- 𝐑𝐢𝐠𝐡𝐭 𝐉𝐨𝐢𝐧 𝐰𝐢𝐭𝐡 𝐍𝐮𝐥𝐥 𝐂𝐡𝐞𝐜𝐤: Filters only the records where there is no match in the left table (NULL values).

SELECT 
	t1.ID,
	t2.ID 
FROM @table1 t1 
RIGHT JOIN  @table2 t2 ON t1.ID = t2.ID
WHERE t1.ID IS NULL

-- 𝐅𝐮𝐥𝐥 𝐉𝐨𝐢𝐧: Retrieves all records when there is a match in either the left or right table.
SELECT 
	t1.ID,
	t2.ID 
FROM @table1 t1 
FULL JOIN  @table2 t2 ON t1.ID = t2.ID

-- 𝐅𝐮𝐥𝐥 𝐉𝐨𝐢𝐧 𝐰𝐢𝐭𝐡 𝐍𝐮𝐥𝐥 𝐂𝐡𝐞𝐜𝐤: 
SELECT 
	t1.ID,
	t2.ID 
FROM @table1 t1 
FULL JOIN  @table2 t2 ON t1.ID = t2.ID
WHERE t1.ID IS NULL OR t2.ID IS NULL




