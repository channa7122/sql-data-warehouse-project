/*
=============================================================
Database Creation and Schema Setup
=============================================================
Script Objective:
    This script creates a database called 'DataWarehouse'. 
    If a database with that name already exists, it will be removed first, 
    then recreated. Inside the new database, three schemas are set up: 
    'bronze', 'silver', and 'gold'.
	
NOTICE:
    Executing this script will completely remove the existing 'DataWarehouse' 
    database, along with all its data. Make sure to back up any important 
    information before proceeding.
*/

USE master;
GO

-- Check if the 'DataWarehouse' database exists and recreate it
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create a new 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Define Schemas for data organization
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
