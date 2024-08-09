# Supply-Chain-Management-Data-Warehouse

## Overview

This project involves creating a database schema for a warehouse and shipping management system, analyzing shipping efficiency, and generating various reports. The project is implemented using SQL Server 2022 and includes scripts for table creation, data insertion, analysis, and auditing.

## Project Components

### Schema Creation

- Defines tables for `Shipments`, `Products`, `Suppliers`, `Warehouses`, `Orders`, and `Time`.
- Establishes relationships between tables using foreign keys and applying constraints.

### Sample Data Insertion

- Inserts sample data into all tables to facilitate testing and analysis.

### Data Analysis Scripts

- Analyzes shipping efficiency.
- Reports total shipment values by supplier.
- Retrieves top products by shipment quantities.
- Provides distribution of shipment values by product category.
- Implements a trigger to track historical changes in shipment records.
- Creates views for consolidated shipment and product performance.
- Identifies suppliers with significant changes in shipment values compared to the previous year.

### Stored Procedures

- Includes a stored procedure to update shipment records with adjustments for shipping delays.

## Installation

### Clone the Repository

```sh
git clone https://github.com/Mohamed-Aref-1/Supply-Chain-Management-Data-Warehouse.git
```
### Set Up the Database

1. Open SQL Server Management Studio (SSMS).
2. Connect to your SQL Server instance.
3. Run the `SchemaAndSampleData.sql` script to create the database schema and insert sample data.

### Run Analysis Scripts

- Execute the various analysis scripts provided in this repository to generate reports and perform data analysis.

## Usage

### View Tables and Data

- Use SSMS or any SQL client to explore the created tables and sample data.

### Run Queries

- Execute the provided queries and scripts to analyze shipping efficiency, supplier performance, and other aspects of the data.

### Modify Data

- Update the `Shipments` table using the provided stored procedure to test historical tracking and audit features.

## Files
## Files

- **`SchemaAndSampleData.sql`**: 
  - Creates the database schema including tables for `Shipments`, `Products`, `Suppliers`, `Warehouses`, `Orders`, and `Time`.
  - Establishes foreign key relationships between tables.
  - Inserts initial sample data into all tables to facilitate testing and analysis.

- **`ShippingAnalysis.sql`**: 
  - Contains scripts for analyzing shipping efficiency, such as:
    - Reporting total shipment values by supplier.
    - Retrieving top products by shipment quantities.
    - Providing the distribution of shipment values by product category.
  - Includes queries to generate reports on consolidated shipment and product performance.
  - Identifies suppliers with significant changes in shipment values compared to the previous year.

- **`AuditTrigger.sql`**: 
  - Implements a trigger for the `Shipments` table that:
    - Tracks historical changes to shipment records.
    - Records old and new quantities, along with the modification date and the user who made the change.
    - Inserts these records into an audit table to maintain a history of changes.


## Contributing

Feel free to contribute to this project by submitting issues or pull requests. Please follow the project's coding guidelines and ensure that any changes are well-tested.

## Contact

For any questions or feedback, please contact [mohamedare2003@gmail.com](mailto:mohamedare2003@gmail.com).
