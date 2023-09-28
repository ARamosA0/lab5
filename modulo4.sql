#Scalar FUNCTION

 SELECT YEAR(SellStartDate) AS SellStartYear, ProductID, Name
 FROM SalesLT.Product
 ORDER BY SellStartYear;

 SELECT YEAR(SellStartDate) AS SellStartYear,
        DATENAME(mm,SellStartDate) AS SellStartMonth,
        DAY(SellStartDate) AS SellStartDay,
        DATENAME(dw, SellStartDate) AS SellStartWeekday,
        DATEDIFF(yy,SellStartDate, GETDATE()) AS YearsSold,
        ProductID,
        Name
 FROM SalesLT.Product
 ORDER BY SellStartYear;

 SELECT CONCAT(FirstName + ' ', LastName) AS FullName
 FROM SalesLT.Customer;

 SELECT UPPER(Name) AS ProductName,
        ProductNumber,
        ROUND(Weight, 0) AS ApproxWeight,
        LEFT(ProductNumber, 2) AS ProductType,
        SUBSTRING(ProductNumber,CHARINDEX('-', ProductNumber) + 1, 4) AS ModelCode,
        SUBSTRING(ProductNumber, LEN(ProductNumber) - CHARINDEX('-', REVERSE(RIGHT(ProductNumber, 3))) + 2, 2) AS SizeCode
 FROM SalesLT.Product;


#Logical FUNCTION

 SELECT Name, Size AS NumericSize
 FROM SalesLT.Product
 WHERE ISNUMERIC(Size) = 1;

 SELECT Name, IIF(ISNUMERIC(Size) = 1, 'Numeric', 'Non-Numeric') AS SizeType
 FROM SalesLT.Product;

 SELECT prd.Name AS ProductName,
        cat.Name AS Category,
        CHOOSE (cat.ParentProductCategoryID, 'Bikes','Components','Clothing','Accessories') AS ProductType
 FROM SalesLT.Product AS prd
 JOIN SalesLT.ProductCategory AS cat
     ON prd.ProductCategoryID = cat.ProductCategoryID;
    
#Agregate FUNCTION

 SELECT COUNT(*) AS Products,
        COUNT(DISTINCT ProductCategoryID) AS Categories,
        AVG(ListPrice) AS AveragePrice
 FROM SalesLT.Product;

 SELECT COUNT(p.ProductID) AS BikeModels, AVG(p.ListPrice) AS AveragePrice
 FROM SalesLT.Product AS p
 JOIN SalesLT.ProductCategory AS c
     ON p.ProductCategoryID = c.ProductCategoryID
 WHERE c.Name LIKE '%Bikes';

#GROUP BY

 SELECT Salesperson, COUNT(CustomerID) AS Customers
 FROM SalesLT.Customer
 GROUP BY Salesperson
 ORDER BY Salesperson;

 SELECT c.Salesperson, SUM(oh.SubTotal) AS SalesRevenue
 FROM SalesLT.Customer c
 JOIN SalesLT.SalesOrderHeader oh
     ON c.CustomerID = oh.CustomerID
 GROUP BY c.Salesperson
 ORDER BY SalesRevenue DESC;

 SELECT c.Salesperson, ISNULL(SUM(oh.SubTotal), 0.00) AS SalesRevenue
 FROM SalesLT.Customer c
 LEFT JOIN SalesLT.SalesOrderHeader oh
     ON c.CustomerID = oh.CustomerID
 GROUP BY c.Salesperson
 ORDER BY SalesRevenue DESC;

#Filter Groups HAVING

 SELECT Salesperson, COUNT(CustomerID) AS Customers
 FROM SalesLT.Customer
 WHERE COUNT(CustomerID) > 100
 GROUP BY Salesperson
 ORDER BY Salesperson;

 SELECT Salesperson, COUNT(CustomerID) AS Customers
 FROM SalesLT.Customer
 GROUP BY Salesperson
 HAVING COUNT(CustomerID) > 100
 ORDER BY Salesperson;