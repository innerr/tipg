source _env.sh
source _dbgen.sh
dbgen 1

for file in tpch1/*.tbl; do
	sql="LOAD DATA LOCAL INFILE '$file' INTO TABLE customer FIELDS TERMINATED BY '|'"
	$mysql_bin --local-infile -D "$db_prefix$tpch_scale" -e "$sql"
	break
done
