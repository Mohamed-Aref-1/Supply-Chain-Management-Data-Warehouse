# Supply-Chain-Management-Data-Warehouse
Overview
This project involves creating a database schema for a warehouse and shipping management system, analyzing shipping efficiency, and generating various reports. The project is implemented using SQL Server 2022 and includes scripts for table creation, data insertion, and analysis, auditing.

Project Components
Schema Creation:

Defines tables for Shipments, Products, Suppliers, Warehouses, Orders, and Time.
Establishes relationships between tables using foreign keys and applying the constraints.
Sample Data Insertion:

Inserts sample data into all tables to facilitate testing and analysis.
Data Analysis Scripts:

Analyzes shipping efficiency.
Reports total shipment values by supplier.
Retrieves top products by shipment quantities.
Provides distribution of shipment values by product category.
Implements a trigger to track historical changes in shipment records.
Creates views for consolidated shipment and product performance.
Identifies suppliers with significant changes in shipment values compared to the previous year.
Stored Procedures:

Includes a stored procedure to update shipment records with adjustments for shipping delays.
Installation
Clone the Repository:

sh
Copy code
git clone https://github.com/Mohamed-Aref-1/Supply-Chain-Management-Data-Warehouse.git
Set Up the Database:

Open SQL Server Management Studio (SSMS).
Connect to your SQL Server instance.
Run the SchemaAndSampleData.sql script to create the database schema and insert sample data.
Run Analysis Scripts:

Execute the various analysis scripts provided in this repository to generate reports and perform data analysis.
Usage
View Tables and Data:

Use SSMS or any SQL client to explore the created tables and sample data.
Run Queries:

Execute the provided queries and scripts to analyze shipping efficiency, supplier performance, and other aspects of the data.
Modify Data:

Update the Shipments table using the provided stored procedure to test historical tracking and audit features.
Files
SchemaAndSampleData.sql: Creates tables and inserts sample data.
ShippingAnalysis.sql: Contains scripts for data analysis and reporting.
AuditTrigger.sql: Implements an audit trigger for tracking shipment record changes.
Contributing
Feel free to contribute to this project by submitting issues or pull requests. Please follow the project's coding guidelines and ensure that any changes are well-tested.


Contact
For any questions or feedback, please contact mohamedare2003@gmail.com.

