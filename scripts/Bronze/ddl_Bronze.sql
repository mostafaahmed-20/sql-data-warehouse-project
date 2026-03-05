USE [master]
GO
CREATE DATABASE [DataWarehouse]

CREATE TABLE [bronze].[crm_cust_info](
	[cst_id] [int] NULL,
	[cst_key] [nvarchar](50) NULL,
	[cst_firstname] [nvarchar](50) NULL,
	[cst_lastname] [nvarchar](50) NULL,
	[cst_marital_status] [nvarchar](50) NULL,
	[cst_gndr] [nvarchar](50) NULL,
	[cst_create_date] [date] NULL

CREATE TABLE [bronze].[crm_prd_info](
	[prd_id] [int] NULL,
	[prd_key] [nvarchar](50) NULL,
	[prd_nm] [nvarchar](50) NULL,
	[prd_cost] [int] NULL,
	[prd_line] [nvarchar](50) NULL,
	[prd_start_date] [datetime] NULL,
	[prd_end_date] [datetime] NULL

CREATE TABLE [bronze].[crm_sales_details](
	[sls_ord_num] [nvarchar](50) NULL,
	[sls_prd_key] [nvarchar](50) NULL,
	[sls_cust_id] [int] NULL,
	[sls_order_dt] [int] NULL,
	[sls_ship_dt] [int] NULL,
	[sls_due_dt] [int] NULL,
	[sls_sales] [int] NULL,
	[sls_quantity] [int] NULL,
	[sls_price] [int] NULL

CREATE TABLE [bronze].[erp_CUST_AZ12](
	[CID] [nvarchar](50) NULL,
	[BDATE] [date] NULL,
	[GEN] [nvarchar](50) NULL

CREATE TABLE [bronze].[erp_LOC_A101](
	[CID] [nvarchar](50) NULL,
	[CNTRY] [nvarchar](50) NULL

CREATE TABLE [bronze].[erp_PX_CAT_G1V2](
	[ID] [nvarchar](50) NULL,
	[CAT] [nvarchar](50) NULL,
	[SUBCAT] [nvarchar](50) NULL,
	[MAINTENANCE] [nvarchar](50) NULL

CREATE   PROCEDURE [bronze].[load_bronze] AS
BEGIN
	DECLARE @Start_time DATETIME,
			@End_time DATETIME,
			@Batch_Start_Time DATETIME,
			@Batch_End_Time DATETIME

	BEGIN TRY
		SET @Batch_Start_Time = GETDATE();
		PRINT '====================================================================';
		PRINT 'LOADING BRONZE LAYER';
		PRINT '====================================================================';

		PRINT '====================================================================';
		PRINT 'LOADING CRM TABLES';
		PRINT '====================================================================';
		-- First DoubleCheck To make the table Empty
		PRINT '>> TRUNCATING THE TABLE AFTER BULK INSERTING'
		SET @Start_time = GETDATE();
		TRUNCATE TABLE Bronze.crm_cust_info;
		-- Start Inserting The data
			PRINT '>> BULK INSERT THE TABLE'
		BULK INSERT [bronze].[crm_cust_info] 
		FROM 'D:\DataWareHouse Project with baraa\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
			firstrow = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @End_time = GETDATE();
		PRINT '>> lOAD Duration of crm_cust_info table :' + CAST(DATEDIFF(SECOND,@Start_time,@End_time) AS NVARCHAR) + ' SECONDS'
		PRINT '----------------'

		-- Take A look to Bulked Data
		SELECT * FROM [bronze].[crm_cust_info];
		SELECT COUNT(*) FROM [bronze].[crm_cust_info];

		--===================================================
		-- Insert Second Table 
		--===================================================
		PRINT '>> TRUNCATING THE TABLE crm_prd_info AFTER BULK INSERTING'
		SET @Start_time = GETDATE();
		TRUNCATE TABLE [bronze].[crm_prd_info]
		PRINT '>> BULK INSERT DATA IN THE TABLE crm_prd_info'
		BULK INSERT Bronze.crm_prd_info
		FROM 'D:\DataWareHouse Project with baraa\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @End_time = GETDATE();
		PRINT '>> lOAD Duration of crm_prd_info table :' + CAST(DATEDIFF(SECOND,@Start_time,@End_time) AS NVARCHAR) + ' SECONDS'
		PRINT '----------------'

		SELECT COUNT(*) FROM [bronze].[crm_prd_info]
		SELECT * FROM [bronze].[crm_prd_info];

		--===================================================
		-- Insert Second Table 
		--===================================================
		PRINT '>> TRUNCATING THE TABLE crm_sales_details BULK INSERTING'
		SET @Start_time = GETDATE();
		TRUNCATE TABLE [bronze].[crm_sales_details];
		PRINT '>> BULK INSERT DATA IN THE TABLE crm_prd_info'
		BULK INSERT Bronze.crm_sales_details
		FROM 'D:\DataWareHouse Project with baraa\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @End_time = GETDATE();
		PRINT '>> lOAD Duration of crm_sales_details table :' + CAST(DATEDIFF(SECOND,@Start_time,@End_time) AS NVARCHAR) + ' SECONDS'
		PRINT '----------------'
 
		SELECT COUNT(*) FROM Bronze.crm_sales_details;
		SELECT * FROM [bronze].[crm_sales_details];

		--===================================================--===================================================--===================================================
		-- Bulking ERP Files To the DataWarehouse
		--===================================================--===================================================--===================================================
		PRINT '====================================================================';
		PRINT 'LOADING ERP TABLES';
		PRINT '====================================================================';
		SET @Start_time = GETDATE();
		PRINT '>> TRUNCATE TABLE erp_CUST_AZ12'
		TRUNCATE TABLE Bronze.erp_CUST_AZ12;
		PRINT '>> BULK INSERT IN TABLE erp_CUST_AZ12'
		BULK INSERT Bronze.erp_CUST_AZ12
		FROM 'D:\DataWareHouse Project with baraa\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @End_time = GETDATE();
		PRINT '>> lOAD Duration of erp_CUST_AZ12 table :' + CAST(DATEDIFF(SECOND,@Start_time,@End_time) AS NVARCHAR) + ' SECONDS'
		PRINT '----------------'

		SELECT * FROM Bronze.erp_CUST_AZ12;
		SELECT COUNT(*) FROM Bronze.erp_CUST_AZ12;

		--===================================================
		-- Insert Second Table 
		--===================================================
		PRINT '>> TRUNCATING THE TABLE erp_LOC_A101 BULK INSERTING'
		SET @Start_time = GETDATE();
		TRUNCATE TABLE bronze.erp_LOC_A101
		PRINT '>> BULK INSERT IN TABLE erp_LOC_A101'
		BULK INSERT [bronze].[erp_LOC_A101]
		FROM 'D:\DataWareHouse Project with baraa\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @End_time = GETDATE();
		PRINT '>> lOAD Duration of erp_LOC_A101 table :' + CAST(DATEDIFF(SECOND,@Start_time,@End_time) AS NVARCHAR) + ' SECONDS'
		PRINT '----------------'

		SELECT * FROM [bronze].[erp_LOC_A101];
		SELECT COUNT(*) FROM bronze.erp_LOC_A101;

		--===================================================
		-- Insert Third table
		--===================================================
		PRINT '>> TRUNCATING THE TABLE erp_PX_CAT_G1V2 BULK INSERTING'
		SET @Start_time = GETDATE();
		TRUNCATE TABLE Bronze.erp_PX_CAT_G1V2;
		PRINT '>> BULK INSERT IN TABLE erp_PX_CAT_G1V2'
		BULK INSERT [bronze].[erp_PX_CAT_G1V2]
		FROM 'D:\DataWareHouse Project with baraa\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @End_time = GETDATE();
		PRINT '>> lOAD Duration of erp_PX_CAT_G1V2 table :' + CAST(DATEDIFF(SECOND,@Start_time,@End_time) AS NVARCHAR) + ' SECONDS'
		PRINT '----------------'

		SELECT * FROM [bronze].[erp_PX_CAT_G1V2];
		SELECT COUNT(*) AS row_count FROM [bronze].[erp_PX_CAT_G1V2];
	END TRY
	BEGIN CATCH
		PRINT '=============================================';
		PRINT 'ERROR OCCURED DURING BRONZE LAYER';
		PRINT 'ERROR MESSAGE' + ERROR_MESSAGE();
		PRINT 'ERROR NUMBER' + CAST(ERROR_NUMBER() AS NVARCHAR(50));
		PRINT 'ERROR MESSAGE' + CAST(ERROR_STATE() AS NVARCHAR(50));
		PRINT '============================================='
	SET @Batch_End_Time = GETDATE();
	PRINT '=============================================================='
	PRINT '>> THE BRONZE LAYER IS COMPLETED'
	PRINT '>> THE BRONZE LAYER TAKES:' + CAST(DATEDIFF(SECOND,@Batch_start_time,@Batch_End_Time) AS NVARCHAR(50))
	PRINT '=============================================================='
	END CATCH
END

EXEC Bronze.load_Bronze;
GO
USE [master]
GO
ALTER DATABASE [DataWarehouse] SET  READ_WRITE 
GO
