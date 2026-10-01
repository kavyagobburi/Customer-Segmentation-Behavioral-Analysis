# Customer-Segmentation-Behavioral-Analysis
# Customer Segmentation & Behavioral Analysis

A self-initiated Data Analyst portfolio project focused on understanding customer purchasing behavior through RFM analysis, customer segmentation, SQL analysis, and Power BI.

 Project Overview

This project analyzes customer transaction data to understand purchasing behavior, identify high-value customers, identify customers who may be at risk of becoming inactive, and support targeted business decisions.

Project Type: Self-initiated portfolio project using synthetic/realistic customer transaction data.

 Business Problem

The objective is to transform customer transaction data into actionable insights by understanding:

- Customer purchasing behavior
- Customer value
- Purchase frequency
- Recency of customer activity
- High-value customer segments
- At-risk customers
- Customer engagement levels

 Tools & Technologies

- **Python**
- **Pandas**
- **SQL Server**
- **Power BI**
- **Power Query**
- **Jupyter Notebook**

Project Workflow

Raw Transaction Data → Data Cleaning → RFM Analysis → Customer Segmentation → SQL Analysis → Power BI Dashboard → Business Insights

Data Cleaning

The dataset initially contained **1,502 transaction rows**, including duplicate transaction records.

Data preparation included:

- Trimming unnecessary spaces
- Standardizing Segment and Category values
- Handling missing Discount values
- Identifying and removing duplicate transactions
- Converting Order_Date to the correct date format
- Performing data quality checks

After cleaning, the analysis used **1,500 transaction records**.

RFM Analysis

RFM analysis was used to evaluate customers based on:

- Recency — How recently the customer purchased
- Frequency — How often the customer purchased
- Monetary — How much the customer spent

RFM scores were calculated and used to classify customers into meaningful behavioral segments.

 Customer Segments

The analysis created five customer segments:

- Champions
- Loyal Customers
- At Risk
- New / Promising
- Low Engagement

After customer-level duplicate cleanup, the dashboard contains 250 customers.

 Power BI Dashboard

The interactive dashboard includes:

- Total Sales KPI
- Total Customers KPI
- Total Profit KPI
- Average Customer Sales KPI
- Customer Segment Distribution
- Sales by Customer Segment
- Average Customer Value by Segment
- Average Purchase Frequency by Segment
- At-Risk Customers table
- Recency vs Frequency analysis
- Customer Segment slicer
- Customer Details drill-through page

 Key Dashboard KPIs

| KPI | Result |
|---|---:|
| Total Sales | ₹17.68M |
| Total Customers | 250 |
| Total Profit | ₹4.13M |
| Average Customer Sales | ₹70.72K |

 Segment Distribution

| Customer Segment | Customers |
|---|---:|
| Low Engagement | 70 |
| Loyal Customers | 65 |
| At Risk | 43 |
| Champions | 41 |
| New / Promising | 31 |

 Business Insights

The analysis was used to understand:

- Which customer groups contribute significant revenue
- Differences in purchasing frequency across segments
- Customers who may require re-engagement
- High-value customer behavior
- Opportunities for targeted customer engagement

 Dashboard Screenshots

Dashboard screenshots and the customer drill-through page are included in the `screenshots` folder.

 Project Structure


Customer-Segmentation-Behavioral-Analysis/
│
├── README.md
│
├── data/
│   └── Project2_Customer_Segmentation_Cleaned.xlsx
│
├── python/
│   └── Project2_Customer_Segmentation.ipynb
│
├── sql/
│   └── Project2_Customer_RFM_Analysis.sql
│
├── powerbi/
│   └── Customer_Segmentation_Behavioral_Analysis.pbix
│
├── screenshots/
│   ├── customer-segmentation-dashboard.png
│   └── customer-details.png
│
└── documentation/
    └── project-notes.md
Role

Data Analyst — Self-Initiated Portfolio Project

 Links

GitHub: https://github.com/kavyagobburi

LinkedIn: https://www.linkedin.com/in/kavya-gobburi-04172733/

Disclaimer

This is a self-initiated portfolio project created using synthetic/realistic customer transaction data. It is not based on confidential data or work performed for an actual client or employer.

    
