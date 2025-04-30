# Alt Mobility - Order & Payment Data Analysis

## 📊 Project Overview

This project analyzes customer order and payment data for Alt Mobility using SQL and Power BI to derive key insights into order fulfillment, customer behavior, payment performance, and customer retention. The project includes both data exploration and interactive visualization components.

---

## 📁 Datasets

- `customer_orders.csv`: Contains information on order ID, customer ID, order amount, status, date, and shipping address.
- `payments.csv`: Contains payment ID, order ID, customer ID, payment amount, payment status, and method.

---

## ✅ Tasks Completed

### 1. Order and Sales Analysis
- Analyzed sales performance and order status using SQL.
- Calculated key metrics:
  - Total Orders
  - Delivered, Pending, Canceled Orders
  - Total Sales
- Identified trends in monthly sales and order volume.

### 2. Customer Analysis
- Explored customer purchase frequency.
- Segmented customers by behavior (new vs. repeat).
- Analyzed trends using Monthly Active Customers and Repeat Customers visualizations.

### 3. Payment Status Analysis
- Investigated completed, pending, and failed payments.
- Measured payment success rates by method (Credit Card, Bank Transfer, PayPal).
- Identified high failure rates for certain methods.

### 4. Order Details Report
- Built a comprehensive report combining:
  - Order ID
  - Customer ID
  - Order Amount
  - Order Date
  - Payment Status & Method
  - Order Status
- Linked order and payment data using SQL joins.

### 5. Customer Retention Analysis
- Calculated customer cohorts by First Purchase Month.
- Tracked returning customers by Months Since First Purchase.
- Visualized repeat behavior using line chart and cohort-based retention curve.

---

## 📈 Visualizations (Power BI)

Included visuals:
- KPI Cards: Total Orders, Total Sales, Delivered Orders, Revenue, etc.
- Pie Charts: Order Status, Payment Status, Payment Methods
- Bar Chart: Top Customers by Sales, Top Cities by Order Amount
- Line Chart: Monthly Sales and Orders Trends
- Line Chart: Repeat Customers by Months Since First Purchase
- Map: Orders & Revenue by Shipping Location

---

## 🧠 Key Insights

- **High Delivery Rate** with most orders successfully delivered.
- **Repeat Customer Behavior** increases in the 2nd and 3rd month post-first purchase.
- **Bank Transfer** is the most successful payment method.
- **Top Customers and Cities** contribute disproportionately to revenue—targeted engagement is recommended.
- **Seasonal Trends** suggest peak order volumes in specific months, supporting planning for promotions.

---

## 📌 Recommendations

- Focus marketing on cities and customers showing high revenue.
- Improve failed payment handling, especially for credit cards.
- Launch customer retention campaigns targeting months 1–3 after the first order.
- Consider loyalty programs for repeat purchasers to boost retention.
