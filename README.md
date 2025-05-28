# Advanced-SQL-Querying-Sales-Data-Analysis

## Intro:
Today we have a rather simple dataset but quite informative, about a fictional sales data of a fictional bike store. Where we have all sales recorded in the sales fact table and we have two dimension tables, one for product details and the other for customer details.

![drawSQL-image-export-2025-05-28](https://github.com/user-attachments/assets/c3378688-3cd3-4cb3-b2d0-d26b34f7f9ff)

## 01 - Loading dataset:
First we create empty tables for the dataset and then using load data infile to import each csv file into its respective table.

## 02 - Time series analysis:
Where we track change over time for a specific measure, in our case we calculate total sales amount over different periods to identify seasonality/growth over time, sample output:

<p align="center">
  <img src="https://github.com/user-attachments/assets/896db958-236c-4c7b-bb99-1898a4d66819" alt="image"/>
</p>

## 03 - Cumulative analysis:
In this section we aggregate the data progressively over time to help understand wether the business is growing or declining, using cumulative measures like running totals and moving averages, sample output:

![Screenshot 2025-05-29 001347](https://github.com/user-attachments/assets/4203944f-e1f3-4ea4-b991-17f74d060666)
![Screenshot 2025-05-29 001414](https://github.com/user-attachments/assets/f288e965-dcfb-4f44-ba3a-5b5137db5cc9)
