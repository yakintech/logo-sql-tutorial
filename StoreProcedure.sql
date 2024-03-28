-- Store Procedure
-- Urun ekleyen store procedure
insert into Products(ProductName, UnitPrice)
values('',500)

CREATE PROCEDURE sp_add_product 
(@name nvarchar(MAX), 
@price decimal)
as
insert into Products(ProductName, UnitPrice)
values(@name,@price)


exec sp_add_product 'IPhone', 5500


-- Disaridam bir urunId ve Stok miktari alacak ve o urunun stogunu guncelleyecek

CREATE PROCEDURE sp_update_product_stock
(@id int,
@stock int)
as
update Products set UnitsInStock = @stock
where ProductID = @id

select * from Products
exec sp_update_product_stock 2,57


--Disaridan vedigim urun id ye gore toplam ciro hesapla ve bana ver?
create proc sp_product_sales
(@id int)
as
select 
SUM(od.UnitPrice * od.Quantity)
from [Order Details] as od
where od.ProductId = @id


exec sp_product_sales 1

--Dışarıdan 2 adet unitprice alan ve o aralıktaki satışları gösteren store procedure. Toplam sepet tutarı
--create proc sp_get_total_price_by_rate
--(@min decimal,
--@max decimal)
--as
--(select 
--od.OrderID,
--SUM(od.UnitPrice * od.Quantity) as Total
--from [Order Details] as od
--group by od.OrderID)

--Urun Ekleyen store procedure
--* urun adini buyuk harf olarak ve trim yaparak procedure otomatik donusturur
-- Girilen fiyat 0 dan kucuk olamaz
create proc sp_add_product2
(@name nvarchar(MAX),
@price decimal)
as
if @price > 0
begin
insert into Products(ProductName,UnitPrice)
values(UPPER(TRIM(@name)), @price)
end
else
print 'Lutfen 0 dan buyuk bir sayi giriniz'

exec sp_add_product2 '  samsung', 50


-- Disaridan bir sayi alsin ve o sayiya gore max satis tutarlarini getirsin. ornegin 10 yazarsak maximum ilk 10 satisi bana versin

create proc sp_get_max_orders_by_top
@topNumber int
as
select
top (@topNumber) 
od.OrderID,
SUM(od.UnitPrice * od.Quantity) TotalPrice
from [Order Details] as od
group by od.OrderID
order by TotalPrice desc


exec sp_get_max_orders_by_top 12

--Belirli bir kategorideki urunleri belirli bir yuzde indirim uygulayacak store procedure. ornegin disaridan 3, 25 aldiginda 3 numarali kategoriye ait urunlere %25 indirim uygulayacak. 
create proc sp_update_products_prices_by_categoryId
(@cid int,
@percentageChange float)
as
update Products set UnitPrice = UnitPrice - (UnitPrice * (@percentageChange / 100))
where CategoryID = @cid

exec sp_update_products_prices_by_categoryId 2,25


select * from Products where CategoryID = 2









-- verilen iki tutar arasındaki siparişleri sipariş toplam tutarı getiren sp 
create procedure sp_get_Order (@min decimal,@max decimal)
as
begin
select od.OrderID,Sum((od.Quantity*od.UnitPrice)-od.Discount) as sipTotal from [Order Details] as od  group by od.OrderID HAVING (Sum((od.Quantity*od.UnitPrice)-od.Discount)) between @min and @max  order by sipTotal
end

--Disaridan bir musteriId alacak ve o musteriId ye ait son siparisi IPTAL EDECEK. Iptalden kastimiz order tablosundaki ShippedDate kolonunun NULL olmasidir
CREATE procedure sp_cancel_last_order_by_customerId
@customerId NVARCHAR(10)
as
declare @orderId int
set @orderId = (select
top 1 o.OrderID
from Orders as o
where o.CustomerID = @customerId
order by o.OrderDate desc)

IF @orderId is not null
BEGIN
update Orders set ShippedDate = NULL
where OrderID = @orderId
END


select * from Orders as o
where o.CustomerID = 'KOENE'
order by o.OrderID desc

exec sp_cancel_last_order_by_customerId 'KOENE'



--siparis verildiginda urunu stoktan bir adet duus. bir adet order create oldugunda o order a ait stock -1 olsun
create proc sp_add_order_and_stock_update
(@customerId nvarchar(MAX),
@orderDate datetime,
@productId int,
@quantity int)
as
insert into Orders(CustomerID,OrderDate) values(@customerId,@orderDate)

declare @orderID int
set @orderID = @@IDENTITY

insert into [Order Details](ProductID, Quantity, OrderID) values(@productId, @quantity, @orderID)

update Products
set UnitsInStock = UnitsInStock - @quantity
where ProductID = @productId


select * from Products
--39 adet chai var
select * from Customers

exec sp_add_order_and_stock_update 'ALFKI', '3/28/2024' , 1,10






