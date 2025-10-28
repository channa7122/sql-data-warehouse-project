/*
===============================================================================
Data Quality Verification
===============================================================================
Purpose:
    This script conducts multiple checks to ensure the integrity, accuracy, and 
    standardization of data in the 'silver' layer. The checks include:
    - Detecting null or duplicate primary keys.
    - Identifying extra spaces in text fields.
    - Validating consistent and standardized data.
    - Verifying correct date sequences.
    - Ensuring internal data consistency between fields.

Notes:
    - Execute these queries after loading the Silver Layer.
    - Investigate and resolve any issues flagged by these checks.
===============================================================================
*/

-- ====================================================================
-- Validating 'silver.crm_cust_info'
-- ====================================================================
-- Detect duplicate or missing primary keys
-- Expectation: No records returned
SELECT 
    cst_id,
    COUNT(*) 
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL;

-- Detect unwanted leading or trailing spaces
-- Expectation: No records returned
SELECT 
    cst_key 
FROM silver.crm_cust_info
WHERE cst_key != TRIM(cst_key);

-- Verify standardized values for marital status
SELECT DISTINCT 
    cst_marital_status 
FROM silver.crm_cust_info;

-- ====================================================================
-- Validating 'silver.crm_prd_info'
-- ====================================================================
-- Detect duplicate or missing product IDs
-- Expectation: No records returned
SELECT 
    prd_id,
    COUNT(*) 
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL;

-- Detect extra spaces in product names
-- Expectation: No records returned
SELECT 
    prd_nm 
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm);

-- Check for invalid or missing product costs
-- Expectation: No records returned
SELECT 
    prd_cost 
FROM silver.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL;

-- Verify product line values are standardized
SELECT DISTINCT 
    prd_line 
FROM silver.crm_prd_info;

-- Detect inconsistent start and end dates
-- Expectation: No records returned
SELECT 
    * 
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt;

-- ====================================================================
-- Validating 'silver.crm_sales_details'
-- ====================================================================
-- Check for invalid dates
-- Expectation: Only valid dates
SELECT 
    NULLIF(sls_due_dt, 0) AS sls_due_dt 
FROM bronze.crm_sales_details
WHERE sls_due_dt <= 0 
    OR LEN(sls_due_dt) != 8 
    OR sls_due_dt > 20500101 
    OR sls_due_dt < 19000101;

-- Verify order dates precede shipping and due dates
-- Expectation: No records returned
SELECT 
    * 
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt 
   OR sls_order_dt > sls_due_dt;

-- Confirm sales match quantity multiplied by price
-- Expectation: No discrepancies
SELECT DISTINCT 
    sls_sales,
    sls_quantity,
    sls_price 
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
   OR sls_sales IS NULL 
   OR sls_quantity IS NULL 
   OR sls_price IS NULL
   OR sls_sales <= 0 
   OR sls_quantity <= 0 
   OR sls_price <= 0
ORDER BY sls_sales, sls_quantity, sls_price;

-- ====================================================================
-- Validating 'silver.erp_cust_az12'
-- ====================================================================
-- Identify birthdates outside expected range
-- Expectation: Dates between 1924-01-01 and today
SELECT DISTINCT 
    bdate 
FROM silver.erp_cust_az12
WHERE bdate < '1924-01-01' 
   OR bdate > GETDATE();

-- Verify gender values are standardized
SELECT DISTINCT 
    gen 
FROM silver.erp_cust_az12;

-- ====================================================================
-- Validating 'silver.erp_loc_a101'
-- ====================================================================
-- Check country codes and standardization
SELECT DISTINCT 
    cntry 
FROM silver.erp_loc_a101
ORDER BY cntry;

-- ====================================================================
-- Validating 'silver.erp_px_cat_g1v2'
-- ====================================================================
-- Detect unwanted spaces in category fields
-- Expectation: No records returned
SELECT 
    * 
FROM silver.erp_px_cat_g1v2
WHERE cat != TRIM(cat) 
   OR subcat != TRIM(subcat) 
   OR maintenance != TRIM(maintenance);

-- Verify maintenance field values are consistent
SELECT DISTINCT 
    maintenance 
FROM silver.erp_px_cat_g1v2;
