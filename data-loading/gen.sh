blocks="$1"
table="$2"

set -eu

source _dbgen.sh

if [ -z "$blocks" ]; then
	blocks="$tpch_blocks"
fi

dbgen "$blocks" "$table"
