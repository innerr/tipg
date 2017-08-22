set -eu

blocks="$1"
table="$2"

source _load.sh

if [ "$blocks" == 1 ]; then
	load_table_from_file "$table" ""
else
	load_table_from_files "$table" "$blocks"
fi
