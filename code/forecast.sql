USE ROLE ACCOUNTADMIN;
CREATE OR REPLACE VIEW monthly_temp AS SELECT DATE_TRUNC('month', TIMESTAMP) AS Month_Start_Date, AVG(CLDCVR) AS Avg_CLDCVR, AVG(RELHUM) AS Avg_RELHUM, AVG(TEMP) AS Avg_TEMP, AVG(WINDSPD) AS Avg_WINDSPD FROM CLIMATOLOGY WHERE Month_Start_Date < '2018-01-01' GROUP BY Month_Start_Date ORDER BY Month_Start_Date;
CREATE OR REPLACE VIEW monthly_pred AS SELECT DATE_TRUNC('month', TIMESTAMP) AS Month_Start_Date, AVG(CLDCVR) AS Avg_CLDCVR, AVG(RELHUM) AS Avg_RELHUM, AVG(WINDSPD) AS Avg_WINDSPD FROM CLIMATOLOGY WHERE Month_Start_Date >= '2018-01-01' GROUP BY Month_Start_Date ORDER BY Month_Start_Date;

-- DROP SNOWFLAKE.ML.FORECAST month_forecast;
CREATE OR REPLACE SNOWFLAKE.ML.FORECAST month_forecast(
    input_data => SYSTEM$REFERENCE('VIEW', 'monthly_temp'),
    timestamp_colname => 'Month_Start_Date',
    target_colname =>'AVG_TEMP')

CALL month_forecast!FORECAST(
  INPUT_DATA => SYSTEM$REFERENCE('VIEW', 'monthly_pred'),
  TIMESTAMP_COLNAME => 'Month_Start_Date'
);

-- how to create multiple variables
-- CREATE OR REPLACE VIEW v3 AS SELECT [store_id, item] AS store_item, date, sales FROM sales_data;
-- SELECT * FROM v3;
-- CREATE SNOWFLAKE.ML.FORECAST model3(INPUT_DATA => SYSTEM$REFERENCE('VIEW', 'v3'),
--                                     SERIES_COLNAME => 'store_item',
--                                     TIMESTAMP_COLNAME => 'date',
--                                     TARGET_COLNAME => 'sales'
--                                    );
-- how to create multiple variables

-- system defined function error: [mlusererror] unsupported feature type for feature curr_avg. we currently only support numeric or string type exogenous features. in function _fit
