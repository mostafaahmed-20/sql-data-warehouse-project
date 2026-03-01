USE [master]
GO
/****** Object:  Database [DataWarehouse]    Script Date: 02/03/2026 01:11:13 ******/
CREATE DATABASE [DataWarehouse]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DataWarehouse', FILENAME = N'D:\Sql_Server\MSSQL17.SQLEXPRESS\MSSQL\DATA\DataWarehouse.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DataWarehouse_log', FILENAME = N'D:\Sql_Server\MSSQL17.SQLEXPRESS\MSSQL\DATA\DataWarehouse_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DataWarehouse] SET COMPATIBILITY_LEVEL = 170
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DataWarehouse].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DataWarehouse] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DataWarehouse] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DataWarehouse] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DataWarehouse] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DataWarehouse] SET ARITHABORT OFF 
GO
ALTER DATABASE [DataWarehouse] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DataWarehouse] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DataWarehouse] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DataWarehouse] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DataWarehouse] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DataWarehouse] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DataWarehouse] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DataWarehouse] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DataWarehouse] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DataWarehouse] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DataWarehouse] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DataWarehouse] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DataWarehouse] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DataWarehouse] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DataWarehouse] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DataWarehouse] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DataWarehouse] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DataWarehouse] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DataWarehouse] SET  MULTI_USER 
GO
ALTER DATABASE [DataWarehouse] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DataWarehouse] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DataWarehouse] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DataWarehouse] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DataWarehouse] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DataWarehouse] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DataWarehouse] SET OPTIMIZED_LOCKING = OFF 
GO
ALTER DATABASE [DataWarehouse] SET QUERY_STORE = ON
GO
ALTER DATABASE [DataWarehouse] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DataWarehouse]
GO
/****** Object:  Schema [bronze]    Script Date: 02/03/2026 01:11:14 ******/
CREATE SCHEMA [bronze]
GO
/****** Object:  Schema [Gold]    Script Date: 02/03/2026 01:11:14 ******/
CREATE SCHEMA [Gold]
GO
/****** Object:  Schema [Silver]    Script Date: 02/03/2026 01:11:14 ******/
CREATE SCHEMA [Silver]
GO
/****** Object:  Table [bronze].[crm_cust_info]    Script Date: 02/03/2026 01:11:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bronze].[crm_cust_info](
	[cst_id] [int] NULL,
	[cst_key] [nvarchar](50) NULL,
	[cst_firstname] [nvarchar](50) NULL,
	[cst_lastname] [nvarchar](50) NULL,
	[cst_marital_status] [nvarchar](50) NULL,
	[cst_gndr] [nvarchar](50) NULL,
	[cst_create_date] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bronze].[crm_prd_info]    Script Date: 02/03/2026 01:11:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bronze].[crm_prd_info](
	[prd_id] [int] NULL,
	[prd_key] [nvarchar](50) NULL,
	[prd_nm] [nvarchar](50) NULL,
	[prd_cost] [int] NULL,
	[prd_line] [nvarchar](50) NULL,
	[prd_start_date] [datetime] NULL,
	[prd_end_date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bronze].[crm_sales_details]    Script Date: 02/03/2026 01:11:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
) ON [PRIMARY]
GO
/****** Object:  Table [bronze].[erp_CUST_AZ12]    Script Date: 02/03/2026 01:11:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bronze].[erp_CUST_AZ12](
	[CID] [nvarchar](50) NULL,
	[BDATE] [date] NULL,
	[GEN] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bronze].[erp_LOC_A101]    Script Date: 02/03/2026 01:11:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bronze].[erp_LOC_A101](
	[CID] [nvarchar](50) NULL,
	[CNTRY] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bronze].[erp_PX_CAT_G1V2]    Script Date: 02/03/2026 01:11:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bronze].[erp_PX_CAT_G1V2](
	[ID] [nvarchar](50) NULL,
	[CAT] [nvarchar](50) NULL,
	[SUBCAT] [nvarchar](50) NULL,
	[MAINTENANCE] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [bronze].[load_bronze]    Script Date: 02/03/2026 01:11:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
