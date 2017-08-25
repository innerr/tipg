blocks="$1"
table="$2"

set -eu

if [ -z "$blocks" ] && [ -z "$blocks" ]; then
	echo "usage: <bin> [block-numbers] [table-name]"
	exit 1
fi

source _load.sh

if [ "$blocks" == 1 ]; then
	load_table_from_file "$table" ""
else
	load_table_from_files "$table" "$blocks"
fi
