SELECT 
InvoiceNo,
CustomerID,
SUM(Quantity * UnitPrice) AS TotalPrice
 FROM `tc-da-1.turing_data_analytics.rfm` 
   WHERE
    CustomerID IS NOT NULL
    AND InvoiceDate >= '2010-12-01' AND InvoiceDate < '2011-12-01'
    AND UnitPrice IS NOT NULL AND UnitPrice > 0
    AND Quantity IS NOT NULL AND Quantity > 0
 GROUP BY InvoiceNo, CustomerID
 