-- Query 1 — Overall Churn Rate:

SELECT 
    COUNT(*) AS total_customers,
    SUM(Churn) AS total_churned,
    CAST(SUM(Churn) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS churn_rate_percent
FROM customers;


-- Query 2 — Churn by Contract Type:

SELECT 
    Contract,
    COUNT(*) AS total_customers,
    SUM(Churn) AS churned,
    CAST(SUM(Churn) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS churn_rate_percent
FROM customers
GROUP BY Contract
ORDER BY churn_rate_percent DESC;

-- Query 3 — Churn by Internet Service:

SELECT 
    InternetService,
    COUNT(*) AS total_customers,
    SUM(Churn) AS churned,
    CAST(SUM(Churn) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS churn_rate_percent
FROM customers
GROUP BY InternetService
ORDER BY churn_rate_percent DESC;

-- Query 4 — Churn by Tenure Group:

SELECT 
    CASE 
        WHEN tenure <= 12 THEN '0-12 months'
        WHEN tenure <= 24 THEN '13-24 months'
        WHEN tenure <= 48 THEN '25-48 months'
        ELSE '49+ months'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(Churn) AS churned,
    CAST(SUM(Churn) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS churn_rate_percent
FROM customers
GROUP BY 
    CASE 
        WHEN tenure <= 12 THEN '0-12 months'
        WHEN tenure <= 24 THEN '13-24 months'
        WHEN tenure <= 48 THEN '25-48 months'
        ELSE '49+ months'
    END
ORDER BY churn_rate_percent DESC;

-- Query 5 — Avg Charges: Churned vs Retained:

SELECT 
    CASE WHEN Churn = 1 THEN 'Churned' ELSE 'Retained' END AS customer_status,
    COUNT(*) AS total_customers,
    CAST(AVG(MonthlyCharges) AS DECIMAL(8,2)) AS avg_monthly_charges,
    CAST(AVG(TotalCharges) AS DECIMAL(8,2)) AS avg_total_charges
FROM customers
GROUP BY Churn;


-- Query 6 — Churn by Payment Method:

SELECT 
    PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(Churn) AS churned,
    CAST(SUM(Churn) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS churn_rate_percent
FROM customers
GROUP BY PaymentMethod
ORDER BY churn_rate_percent DESC;


-- Query 7 — Top 10 High Risk Customers:

SELECT TOP 10
    customerID,
    Contract,
    tenure,
    MonthlyCharges,
    TotalCharges,
    InternetService,
    PaymentMethod
FROM customers
WHERE 
    Churn = 0
    AND Contract = 'Month-to-month'
    AND tenure < 12
    AND MonthlyCharges > 70
ORDER BY MonthlyCharges DESC;