source _helper.sh

export mysql_bin="mysql -h 127.0.0.1 -P 4000 -u root"
export dbgen_dir="$repo_dir/tpch-dbgen"
export meta_dir="$this_dir/meta"

export db_prefix="tpch"
export tpch_scale="1"
export tpch_blocks="5"

export database="$db_prefix$tpch_scale"
export dbgen_result_dir_prefix="$this_dir"/"$db_prefix"-"$tpch_scale"-c

