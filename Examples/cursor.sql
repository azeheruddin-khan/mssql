DECLARE emp_cursor CURSOR FOR SELECT Name, Salary FROM Employees;

BEGIN
   -- Open the cursor
   OPEN emp_cursor;

   -- Fetch rows from the cursor
   FETCH NEXT FROM emp_cursor INTO @Name, @Salary;
   WHILE @@FETCH_STATUS = 0
   BEGIN
      PRINT 'Name: ' + @Name + ', Salary: ' + CAST(@Salary AS VARCHAR);
      FETCH NEXT FROM emp_cursor INTO @Name, @Salary;
   END;

   -- Close the cursor
   CLOSE emp_cursor;

   -- Deallocate the cursor
   DEALLOCATE emp_cursor;
END;