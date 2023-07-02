'Q5. '

from pyspark.sql import SparkSession
from pyspark.sql.functions import hour, count

spark = SparkSession.builder.appName("test").getOrCreate()
hour_logs = logs.withColumn("hour", hour("timestamp"))

event_count_df = hour_logs.groupBy("hour").agg(count("event").alias("event_count"))

sorted_df = event_count_df.orderBy("hour")

sorted_df.show()
