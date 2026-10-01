/*
    Customer Segmentation & Behavioral Analysis
    SQL Server Analysis Queries

    Database: CustomerAnalytics
    Table: dbo.Project2_Customer_RFM_Analysis

    Portfolio project: self-initiated customer analytics project.
*/

USE CustomerAnalytics;
GO

/* 1. View the customer-level RFM analysis table */
SELECT *
FROM dbo.Project2_Customer_RFM_Analysis;
GO

/* 2. Segment summary */
SELECT
    Customer_Segment,
    COUNT(*) AS Customer_Count,
    SUM(Total_Sales) AS Total_Sales,
    SUM(Total_Profit) AS Total_Profit,
    AVG(Total_Sales) AS Average_Customer_Sales
FROM dbo.Project2_Customer_RFM_Analysis
GROUP BY Customer_Segment
ORDER BY Total_Sales DESC;
GO

/* 3. Customer segment percentages */
WITH SegmentCounts AS
(
    SELECT
        Customer_Segment,
        COUNT(*) AS Customer_Count
    FROM dbo.Project2_Customer_RFM_Analysis
    GROUP BY Customer_Segment
)
SELECT
    Customer_Segment,
    Customer_Count,
    Customer_Count * 100.0 /
        NULLIF(SUM(Customer_Count) OVER (), 0) AS Segment_Percentage
FROM SegmentCounts
ORDER BY Customer_Count DESC;
GO

/* 4. Top 10 customers by sales */
SELECT TOP 10
    Customer_ID,
    Customer_Name,
    Total_Sales,
    Total_Profit,
    Total_Orders,
    Recency,
    Frequency,
    Monetary,
    Customer_Segment
FROM dbo.Project2_Customer_RFM_Analysis
ORDER BY Total_Sales DESC;
GO

/* 5. RFM comparison by customer segment */
SELECT
    Customer_Segment,
    AVG(Recency) AS Average_Recency,
    AVG(Frequency) AS Average_Frequency,
    AVG(Monetary) AS Average_Monetary,
    AVG(Total_Sales) AS Average_Customer_Sales
FROM dbo.Project2_Customer_RFM_Analysis
GROUP BY Customer_Segment
ORDER BY Average_Monetary DESC;
GO

/* 6. At-risk customers */
SELECT
    Customer_ID,
    Customer_Name,
    Total_Sales,
    Total_Profit,
    Total_Orders,
    Recency,
    Frequency,
    Monetary,
    Customer_Segment
FROM dbo.Project2_Customer_RFM_Analysis
WHERE Customer_Segment = 'At Risk'
ORDER BY Total_Sales DESC;
GO

/* 7. Champions */
SELECT
    Customer_ID,
    Customer_Name,
    Total_Sales,
    Total_Profit,
    Total_Orders,
    Recency,
    Frequency,
    Monetary,
    RFM_Score
FROM dbo.Project2_Customer_RFM_Analysis
WHERE Customer_Segment = 'Champions'
ORDER BY Total_Sales DESC;
GO

/* 8. Loyal customers */
SELECT
    Customer_ID,
    Customer_Name,
    Total_Sales,
    Total_Profit,
    Total_Orders,
    Recency,
    Frequency,
    Monetary,
    RFM_Score
FROM dbo.Project2_Customer_RFM_Analysis
WHERE Customer_Segment = 'Loyal Customers'
ORDER BY Total_Sales DESC;
GO

/* 9. New / Promising customers */
SELECT
    Customer_ID,
    Customer_Name,
    Total_Sales,
    Total_Profit,
    Total_Orders,
    Recency,
    Frequency,
    Monetary,
    RFM_Score
FROM dbo.Project2_Customer_RFM_Analysis
WHERE Customer_Segment = 'New / Promising'
ORDER BY Total_Sales DESC;
GO

/* 10. Low-engagement customers */
SELECT
    Customer_ID,
    Customer_Name,
    Total_Sales,
    Total_Profit,
    Total_Orders,
    Recency,
    Frequency,
    Monetary,
    RFM_Score
FROM dbo.Project2_Customer_RFM_Analysis
WHERE Customer_Segment = 'Low Engagement'
ORDER BY Total_Sales DESC;
GO

/* 11. Customer ranking by monetary value */
SELECT
    Customer_ID,
    Customer_Name,
    Monetary,
    RANK() OVER (ORDER BY Monetary DESC) AS Monetary_Rank,
    Customer_Segment
FROM dbo.Project2_Customer_RFM_Analysis
ORDER BY Monetary_Rank;
GO

/* 12. Customer ranking by frequency */
SELECT
    Customer_ID,
    Customer_Name,
    Frequency,
    RANK() OVER (ORDER BY Frequency DESC) AS Frequency_Rank,
    Customer_Segment
FROM dbo.Project2_Customer_RFM_Analysis
ORDER BY Frequency_Rank;
GO

/* 13. Customer ranking by recency
       Lower Recency means a more recent purchase. */
SELECT
    Customer_ID,
    Customer_Name,
    Recency,
    RANK() OVER (ORDER BY Recency ASC) AS Recency_Rank,
    Customer_Segment
FROM dbo.Project2_Customer_RFM_Analysis
ORDER BY Recency_Rank;
GO

/* 14. RFM score comparison */
SELECT
    RFM_Score,
    COUNT(*) AS Customer_Count,
    AVG(Total_Sales) AS Average_Sales
FROM dbo.Project2_Customer_RFM_Analysis
GROUP BY RFM_Score
ORDER BY RFM_Score DESC;
GO

/* 15. Overall customer KPIs */
SELECT
    COUNT(DISTINCT Customer_ID) AS Total_Customers,
    SUM(Total_Sales) AS Total_Sales,
    SUM(Total_Profit) AS Total_Profit,
    AVG(Total_Sales) AS Average_Customer_Sales,
    AVG(Total_Orders) AS Average_Orders_Per_Customer
FROM dbo.Project2_Customer_RFM_Analysis;
GO

/* 16. Basic data-quality checks */
SELECT
    COUNT(*) AS Total_Rows,
    COUNT(DISTINCT Customer_ID) AS Unique_Customers,
    SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Customer_ID,
    SUM(CASE WHEN Customer_Name IS NULL THEN 1 ELSE 0 END) AS Missing_Customer_Name
FROM dbo.Project2_Customer_RFM_Analysis;
GO
