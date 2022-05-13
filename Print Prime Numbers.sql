/*use 2 loop, check if a number is divisible for any other number exclude 1 and itself */
DECLARE @i INT;
DECLARE @n INT =3;
DECLARE @str VARCHAR(1000) ='2';
DECLARE @status int;
WHILE @n<=1000
BEGIN
    SET @i=2
    SET @status=0
    WHILE (@i <= @n-1)
    BEGIN
        IF @n%@i=0
        BEGIN
        SET @status = 1
        BREAK END
        set @i = @i+1
    END
    IF @status = 0
    BEGIN
    SET @str += "&"
    SET @str += CONVERT(VARCHAR,@n)
    END
    SET @n=@n+1
END;
print @str