set -e
set -u

source _env.sh

dbgen_bin()
{
	time $dbgen_dir/dbgen -b $dbgen_dir/dists.dss $@
}

dbgen()
{
	local table="$1"

	local dir="$this_dir"/"$db_prefix""$tpch_scale"
	if [ -d "$dir" ] && [ -z "$table" ]; then
		echo "$dir: exists, exit" >&2
		return 1
	fi
	mkdir -p "$dir"

	cd "$dir"

	if [ -z "$table" ]; then
		dbgen_bin -s "$tpch_scale" 2>/dev/null
		return
	fi

	local flag=`cat $meta_dir/tables | grep "$table$" | awk -F '\t' '{print $1}'`
	if [ -z "$flag" ]; then
		echo "unknown table name: $table" >&2
		return 1
	fi
	if [ -f "$dir/$table.tbl" ]; then
		echo "$dir/$table.tbl: exists, exit" >&2
		return 1
	fi
	dbgen_bin -s "$tpch_scale" $flag 2>/dev/null
}
