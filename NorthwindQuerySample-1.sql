-- T-SQL

select 'cagatay yildiz'
select 55
select GETDATE()
select NEWID()


-- tum employee lari ekranda goster
select * from Employees

-- Employe tablosundan sadece Id, firstName ve surname ekranda yazsin
select EmployeeId, FirstName, LastName from Employees

--tum urunleri ekranda goster
select * from Products


-- ekranda id, unitprice, unitPrice KDV li( %20 ) halini ekranda goster
select 
	p.ProductID,
	p.UnitPrice,
	p.UnitPrice * 1.2 [KDV Price]
from Products as p


-- stogu 10 un altinda olan urunleri bana ver ( where anahtar kelimesiyle bir kosul koydum )
select * from Products 
where UnitsInStock < 10

-- stok durumu 10 dan kucuk VE fiyati 40 dan buyuk
select * from Products
where UnitsInStock < 10 and UnitPrice > 40


--product tablosunda bulunan urunlerin ID ve name kolonunu ekrana yaz ( name buyuk harfli olacak )
select 
p.ProductID,
UPPER(p.ProductName) -- upper fonksiyonu ile datami buyuk harfli gosteriyorum
from Products as p


-- urun adi A ile baslayan urunleri ekranda goster
select 
*
from Products as p
where p.ProductName like 'a%'


-- urun adi a ile BITEN urunleri ekranda goster
select
*
from Products as p
where p.ProductName like '%a'

-- urun adi icerisinde a harfi gecenleri ve stokta 10 dan fazla bulunanlari ekranda goster
select
*
from Products as p
where p.ProductName like '%a%' and UnitsInStock > 10


-- kac adet urunum var?
select COUNT(*) Total from Products

-- urunlerimin ortalama fiyati nedir?
select AVG(p.UnitPrice) from Products as p

-- stok miktari 10 un altinda olan urunlerimin ortalama fiyati nedir?
select AVG(p.UnitPrice) from Products as p
where p.UnitsInStock < 10

-- urunlerimin TOPLAM FIYATI
select SUM(p.UnitPrice) from Products as p


-- urunleri ADA gore sirala
select
*
from Products as p order by p.ProductName

-- urunleri ADA gore tersten sirala
select
*
from Products as p order by p.ProductName desc

-- fiyati 50-100 arasinda olan urunler fiyata gore sirala
select
* 
from Products as p
where p.UnitPrice > 50 and p.UnitPrice < 100
order by p.UnitPrice


--1997 yilinda verilen siparisler
select * from Orders as o
where YEAR(o.OrderDate) = 1997

--1997 yilinin MAYIS ayinda verilen siparisler
select * from Orders as o
where YEAR(o.OrderDate) = 1997 and MONTH(o.OrderDate) = 5

--YEAR fonksiyonu disaridan bir date alip disariya bir INT doner

--Geciken siparislerimi ekrana yazdir
select * from Orders as o
where o.ShippedDate > o.RequiredDate 



--en pahali ilk 5 URUNU getir
select 
top 5 *
from Products as p
order by p.UnitPrice desc

-- 5-10 arasindaki urunleri getir
select * from Products as p
order by p.ProductName
OFFSET 10 ROWS



select * from Products as p
order by p.UnitPrice desc
OFFSET 5 ROWS

--COUNT toplam kac adet oldugunu gosteriyor
select 
COUNT(*) 
from Products

--UnitsInStock NULL olmayan urun adedi
select 
COUNT(p.UnitsInStock)
from Products as p

--SUM toplami belirtir
select
SUM(p.UnitPrice) 
from Products as p

--AVG ortalama belirtir
select
AVG(p.UnitPrice) 
from Products as p

--Stock NULL OLMAYAN URUNLERI BANA VER
select * from Products as p
where
p.UnitsInStock is  NULL

--MIN Mevcut kolondaki en dusuk DEGERI getirir
select
MIN(p.UnitPrice) from Products as p

--MAX Mevcut kolondaki en YUKSEK DEGERI getirir
select
MAX(p.UnitPrice) from Products as p


