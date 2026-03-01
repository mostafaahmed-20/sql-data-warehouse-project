-- Insert Data To first Table 
SET DATEFORMAT dmy;
GO

-- First DoubleCheck To make the table Empty
TRUNCATE TABLE Bronze.crm_cust_info;
-- Start Inserting The data
BULK INSERT [bronze].[crm_cust_info] 
FROM 'D:\DataWareHouse Project with baraa\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
WITH (
	firstrow = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);
-- Take A look to Bulked Data
SELECT * FROM [bronze].[crm_cust_info];
SELECT COUNT(*) FROM [bronze].[crm_cust_info];

--===================================================
-- Insert Second Table 
--===================================================

TRUNCATE TABLE [bronze].[crm_prd_info]
BULK INSERT Bronze.crm_prd_info
FROM 'D:\DataWareHouse Project with baraa\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

SELECT COUNT(*) FROM [bronze].[crm_prd_info]
SELECT * FROM [bronze].[crm_prd_info];

--===================================================
-- Insert Second Table 
--===================================================
TRUNCATE TABLE [bronze].[crm_sales_details];
BULK INSERT Bronze.crm_sales_details
FROM 'D:\DataWareHouse Project with baraa\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
WITH(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);
 
SELECT COUNT(*) FROM Bronze.crm_sales_details;
SELECT * FROM [bronze].[crm_sales_details];

--===================================================--===================================================--===================================================
-- Bulking ERP Files To the DataWarehouse
--===================================================--===================================================--===================================================
TRUNCATE TABLE Bronze.erp_CUST_AZ12;
BULK INSERT Bronze.erp_CUST_AZ12
FROM 'D:\DataWareHouse Project with baraa\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
WITH(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

SELECT * FROM Bronze.erp_CUST_AZ12;
SELECT COUNT(*) FROM Bronze.erp_CUST_AZ12;

--===================================================
-- Insert Second Table 
--===================================================
TRUNCATE TABLE bronze.erp_LOC_A101
BULK INSERT [bronze].[erp_LOC_A101]
FROM 'D:\DataWareHouse Project with baraa\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
WITH(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

SELECT * FROM [bronze].[erp_LOC_A101];
SELECT COUNT(*) FROM bronze.erp_LOC_A101;

--===================================================
-- Insert Third table
--===================================================

TRUNCATE TABLE Bronze.erp_PX_CAT_G1V2;
BULK INSERT [bronze].[erp_PX_CAT_G1V2]
FROM 'D:\DataWareHouse Project with baraa\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
WITH(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

SELECT * FROM [bronze].[erp_PX_CAT_G1V2];
SELECT COUNT(*) AS row_count FROM [bronze].[erp_PX_CAT_G1V2];
