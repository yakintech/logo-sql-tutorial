-- Bir insert islemi sonrasi bir islem yapmak istiyorum. ORnegin bir siparis verildiginda OTOMATIK stok dusmek
-- bir update islemi sonrasi...
-- bir delete islemi sonrasi...



--musteri silindiginde ona ait siparisleri de silmek istiyorsak
alter trigger trg_after_delete_customer
on Customers
AFTER DELETE
AS
BEGIN
	update Orders 
		set ShipName = 'CANCEL'
		where CustomerID = (select CustomerId from deleted)
END


-- delete Customers where CustomerID = 'NEW01'

-- bu tablo product stocklari degistiginde o degisimin logunu tutacak
alter table ProductStockLog

--Urun guncellendiginde stocklog tablosuna bir log atmak istiyorum
create trigger trg_afterUpdateProductStock
on Products
after update
as
begin
IF UPDATE(UnitsInStock)
	begin
	insert into ProductStockLog(ProductId,AddDate,OldStock,NewStock)
	select
	i.ProductID,
	GETDATE(),
	d.UnitsInStock,
	i.UnitsInStock
	from inserted i
	inner join deleted d on i.ProductID = d.ProductID
	print 'Product Stock log tablosuna log eklendi!'
	end
end


use Northwind
select * from ProductStockLog

--delete,insert

select * from Products
update Products set UnitsInStock = 5 where ProductID = 1


--Yeni bir tedarikci eklendiginde eklenen tedarikcinin ID sini print eden trigget
alter trigger trg_afterInsertSupplier
on Suppliers
after insert
as
begin
	declare @supplierId int
	set @supplierId = (select i.SupplierID from inserted i)
	print CAST(@supplierId AS VARCHAR)  + ' id numarali bir tedarikci eklendi'
end

insert into Suppliers(CompanyName,ContactName)
values('Apple-2','Steve-2')