table="$1"

set -e
set -u

source _env.sh
source _msq.sh

query_count()
{
	local table="$1"
	$mysql_cmd -e "SELECT COUNT(*) FROM $table" | grep -v 'COUNT(' | grep -v '+' | awk '{print "'$table' "$1}'
}

if [ -z "$table" ]; then
	cat $meta_dir/tables | awk -F '\t' '{print $2}' | while read table; do
		query_count "$table";
	done
else
	query_count "$table"
fi
