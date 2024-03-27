--CREATE - DROP - ALTER
--Kolon Adi, Tipi

--City adinda bir table olusturdum
CREATE TABLE City(
Id INT IDENTITY(1,1) Primary Key,
[Name] NVARCHAR(250) NOT NULL
)

-- table a bir kolon ekledim
ALTER TABLE City
Add Code NVARCHAR(10)

DROP TABLE City

