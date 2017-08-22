set -eu

blocks="$1"
table="$2"

source _dbgen.sh

if [ -z "$blocks" ]; then
	blocks="$tpch_blocks"
fi

dbgen "$blocks" "$table"
