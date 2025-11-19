SELECT Branch, SUM(Total) AS Revenue
FROM Supermarket_Sales
GROUP BY Branch;

SELECT City, SUM(Total) AS Revenue
FROM Supermarket_Sales
GROUP BY City;

SELECT CustomerType,
       SUM(Total) AS Revenue,
       SUM(Total) * 100.0 / (SELECT SUM(Total) FROM Supermarket_Sales) AS RevenuePct
FROM Supermarket_Sales
GROUP BY CustomerType;

SELECT ProductLine,
       SUM(GrossIncome) AS Profit,
       SUM(COGS) AS COGS,
       SUM(GrossIncome) * 100.0 / SUM(COGS) AS MarginPct
FROM Supermarket_Sales
GROUP BY ProductLine;
