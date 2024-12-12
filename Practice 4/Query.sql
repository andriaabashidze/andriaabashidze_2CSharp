--1
SELECT model, speed, hd FROM PC WHERE price<500

--2
SELECT DISTINCT maker FROM Product WHERE type ='printer' 

--3
SELECT model, ram, screen FROM laptop WHERE price>1000 

--4
SELECT * FROM Printer WHERE color ='y' 

--5
SELECT model, speed, hd FROM PC WHERE price<600 AND cd IN('12x', '24x') 

--6
SELECT DISTINCT maker, speed FROM Product p JOIN Laptop l ON (p.model=l.model) WHERE  hd>=10  

--7
SELECT PC.model, price FROM Product JOIN PC ON (product.model=PC.model) WHERE Product.maker ='B'
UNION 
SELECT Laptop.model, price FROM Product JOIN Laptop ON (product.model=Laptop.model) WHERE Product.maker ='B'
UNION 
SELECT Printer.model, price FROM Product JOIN Printer ON (product.model=Printer.model) WHERE Product.maker ='B'

--8
SELECT maker FROM product WHERE type ='PC' 
EXCEPT
SELECT maker FROM product WHERE type ='Laptop' 

--9
SELECT DISTINCT maker FROM product WHERE model IN ( SELECT model FROM PC WHERE speed>=450)  

--10
SELECT Product.model, price FROM Product JOIN Printer ON (Product.model=Printer.model) 
WHERE Product.model IN ( SELECT Printer.model FROM Printer WHERE price>=ALL (SELECT price from Printer where price>0))

--11
SELECT AVG(speed) FROM PC 

--12
SELECT AVG(speed) FROM Laptop WHERE price>1000  

--13
SELECT AVG(speed) FROM Product JOIN PC ON (Product.model = PC.model) WHERE maker ='A' 