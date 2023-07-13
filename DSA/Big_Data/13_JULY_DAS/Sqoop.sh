# Question - A
sqoop import \
  --connect jdbc:oracle:thin:@//localhost:1521/orcl \
  --username my_username \
  --password my_password \
  --table my_table \
  --columns "col1,col2,col3" \
  --target-dir "C:\path\to\your\oracle_script.sh" \
  --delete-target-dir \
  --split-by split_col \
  --m 1

----------------------------------------------------------
# Question - B
sqoop import \
  --connect jdbc:mysql://localhost:3306/mydb \
  --username my_username \
  --password my_password \
  --table my_table \
  --target-dir "C:\path\to\your\mysql_script.sh" \
  --incremental lastmodified \
  --check-column last_modified \
  --last-value 2022-01-01
