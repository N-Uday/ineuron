'Q1.'

''' LINUX COMMANDS TO PUT EMPLOYEES.CSV IN HDFS
hdfs dfs -put '/config/workspace/employees.csv' /
'''
from pyspark.sql import SparkSession

spark = SparkSession.builder.master(local[*]).appName("demo").getOrCreate()

df = spark.read.option("header",True).csv("/employees.csv").option('inferSchema',True)

df.show(10)
