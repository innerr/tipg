table="$1"

set -eu

source _env.sh
source _create.sh

if [ -z "$table" ]; then
	ls $meta_dir/schema/ | awk -F '.' '{print $1}' | while read table; do
		create_table $table
	done
else
	create_table $table
fi
