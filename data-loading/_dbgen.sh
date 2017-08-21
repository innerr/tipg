set -e
set -u

source _env.sh

dbgen_bin()
{
	local dbgen_dir=`readlink -f $dbgen_dir`
	time $dbgen_dir/dbgen -b $dbgen_dir/dists.dss $@
}

dbgen()
{
	local scale="$1"
	if [ -z "$scale" ]; then
		scale="1"
	fi

	local dir="tpch""$scale"
	if [ -d "$dir" ]; then
		return
	fi
	mkdir -p "$dir"

	cd "$dir"
	dbgen_bin -s "$scale" # -T r &>/dev/null &
}
