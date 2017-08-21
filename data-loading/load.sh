table="$1"

set -e
set -u

source _env.sh
source _msq.sh

load_table_from_file()
{
	local table="$1"
	local file="$2"
	local sql="LOAD DATA LOCAL INFILE '$file' INTO TABLE $1 FIELDS TERMINATED BY '|'"
	$mysql_cmd --local-infile=1 -e "$sql"
}

dir="$this_dir/$db_prefix$tpch_scale"

if [ -z "$table" ]; then
	ls $dir | awk -F '.' '{print $1}' | while read table; do
		load_table_from_file $table $dir/$table.tbl
	done
else
	load_table_from_file $table $dir/$table.tbl
fi
