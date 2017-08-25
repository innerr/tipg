table="$1"
scale="$2"
times="$3"

set -eu

source _meta.sh

if [ -z "$times" ]; then
	echo "usage: <bin> table-name broaden-times" >&2
	exit 1
fi

dir="$dbgen_result_dir_prefix""$scale"
for file in $dir/$table*; do
	output=${file/\.tbl/$times\.tbl}
	cat "$file" | python _broaden.py "$times" > "$output"
done
