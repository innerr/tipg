table="$1"

set -u
set -e

source _env.sh
source _msq.sh

create_table()
{
	local table="$1"
	$mysql_cmd --local-infile < $meta_dir/schema/$table.sql
}

if [ -z "$table" ]; then
	ls $meta_dir/schema/ | awk -F '.' '{print $1}' | while read table; do
		create_table $table
	done
else
	create_table $table
fi
