SELECT ProductLine, AVG(Rating) AS AvgRating
FROM Supermarket_Sales
GROUP BY ProductLine;

SELECT Branch, AVG(Rating) AS AvgRating
FROM Supermarket_Sales
GROUP BY Branch;

SELECT Payment, AVG(Rating) AS AvgRating
FROM Supermarket_Sales
GROUP BY Payment;
