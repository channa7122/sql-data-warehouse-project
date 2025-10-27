# SQL Data Warehouse Project

Welcome to the **SQL Data Warehouse Project** repository.  
This project is a **complete data engineering and analytics implementation**, built from scratch using **SQL Server**. It demonstrates how to design, build, and manage a modern **data warehouse** following industry standards.

---

## 🏗️ Data Architecture

The project adopts the **Medallion Architecture** framework with three structured layers:

1. **Bronze Layer** – Raw data storage directly ingested from the source systems (ERP and CRM CSV files).  
2. **Silver Layer** – Data cleaning, standardization, and transformation for analytical consistency.  
3. **Gold Layer** – Business-ready data modeled using **Star Schema** for analytical reporting.

---

## 📖 Project Overview

This project covers every stage of the data pipeline:

- **Data Architecture** – Building the warehouse layers and structure.  
- **ETL Development** – Extract, Transform, and Load processes in SQL Server.  
- **Data Modeling** – Designing fact and dimension tables optimized for performance.  
- **Analytics** – Generating insights into customers, products, and sales.  

This repository is ideal for learners and professionals aiming to strengthen their experience in:  
- SQL Development  
- ETL & Data Engineering  
- Data Modeling  
- Business Intelligence  

---

## 🛠️ Tools & Resources

- **SQL Server Express** – For hosting databases  
- **SSMS** – SQL Server Management Studio  
- **Draw.io** – For diagrams and data architecture visualization  
- **GitHub** – For version control  
- **Notion** – For project documentation  

---

## 📂 Repository Structure
sql-data-warehouse-project/
│
├── raw_data/ # Source data from ERP and CRM systems
├── documents/ # Architecture diagrams, data catalog, and documentation
│ ├── etl_flow.drawio
│ ├── data_model.drawio
│ ├── naming_conventions.md
│
├── scripts/
│ ├── bronze/ # Load raw data
│ ├── silver/ # Transform and standardize
│ ├── gold/ # Create analytical models
│
├── tests/ # Data validation and testing scripts
│
├── README.md
├── LICENSE
└── .gitignore
 
---

## 🧩 Project Goal

To build an end-to-end data warehouse capable of unifying, transforming, and analyzing sales data for better decision-making.

---

## 🛡️ License

This project is distributed under the **MIT License**.  
You are free to use, modify, and share it with proper attribution.

---

## ✍️ Author

**Mohamed Channa**  
Data engineering student, enthusiast exploring modern data architecture and analytics.

