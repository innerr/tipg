table="$1"
times="$2"

set -eu

if [ -z "$table" ]; then
	echo "usage: <bin> table-name [times]" >&2
	exit 1
fi
if [ -z "$times" ]; then
	times=1
fi

source _load.sh
source _create.sh
source _dbgen.sh

file="$dbgen_dir/$table.tbl"
if [ ! -f "$file" ]; then
	echo "$file: not found" >&2
	exit 1
fi

create_table $table
for ((i = 0; i < $times; i++)); do
	load_table_from_file $table $file
done
