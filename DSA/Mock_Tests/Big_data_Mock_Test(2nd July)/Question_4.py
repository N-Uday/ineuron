'Q4. '

from pyspark.sql import SparkSession
from pyspark.sql.functions import avg

spark = SparkSession.builder.appName("Average Transaction").getOrCreate()

avg_amnt_df = transactions.groupBy("user_id").agg(avg("amount").alias("average_amount"))

avg_amnt_df.show()
