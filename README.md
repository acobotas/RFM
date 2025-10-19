# Customer Segmentation & RFM Analysis

## Overview
This project focuses on **Customer Segmentation** using **RFM (Recency, Frequency, Monetary)** analysis. 
The goal is to identify customer groups that are most valuable or at risk, enabling data-driven marketing and retention strategies.

---

## Objectives
- Understand customer segmentation and its business relevance.
- Calculate RFM metrics using SQL.
- Segment customers based on RFM scores.
- Visualize insights in Power BI.
- Recommend marketing strategies based on findings.

---

## Data Source
The dataset is located in the `rfm` table within the TC BigQuery project. Results from both queries are in data folder.

**Data Period Used:** 2010-12-01 to 2011-12-01  
**Filters Applied:**
- Excluded null `CustomerID`
- Positive `UnitPrice` and `Quantity`
- Excluded `Country = 'Unspecified'`

---

## SQL Logic

### Step 1: Calculate Base Metrics
```sql
COUNT(DISTINCT InvoiceNo) AS frequency
MAX(DATE(InvoiceDate)) AS last_purchase_date
SUM(Quantity * UnitPrice) AS monetary
```
Recency is calculated from the reference date `'2011-12-01'`.

### Step 2: Calculate Quartiles
`APPROX_QUANTILES()` function is used to determine quartiles for Recency, Frequency, and Monetary values.

### Step 3: Assign R, F, and M Scores
Scores range from **1 to 4**, depending on which quartile a customer’s value falls into.

- **Recency:** Lower is better → 4 (most recent) to 1 (least recent)  
- **Frequency/Monetary:** Higher is better → 4 (most frequent/highest spenders) to 1 (least frequent/lowest spenders)

### Step 4: Compute Combined and Final RFM Score
```sql
ROUND((f_score + m_score + r_score) / 3.0, 2) AS rfm_score
```

### Step 5: Segment Customers
Customers are grouped into meaningful categories, such as:
- **Champions**
- **Loyal Customers**
- **Potential Loyalists**
- **At Risk**
- **Lost**
- **Promising**
- **Can’t Lose Them**
- **Hibernating**

### Step 6: Analyze & Visualize
Results are visualized using Power BI to highlight key customer segments and insights.

---

## Example Insights
- **Champions** have high R, F, and M scores—should be rewarded with loyalty programs.
- **At Risk** customers previously spent a lot but haven’t purchased recently—require reactivation campaigns.
- **Lost** customers show low engagement and value—may not be worth re-engagement efforts.
- **Promising** or **Potential Loyalists** can be nurtured with personalized offers.

---

## Tools Used
- **Google BigQuery (SQL)**
- **Power BI (Dashboard & Visualization)**
