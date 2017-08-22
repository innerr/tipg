table="$1"

set -eu

source _meta.sh
source _msq.sh

query_count()
{
	local table="$1"
	$mysql_cmd -e "SELECT COUNT(*) FROM $table" | grep -v 'COUNT(' | grep -v '+' | awk '{print "'$table' "$1}'
}

if [ -z "$table" ]; then
	get_table_names | while read table; do
		query_count "$table";
	done
else
	query_count "$table"
fi
