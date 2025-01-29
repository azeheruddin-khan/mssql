CREATE FUNCTION [dbo].[ufnLeadingZeros](
    @Value INT
) 
RETURNS VARCHAR(20) 

AS 
BEGIN
    DECLARE @ReturnValue VARCHAR(20);

    SET @ReturnValue = CONVERT(VARCHAR(20), @Value);
    SET @ReturnValue = REPLICATE('0', 20 - DATALENGTH(@ReturnValue)) + @ReturnValue;

    RETURN (@ReturnValue);
END;
