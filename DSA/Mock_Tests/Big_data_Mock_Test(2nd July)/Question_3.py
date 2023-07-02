'Q3. '

from pyspark.sql import SparkSession
from pyspark.sql.functions import col

spark = SparkSession.builder.appName("transactions").getOrCreate()

df = spark.read.json("/students.json")

filter_df = df.filter(col("age") > 18)

filter_df.show()
