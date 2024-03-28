-- Northwind tarafinda category table bir insert islemi yapmak istiyorum
insert into Categories(CategoryName, Description)
values('Camp','Camp products...')

-- Id 8 olan category nin adini Seafood-2 yapmak istiyorum
update Categories set CategoryName = 'Seafood-2'
where CategoryID = 8


-- Id si 10 olan category i sil
delete Categories where CategoryID > 8


--once bir kategori sonra bu kategoriye ait bir urunu eklemek istiyorum
insert into Categories(CategoryName, Description)
values('Camp','Camp products...')

insert into Products(ProductName, UnitPrice, Discontinued, CategoryID)
values('Cadir', 500, 0, @@IDENTITY)

insert into Orders(OrderDate, RequiredDate,CustomerID,EmployeeID)
values(GETDATE(),GETDATE(),'OLDWO',4)


select * from Categories
select * from Products
select * from Orders order by OrderID desc

select SCOPE_IDENTITY()
select IDENT_CURRENT('Categories')
select IDENT_CURRENT('Products')
select GETUTCDATE()
SELECT DATEDIFF(day, '2036-03-01', '2036-02-28');

-- 2) Ülkesi UK olan müşterilerimin ülkelerini Germany, şehirlerini Berlin olarak güncelleyiniz.
update Customers set Country = 'Germany', City = 'Berlin'
where Country = 'UK'

-- 3) 100$ dan büyük ürünlerin fiyatın %10 indirimli olarak güncelleyin
update Products set UnitPrice = UnitPrice * 0.9
where UnitPrice > 400


-- 4) Müşterilerin adreslerinin sonuna sehir ve ülke adını ekleyiniz.
update Customers set Address = Address + ' ' + City +' ' + Country













