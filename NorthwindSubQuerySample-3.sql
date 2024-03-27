--SubQuery Sample
select * from Products 
where CategoryID = (select CategoryID from Categories where CategoryName = 'Condiments')


-- CategoryName Condiments olan URUNLER bana ver
select * from Products as p
inner join Categories as c
on p.CategoryID = c.CategoryID
where c.CategoryName = 'Condiments'

--urunlerin ortalama fiyatindan daha yuksek urunleri bana ver. Ornegin benim urunlerimin ortalama fiyati 150 TL ise 150 den buyuk urunleri bana ver

select * from Products as pr
where pr.UnitPrice > (select AVG(p.UnitPrice) from Products as p)
order by pr.UnitPrice


--Her kategorideki en PAHALI urunu bana ver
--select
--pr.CategoryID,
--pr.ProductName,
--pr.UnitPrice
--from 
--Products as pr 
--where(pr.CategoryID,UnitPrice) IN
--(select
--p.CategoryID,
--MAX(p.UnitPrice)
--from Products as p 
--group by p.CategoryID)


--Hangi musteri toplam kac adet siparis vermis
select 
o.CustomerID,
COUNT(o.CustomerID)
from Orders as o
group by o.CustomerID

select
c.CustomerID,
(select COUNT(*) from Orders as o where c.CustomerID = o.CustomerID)
from Customers as c







