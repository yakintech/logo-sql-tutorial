--Disaridan price alan ve aldigi price 1.2 katini bana veren fonksiyon
create function kdvCalc(@price decimal)
returns decimal as
begin

declare @result decimal
set @result = @price * 1.2
return @result

end

create function birthDateCalc(@birthDate datetime)
returns int as
begin
declare @age int
set @age = YEAR(GETDATE()) - YEAR(@birthDate)
return @age
end

declare @totalProducts int
set @totalProducts = (select COUNT(*) from Products)

select @totalProducts


select 
UPPER(emp.FirstName),
emp.LastName,
dbo.birthDateCalc(emp.BirthDate)
from Employees as emp



create function dayDiff(@date datetime)returns int  as begindeclare @day intset @day = DATEDIFF(DAY,GETDATE(),@date)return @day end--Disaridan aldigi iki metni buyutup aralarina bir bosluk koyup bana veren fonksiyon. Ornegin disaridan Cagatay ve Yildiz adinda iki tane metin alacak. Bu metinleri buyutup aralarinda bosluk birakarak geri donecekcreate function getFullName(@name nvarchar(MAX), @surname nvarchar(MAX))returns nvarchar(MAX)BEGINdeclare @fullName nvarchar(MAX)set @fullName = UPPER(@name) + ' ' + UPPER(@surname)return @fullNameENDselectdbo.getFullName(emp.FirstName, emp.LastName)from Employees as emp