# Advanced-SQL-Querying-Sales-Data-Analysis

## Intro:
In this project we have a rather simple dataset but quite informative, about a fictional sales data of a fictional bike store. Where we have all sales recorded in the sales fact table and we have two dimension tables, one for product details and the other for customer details.

![drawSQL-image-export-2025-05-28](https://github.com/user-attachments/assets/c3378688-3cd3-4cb3-b2d0-d26b34f7f9ff)

## 01 - Loading dataset:
First we create empty tables for the dataset and then using load data infile to import each csv file into its respective table.

## 02 - Time series analysis:
Where we track change over time for a specific measure, in our case we calculate total sales amount over different periods to identify seasonality/growth over time. Sample output:

<p align="center">
  <img src="https://github.com/user-attachments/assets/896db958-236c-4c7b-bb99-1898a4d66819" alt="image"/>
</p>

## 03 - Cumulative analysis:
In this section we aggregate the data progressively over time to help understand wether the business is growing or declining, using cumulative measures like running totals and moving averages. Sample output:

<p align="center">
  <img src="https://github.com/user-attachments/assets/4203944f-e1f3-4ea4-b991-17f74d060666" alt="image"/>
  <img src="https://github.com/user-attachments/assets/f288e965-dcfb-4f44-ba3a-5b5137db5cc9" alt="image"/>
</p>

## 04 - Performance analysis:
It is about comparing a current value of a measure to a target value to help measure success and compare performance, for example comparing each year sales to the overall average sales, or current year sales to the previous year to track growth. Sample output:

<p align="center">
  <img src="https://github.com/user-attachments/assets/7df152a6-a5b6-47e0-b2dd-1193bb5c6dc2" alt="image"/>
  <img src="https://github.com/user-attachments/assets/9f85f154-100e-480a-8dce-dcd03d271184" alt="image"/>
</p>

## 05 - Calculating percentages:
Percentages or part-to-whole analysis is really important in analyzing categorical data in order to indicate how an individual part is performing compared to the overall, in general it shows how each category affect business groth the most. Sample output:

<p align="center">
  <img src="https://github.com/user-attachments/assets/fe5c4195-c440-4b56-976b-9e5ce7773ea5" alt="image"/>
</p>

## 06 - Data segmentation:
Where we group data into specific ranges to help understand the correlation between two measures, in our example we goup products by their cost ranges and group customers into 3 categories based on their spendings and activity. Sample output:

<p align="center">
  <img src="https://github.com/user-attachments/assets/bdd8165d-2794-4d2a-8c2d-e2aa793a25af" alt="image"/>
  <img src="https://github.com/user-attachments/assets/94ed9f90-2d1c-4c4a-a9f1-2120aad91a26" alt="image"/>
</p>

07 - Reporting:
Finally we combine everything we created so far into one single table (Report) cotaining some essential measures, data grouping/categorization and important KPIs. Such table will be ready to be exported to any visualization software to an insightful dashboard about the dataset. In our case we create a two reports: A report for customer data, and a report for products summary. Sample output:

![Screenshot 2025-05-29 052726](https://github.com/user-attachments/assets/552c5c7a-00ed-4c33-bb0a-f05054f9c02f)

![Screenshot 2025-05-29 053020](https://github.com/user-attachments/assets/1211360d-1068-47dd-8503-e4eba1f4bacc)


##### All the queries used in this project are in the Scripts folder.
