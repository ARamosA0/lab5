 SELECT Name, ListPrice
 FROM SalesLT.Product;

 SELECT Name, ListPrice
 FROM SalesLT.Product
 ORDER BY Name;

 SELECT Name, ListPrice
 FROM SalesLT.Product
 ORDER BY ListPrice;

 SELECT Name, ListPrice
 FROM SalesLT.Product
 ORDER BY ListPrice DESC;

 SELECT Name, ListPrice
 FROM SalesLT.Product
 ORDER BY ListPrice DESC, Name ASC;

 SELECT TOP (20) Name, ListPrice
 FROM SalesLT.Product
 ORDER BY ListPrice DESC;

 SELECT TOP (20) WITH TIES Name, ListPrice
 FROM SalesLT.Product
 ORDER BY ListPrice DESC;

 SELECT TOP (20) PERCENT WITH TIES Name, ListPrice
 FROM SalesLT.Product
 ORDER BY ListPrice DESC;

 SELECT Name, ListPrice
 FROM SalesLT.Product
 ORDER BY Name OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

 SELECT Name, ListPrice
 FROM SalesLT.Product
 ORDER BY Name OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;

 SELECT Color
 FROM SalesLT.Product;

 SELECT ALL Color
 FROM SalesLT.Product;

 SELECT DISTINCT Color
 FROM SalesLT.Product;

 SELECT DISTINCT Color, Size
 FROM SalesLT.Product;

 SELECT Name, Color, Size
 FROM SalesLT.Product
 WHERE ProductModelID = 6
 ORDER BY Name;

 SELECT Name, Color, Size
 FROM SalesLT.Product
 WHERE ProductModelID <> 6
 ORDER BY Name;

 SELECT Name, ListPrice
 FROM SalesLT.Product
 WHERE ListPrice > 1000.00
 ORDER BY ListPrice;

 SELECT Name, ListPrice
 FROM SalesLT.Product
 WHERE Name LIKE 'HL Road Frame %';

 SELECT Name, ListPrice
 FROM SalesLT.Product
 WHERE ProductNumber LIKE 'FR-_[0-9][0-9]_-[0-9][0-9]';

