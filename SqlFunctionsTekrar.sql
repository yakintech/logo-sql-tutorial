-- SQL Function Tekrar

--STRING
--LEN, TRIM, UPPER...
--DATE
--DATEDIFF,GETDATE()...
--FORMAT


select FORMAT(250, 'C','tr_TR')


-- 02 Mayis 1997 Persembe

select FORMAT(GETDATE(), 'dddd MMMM yyyy dddd')


create function LogoDateFormat(@date datetime)
returns nvarchar(MAX)
AS
BEGIN
DECLARE @result nvarchar(MAX)
set @result = FORMAT(@date, 'dddd MMMM yyyy dddd')
return @result
END



select 
o.OrderID,
dbo.LogoDateFormat(o.OrderDate)
from Orders as o


create function LogoCurrencyFormat(@price decimal)
returns nvarchar(MAX)
AS
BEGIN
DECLARE @result nvarchar(MAX)
set @result = FORMAT(@price, 'C', 'tr_TR')
return @result
END


select 
ProductName,
dbo.LogoCurrencyFormat(UnitPrice) 
from Products