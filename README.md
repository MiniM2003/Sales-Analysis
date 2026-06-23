# 📊 Sales Analysis | End-to-End Data Analytics Project

## 📌 Project Overview

Superstore Sales Analysis project focuses on analyzing a retail sales dataset and developing an interactive **Sales Analysis Dashboard** using **Excel, SQL, Python (Pandas), and Power BI**. The objective is to transform raw sales data into meaningful business insights that support data-driven decision-making.

The project follows the complete Data Analytics lifecycle, starting from data understanding and cleaning to SQL analysis, KPI creation, visualization, and dashboard development.

---

## 🎯 Business Objective

The primary goals of this project are:

* Analyze overall sales and profitability.
* Identify top-performing products and categories.
* Discover loss-making products and regions.
* Analyze customer segments and shipping preferences.
* Track sales and profit trends over time.
* Generate actionable business recommendations.

---

## 🛠️ Tools & Technologies Used

| Tool            | Purpose                                 |
| --------------- | --------------------------------------- |
| Microsoft Excel | Initial Data Exploration                |
| Python (Pandas) | Data Cleaning & Preprocessing           |
| SQL             | Data Analysis & Business Queries        |
| Power BI        | Dashboard Development & Visualization   |
| DAX             | KPI Calculations and Measures           |
| GitHub          | Project Documentation & Version Control |

---

## 📂 Dataset Information

### Dataset Name

**Superstore Sales Dataset**

### Dataset Contains

* Order ID
* Order Date
* Ship Date
* Ship Mode
* Customer ID
* Customer Name
* Segment
* Country
* State
* City
* Region
* Product ID
* Category
* Sub-Category
* Product Name
* Sales
* Quantity
* Discount
* Profit

---

## 📋 Project Workflow

The project was completed in the following phases:

```text
1. Data Understanding
       ↓
2. Data Cleaning (Excel & Python)
       ↓
3. Exploratory Data Analysis (EDA)
       ↓
4. SQL Business Analysis
       ↓
5. KPI Creation
       ↓
6. Dashboard Design Planning
       ↓
7. Power BI Dashboard Development
       ↓
8. Business Insights Generation
       ↓
9. GitHub Documentation
```

---

### Phase 1: Data Understanding

Before performing analysis, the dataset was explored to understand:

* Number of rows and columns
* Data types
* Missing values
* Duplicate records
* Business metrics available

#### Initial Checks

* Total Records
* Total Sales
* Total Profit
* Categories
* Regions
* Customer Segments

---

### Phase 2: Data Cleaning

#### Step 1: Data Cleaning in Excel

Performed basic validation:

#### Checked For

* Blank values
* Duplicate rows
* Incorrect date formats
* Unwanted spaces
* Data consistency

#### Excel Functions Used

```excel
TRIM()
PROPER()
COUNTIF()
FILTER()
```

---

### Step 2: Data Cleaning Using Python (Pandas)

#### Libraries Used

```python
import pandas as pd
```

#### Load Dataset

```python
df = pd.read_csv("superstore.csv")
```

#### Check Missing Values

```python
df.isnull().sum()
```

#### Remove Duplicates

```python
df.drop_duplicates(inplace=True)
```

#### Convert Date Format

```python
df['Order Date'] = pd.to_datetime(df['Order Date'])
```

#### Verify Data Types

```python
df.info()
```

#### Save Cleaned Dataset

```python
df.to_csv("cleaned_superstore.csv", index=False)
```

---

## Phase 3: Exploratory Data Analysis (EDA)

Performed EDA to identify patterns and trends.

### Questions Explored

* Which category generates highest sales?
* Which region contributes most revenue?
* Which products are most profitable?
* Which products generate losses?
* How do discounts affect profit?
* Which months generate maximum sales?

### Python Analysis

```python
df.groupby('Category')['Sales'].sum()
```

```python
df.groupby('Region')['Profit'].sum()
```

```python
df.groupby('Sub-Category')['Profit'].sum()
```

---

## Phase 4: SQL Business Analysis

SQL was used to answer business questions.

---

### Total Sales

```sql
SELECT SUM(Sales) AS Total_Sales
FROM Superstore;
```

---

### Total Profit

```sql
SELECT SUM(Profit) AS Total_Profit
FROM Superstore;
```

---

### Sales by Region

```sql
SELECT Region,
SUM(Sales) AS Sales
FROM Superstore
GROUP BY Region
ORDER BY Sales DESC;
```

---

### Top 10 Products by Sales

```sql
SELECT Product_Name,
SUM(Sales) AS Sales
FROM Superstore
GROUP BY Product_Name
ORDER BY Sales DESC
LIMIT 10;
```

---

### Profit Margin by Category

```sql
SELECT Category,
ROUND((SUM(Profit)/SUM(Sales))*100,2) AS Profit_Margin
FROM Superstore
GROUP BY Category;
```

---

### Top 10 Customers

```sql
SELECT Customer_Name,
SUM(Sales) AS Sales
FROM Superstore
GROUP BY Customer_Name
ORDER BY Sales DESC
LIMIT 10;
```

---

## Phase 5: KPI Creation

Key Performance Indicators (KPIs) were created using DAX in Power BI.

---

### Total Sales

```DAX
Total Sales =
SUM(Superstore[Sales])
```

---

### Total Profit

```DAX
Total Profit =
SUM(Superstore[Profit])
```

---

### Total Orders

```DAX
Total Orders =
DISTINCTCOUNT(Superstore[Order ID])
```

---

### Profit Margin %

```DAX
Profit Margin =
DIVIDE(
SUM(Superstore[Profit]),
SUM(Superstore[Sales]),
0
) * 100
```

---

### Sales Category

```DAX
Sales Category =
SWITCH(
TRUE(),
[Sales] < 100, "Very Low",
[Sales] < 500, "Low",
[Sales] < 1000, "Medium",
[Sales] < 5000, "High",
"Very High"
)
```

---

## Phase 6: Dashboard Planning

Before creating visuals, a wireframe was designed.

### Dashboard Sections

```text
KPIs
↓
Filters
↓
Product Analysis
↓
Regional Analysis
↓
Trend Analysis
↓
Profitability Analysis
↓
Business Insights
```

---

## Phase 7: Power BI Dashboard Development

### Dashboard Components

#### KPI Cards

* Total Sales
* Total Profit
* Total Orders
* Profit Margin %

---

#### Filters (Slicers)

* Region
* Category
* Sub-Category
* Sales Category
* Date Range

---

#### Visualizations

#### Product Analysis

* Top 10 Best Selling Products

#### Region Analysis

* Sales by Region

#### Shipping Analysis

* Sales by Ship Mode

#### Segment Analysis

* Quarter-wise Sales by Segment

#### Trend Analysis

* Monthly Sales Trend
* Quarterly Sales & Profit Trend
* Yearly Profit Trend

#### Profitability Analysis

* Profit by Sub-Category
* Loss-Making Sub-Categories
* Discount Impact on Profit

#### Insights Panel

* Dynamic Business Recommendations

---

## 📈 Dashboard Preview

---

### Key Business Insights

### Sales Performance

* Total Sales reached **$2.30M**.
* Total Profit reached **$286.4K**.
* Overall Profit Margin was **12.47%**.

### Regional Analysis

* West Region generated the highest sales.
* South Region generated the lowest sales.

### Product Analysis

* Technology was the highest revenue-generating category.
* Copiers generated the highest profit.
* Tables, Bookcases, and Supplies generated losses.

### Customer Analysis

* Consumer Segment contributed the highest sales.

### Shipping Analysis

* Standard Class was the most preferred shipping mode.

### Trend Analysis

* Sales and profit increased steadily over the years.
* Q4 recorded the highest sales performance.

---

### Business Recommendations

### Increase Investment In

* Technology Category
* Copiers
* Phones
* Accessories

### Improve Profitability Of

* Tables
* Bookcases
* Supplies

### Discount Strategy

* Reduce excessive discounts on low-profit products.

### Regional Growth

* Improve sales strategies in South Region.

---

## Project Structure

```text 
Sales-Analysis/
│
├── Superstore.csv
├── Cleaned_Superstore.csv
├── Sales Analysis.ipynb
├── sales.sql
├── Sales Dashboards.pbix
└── README.md
```
---




## Skills Demonstrated

### Data Cleaning

* Excel
* Pandas

### Data Analysis

* SQL Queries
* Exploratory Data Analysis

### Business Intelligence

* Power BI
* DAX
* Dashboard Design

### Data Visualization

* KPI Reporting
* Trend Analysis
* Profitability Analysis

### Business Understanding

* Sales Analysis
* Customer Analysis
* Product Analysis
* Regional Analysis

---

## Project Outcome

This project successfully transformed raw sales data into an interactive dashboard that enables stakeholders to monitor performance, identify opportunities, and make informed business decisions. The dashboard provides a comprehensive view of sales, profit, customer behavior, regional performance, and product profitability through clear visualizations and actionable insights.

---

## 👨‍💻 Author

**Mini M**
Aspiring Data Analyst | SQL | Power BI | Python | Excel

📧 Email: *minimanikandan2003@gmail.com*

⭐ If you found this project helpful, please consider giving it a **Star** on GitHub.
