--JOIN 

--her urunun bir kategorisi var
--inner join kurallar dogrultusunda her iki tabloda olan DATA VARSA getirir
select 
p.ProductID,
p.ProductName,
p.UnitPrice,
c.CategoryName
from Products as p
inner join Categories as c
on p.CategoryID = c.CategoryID

--left join ( left outer join )
--sol taraftaki tablonun tum kayitlarini  ve sag taraftaki tablonun eslesen kayitlarini getirir FAKAT kayit eslesmemisse NULL yazar
select 
p.ProductID,
p.ProductName,
p.UnitPrice,
c.CategoryName
from Products as p
left outer join Categories as c
on p.CategoryID = c.CategoryID


--Ekranda product tablosundan id, name, unitPrice Categories tablosundan name, supplier tablosundan CompanyName kolonunu yazdir
select 
p.ProductID,
p.ProductName,
p.UnitPrice,
c.CategoryName,
s.CompanyName
from Products as p
inner join Categories as c
on p.CategoryID = c.CategoryID
inner join Suppliers as s
on p.SupplierID = s.SupplierID

where p.UnitPrice BETWEEN 50 AND 100
order by p.UnitPrice desc


select * from Orders
select * from [Order Details]

--10248 numarali siparisin detaylarini bana ver
select * from [Order Details] as od 
where od.OrderID = 10248

--10248 numarali siparisin toplam tutari nedir?
select 
SUM(od.UnitPrice * od.Quantity)
from [Order Details] as od 
where od.OrderID = 10248

select * from Orders as o where o.OrderID = 10248

-- Siparisin Toplam Tutar, Siparis Tarihi
select
o.OrderID,
SUM(od.UnitPrice * od.Quantity)
from Orders as o
inner join [Order Details] as od
on o.OrderID = od.OrderID
group by o.OrderID



select distinct Country from Customers
select * from Customers

--Almanya - 33 ( Hangi ulkeden kac adet musterim var )

select
c.Country,
COUNT(c.CustomerID) Total
from Customers as c
group by c.Country


-- Hangi eleman ( employee ) kac adet siparis aldi. multi groupby
select 
emp.EmployeeID,
emp.FirstName,
emp.LastName,
COUNT(o.OrderID) Total
from Orders as o
inner join Employees as emp
on o.EmployeeID = emp.EmployeeID
group by emp.EmployeeID, emp.FirstName, emp.LastName
order by Total desc


--Almanya - 33 (Hangi ulkeden kac adet musterim var. Musteri sayisi 10 dan buyuk olanlar gelsin!!!)

select
c.Country,
COUNT(c.CustomerID) Total
from Customers as c
group by c.Country
having COUNT(c.CustomerID) > 10
