table="$1"

set -eu

source _load.sh

dir="$this_dir/$db_prefix$tpch_scale"

if [ -z "$table" ]; then
	ls $dir | awk -F '.' '{print $1}' | while read table; do
		load_table_from_file $table $dir/$table.tbl
	done
else
	load_table_from_file $table $dir/$table.tbl
fi
