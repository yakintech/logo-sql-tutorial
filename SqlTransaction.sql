begin try
insert into Categories(CategoryName) values('lorem lorem lorem loremmmm')
end try
begin catch
print('Kategori eklerken bir hata meydana geldi')
end catch

--urun stok guncellemesi ve siparis detayinin eklenmesi ( mevcut bir siparise bir urun daha ekleycegim)
begin transaction
begin try
-- eger urun stokta yoksa islemi geri al
--stok kontrol
if (select (p.UnitsInStock) from Products as p where ProductID = 3) < 10
BEGIN
ROLLBACK TRANSACTION
END
update Products
set UnitsInStock = UnitsInStock - 10
where ProductID = 3
-- stok 10 adet dustukten sonra siparis detayi ekliyorum
insert into [Order Details](OrderID,ProductID,Quantity,UnitPrice)
values(10248,3,10,30)
COMMIT transaction
end try
begin catch
ROLLBACK transaction
end catch


--Bu procedure bir musteri ekleyecek ve musteri ekledikten sonra bir tane de siparis olusturacaktir
alter proc add_customer
(@companyName nvarchar(MAX),
@contactName nvarchar(MAX),
@id nvarchar(10))
as
BEGIN TRANSACTION
BEGIN TRY
insert into Customers(CompanyName,ContactName,CustomerID)
values(@companyName,@contactName, @id)
insert into Orders(CustomerID, OrderDate, RequiredDate)
values(@id, GETDATE(), 'aa')
COMMIT TRANSACTION
END TRY
BEGIN CATCH
 Print 'bu store procedurdeki tum islemler geri alindi'
 ROLLBACK TRANSACTION
END CATCH


exec add_customer 'Siemens', 'Ahmet bey', 'NEW03' 











exec add_customer 'Apple','Steve','NEW01'

select * from Customers
select * from Orders order by OrderID desc



