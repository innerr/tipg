source _helper.sh

mysql_bin="mysql -h 127.0.0.1 -P 4000 -u root"
dbgen_dir="$repo_dir/tpch-dbgen"
meta_dir="$this_dir/meta"

db_prefix="tpch"
tpch_scale="1"
