# Telecom Customer Churn Analysis

## Project Overview
End-to-end data analysis project to identify why customers leave a telecom company 
and predict which customers are likely to churn.

## Dataset
--> Source: Kaggle — Telco Customer Churn (BlastChar)
--> 7,032 customers, 21 features

## Tools Used

--> Python (pandas, seaborn, sklearn) 
--> Data cleaning, EDA, ML.
--> MS SQL Server | Business queries. 
--> Excel | Pivot tables and charts.
--> Power BI | Interactive dashboard.

## Key Findings
--> Overall churn rate: **26.58%**
--> Month-to-month contracts churn at 43% vs 3% for two-year contracts
--> Fiber optic customers churn at 42% despite paying the most
--> Customers in first 12 months churn at 48%
--> Churned customers pay **$13 more/month** than retained ones

## ML Model Results
| Model | Accuracy |

--> Logistic Regression | 78.54% |
--> Random Forest | 79.25% |
--> XGBoost | 76.40% |

------------------------  Winner: Random Forest at 79.25%   --------------------------------------------------

Top churn drivers: TotalCharges, MonthlyCharges, Tenure, Contract type

## Business Recommendations
1. Launch 90-day onboarding program for new customers — first year is highest risk
2. Offer 15-20% discount to move month-to-month customers to annual contracts
3. Investigate Fiber optic service quality — high churn despite premium pricing

