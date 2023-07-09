from pyspark.sql import SparkSession
from pyspark.sql.functions import split, explode
from pyspark.sql.types import StringType

# Create SparkSession
spark = SparkSession.builder.appName("WordCount").getOrCreate()

# Read the i/p file
lines = spark.read.text("input.txt")

# Split into words
words = lines.select(explode(split(lines.value, "\\W+")).alias("word"))
words = words.filter(words.word != "")

# Count the occurrences of each word
word_counts = words.groupBy("word").count().orderBy("count", ascending=False)

# results
word_counts.show()

spark.stop()
