'Q2. '

from pyspark.sql import SparkSession
from pyspark.sql.functions import sum, desc

spark = SparkSession.builder.appName("Total Revenue").getOrCreate()

# Calculate the total revenue for each product
revenue_df = sales_data.groupBy("product_name").agg(sum("revenue").alias("total_revenue"))

ordered_df = revenue_df.orderBy(desc("total_revenue"))

ordered_df.show()
