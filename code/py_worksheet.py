# The Snowpark package is required for Python Worksheets. 
# You can add more packages by selecting them using the Packages control and then importing them.

# Snowpark for Python
import snowflake.snowpark as snowpark
from snowflake.snowpark import Session
from snowflake.snowpark.version import VERSION
from snowflake.snowpark.types import StructType, StructField, DoubleType, StringType
import snowflake.snowpark.functions as F
from snowflake.snowpark.functions import col
from snowflake.ml.modeling.linear_model import LinearRegression
from snowflake.ml.modeling.metrics import mean_squared_error
from snowflake.snowpark.functions import call_builtin
from snowflake.ml.modeling.xgboost import XGBRegressor
from snowflake.ml.modeling.metrics import mean_absolute_percentage_error, mean_squared_error, r2_score

# data science libs
import numpy as np
import json
import joblib

def main(session: snowpark.Session): 
    # Your code goes here, inside the "main" handler.
    tableName = 'monthly_weather_data'
    dataframe = session.table(tableName)

    features = ['AVG_CLDCVR', 'AVG_RELHUM', 'AVG_WINDSPD']
    label = ['AVG_TEMP']
    pred = ['PREDICTED_TEMP']
    
    train_df, test_df = dataframe.random_split(weights=[0.8, 0.2], seed=0)
    
    regressor = XGBRegressor(
        input_cols=features,
        label_cols=label,
        output_cols=pred
    )
    
    # Train
    regressor.fit(train_df)
    
    # Predict
    result = regressor.predict(test_df)
    # Return value will appear in the Results tab.
    return result

if __name__ == "__main__":
    main()