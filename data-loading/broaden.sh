table="$1"
blocks="$2"
times="$3"
suffix="$4"

set -eu

source _meta.sh

if [ -z "$times" ]; then
	echo "usage: <bin> table-name block-numbers broaden-times [output-suffix]" >&2
	exit 1
fi

if [ -z "$suffix" ]; then
	suffix="$times"
fi

dir="$dbgen_result_dir_prefix""$blocks"
for file in $dir/$table.tbl*; do
	output=${file/\.tbl/$suffix\.tbl}
	cat "$file" | python _broaden.py "$times" > "$output"
done
