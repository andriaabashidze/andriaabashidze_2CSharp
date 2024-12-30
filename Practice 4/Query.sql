--1
SELECT model, speed, hd FROM PC WHERE price<500

--2
SELECT maker FROM Product WHERE type ='printer' 

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

--14
SELECT C.class, name, country FROM Classes C JOIN Ships S ON S.class=C.class WHERE C.numGuns>=10

--15
SELECT hd
FROM PC
GROUP BY hd
HAVING COUNT(hd)>=2

--16
select DISTINCT p1.model, p2.model, p1.speed, p2.ram
FROM PC p1, PC p2
WHERE p1.speed = p2.speed AND p1.ram = p2.ram AND  p1.model != p2.model AND p1.model >p2.model

--17
SELECT DISTINCT type, p.model, L.speed
FROM Laptop L JOIN Product P ON (l.model=p.model) 
WHERE speed < (SELECT MIN(speed) from PC)

--18
SELECT DISTINCT maker, price
FROM Printer Pr JOIN Product Pro ON (Pr.model=Pro.model)
WHERE Pr.price = (SELECT MIN(price) FROM Printer WHERE color = 'y')  AND Pr.color = 'y'

--19
SELECT maker, AVG(screen)
FROM Laptop L JOIN Product P ON (L.model = P.model)
GROUP BY maker

--20
SELECT P.maker, COUNT(DISTINCT P.model) FROM Product P WHERE type = 'PC'
GROUP BY P.maker HAVING COUNT (DISTINCT P.model) >=3