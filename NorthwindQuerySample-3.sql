select * from Orders
select * from [Order Details]

--10248 numarali siparisimin TOPLAM TUTARI NEDIR?
select 
SUM(od.UnitPrice * od.Quantity) 
from [Order Details] as od
where od.OrderID = 10248

--10248 numarali siparisi alan calisanimin adi ve soyadi
select
emp.EmployeeID,
emp.FirstName,
emp.LastName
from Orders as o
inner join Employees as emp
on o.EmployeeID = emp.EmployeeID
where o.OrderID = 10248


--Idsi 5 olan calisanim 1997 yilinda toplam KAC ADET siparis almistir
select 
COUNT(*) 
from Orders as o
where YEAR(o.OrderDate) = 1997 and o.EmployeeID = 5


--1996 yilinda TOPLAM CIRO NEDIR?
select 
SUM(od.UnitPrice * od.Quantity)
from
Orders as o
inner join [Order Details] as od
on o.OrderID = od.OrderID
where YEAR(o.OrderDate) = 1996


--1997 yili, Mart ayindaki bir defadaki en yuksek siparis ( CIRO OLARAK )
select
top 1
o.OrderId,
SUM(od.UnitPrice * od.Quantity) Total
from Orders as o
inner join [Order Details] as od
on o.OrderId = od.OrderID
where YEAR(o.OrderDate) = 1997 and MONTH(o.OrderDate) = 3 
group by o.OrderID
order by Total desc


--Ay-Ciro raporu 1997 yilina ait
--Ocak-2500

select 
MONTH(o.OrderDate) [Month],
SUM(od.Quantity * od.UnitPrice) Total
from Orders as o
inner join [Order Details] as od
on o.OrderID = od.OrderID
where YEAR(o.OrderDate) = 1997
group by MONTH(o.OrderDate)
order by [Month]


--1997 yilinda musteri bazli toplam ciro raporu
select 
c.ContactName,
SUM(od.Quantity * od.UnitPrice) Total
from Orders as o
inner join [Order Details] as od
on o.OrderID = od.OrderID
inner join Customers as c
on o.CustomerID = c.CustomerID
where YEAR(o.OrderDate) = 1997
group by c.ContactName
order by Total desc


-- calisanimin adi, soyadi, rapor verdigi kisinin adi, rapor verdigi kisinin soyadi/ Toplamda 4 kolon istiyorum
select 
emp2.FirstName,
emp2.LastName,
emp.FirstName,
emp.LastName
from Employees as emp
right join Employees as emp2
on emp.EmployeeID = emp2.ReportsTo






