#Inner Join
 SELECT SalesLT.Product.Name As ProductName, SalesLT.ProductCategory.Name AS Category
 FROM SalesLT.Product
 INNER JOIN SalesLT.ProductCategory
 ON SalesLT.Product.ProductCategoryID = SalesLT.ProductCategory.ProductCategoryID;


 SELECT SalesLT.Product.Name As ProductName, SalesLT.ProductCategory.Name AS Category
 FROM SalesLT.Product
 JOIN SalesLT.ProductCategory
     ON SalesLT.Product.ProductCategoryID = SalesLT.ProductCategory.ProductCategoryID;


 SELECT p.Name As ProductName, c.Name AS Category
 FROM SalesLT.Product AS p
 JOIN SalesLT.ProductCategory As c
     ON p.ProductCategoryID = c.ProductCategoryID;

 SELECT oh.OrderDate, oh.SalesOrderNumber, p.Name As ProductName, od.OrderQty, od.UnitPrice, od.LineTotal
 FROM SalesLT.SalesOrderHeader AS oh
 JOIN SalesLT.SalesOrderDetail AS od
     ON od.SalesOrderID = oh.SalesOrderID
 JOIN SalesLT.Product AS p
     ON od.ProductID = p.ProductID
 ORDER BY oh.OrderDate, oh.SalesOrderID, od.SalesOrderDetailID;

#Outer Joins

 SELECT c.FirstName, c.LastName, oh.SalesOrderNumber
 FROM SalesLT.Customer AS c
 LEFT OUTER JOIN SalesLT.SalesOrderHeader AS oh
     ON c.CustomerID = oh.CustomerID
 ORDER BY c.CustomerID;

 SELECT c.FirstName, c.LastName, oh.SalesOrderNumber
 FROM SalesLT.Customer AS c
 LEFT JOIN SalesLT.SalesOrderHeader AS oh
     ON c.CustomerID = oh.CustomerID
 ORDER BY c.CustomerID;

 SELECT c.FirstName, c.LastName, oh.SalesOrderNumber
 FROM SalesLT.Customer AS c
 LEFT JOIN SalesLT.SalesOrderHeader AS oh
     ON c.CustomerID = oh.CustomerID
 WHERE oh.SalesOrderNumber IS NULL 
 ORDER BY c.CustomerID;


 SELECT p.Name As ProductName, oh.SalesOrderNumber
 FROM SalesLT.Product AS p
 LEFT JOIN SalesLT.SalesOrderDetail AS od
     ON p.ProductID = od.ProductID
 LEFT JOIN SalesLT.SalesOrderHeader AS oh
     ON od.SalesOrderID = oh.SalesOrderID
 ORDER BY p.ProductID;


 SELECT p.Name As ProductName, c.Name AS Category, oh.SalesOrderNumber
 FROM SalesLT.Product AS p
 LEFT OUTER JOIN SalesLT.SalesOrderDetail AS od
     ON p.ProductID = od.ProductID
 LEFT OUTER JOIN SalesLT.SalesOrderHeader AS oh
     ON od.SalesOrderID = oh.SalesOrderID
 INNER JOIN SalesLT.ProductCategory AS c
     ON p.ProductCategoryID = c.ProductCategoryID
 ORDER BY p.ProductID;


#Cross JOIN

 SELECT p.Name, c.FirstName, c.LastName, c.EmailAddress
 FROM SalesLT.Product as p
 CROSS JOIN SalesLT.Customer as c;

#Self JOIN

 SELECT pcat.Name AS ParentCategory, cat.Name AS SubCategory
 FROM SalesLT.ProductCategory as cat
 JOIN SalesLT.ProductCategory pcat
     ON cat.ParentProductCategoryID = pcat.ProductCategoryID
 ORDER BY ParentCategory, SubCategory;