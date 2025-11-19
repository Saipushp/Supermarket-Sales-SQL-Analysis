-- Remove duplicates
;WITH CTE AS (
    SELECT *, ROW_NUMBER() OVER (
        PARTITION BY InvoiceID, Branch, City, CustomerType, Gender,
                     ProductLine, UnitPrice, Quantity, Tax5, Total,
                     RawDate, RawTime, Payment, COGS, GrossMarginPercentage,
                     GrossIncome, Rating
        ORDER BY InvoiceID
    ) AS rn
    FROM Supermarket_Sales
)
DELETE FROM CTE WHERE rn > 1;

-- Replace NULL ratings
UPDATE Supermarket_Sales
SET Rating = (SELECT AVG(Rating) FROM Supermarket_Sales WHERE Rating IS NOT NULL)
WHERE Rating IS NULL;

-- Add proper date/time columns
ALTER TABLE Supermarket_Sales
ADD SaleDate DATE,
    SaleTime TIME,
    SaleDateTime DATETIME;

-- Convert date & time
UPDATE Supermarket_Sales
SET SaleDate = TRY_CONVERT(DATE, RawDate, 105);

UPDATE Supermarket_Sales
SET SaleTime = TRY_CONVERT(TIME, RawTime);

UPDATE Supermarket_Sales
SET SaleDateTime =
    DATEADD(SECOND,
            DATEDIFF(SECOND, '00:00:00', SaleTime),
            SaleDate);
