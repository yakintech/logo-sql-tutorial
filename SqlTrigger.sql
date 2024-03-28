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




delete Customers where CustomerID = 'NEW01'


select * from Customers

select * from Orders where CustomerID = 'ALFKI' 

delete Customers where CustomerID = 'ALFKI'

