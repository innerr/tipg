_get_this_dir() {
	local dir=$(echo "${0%/*}")
	(cd "$dir" && pwd -P)
}
this_dir=`_get_this_dir`
repo_dir=`dirname $this_dir`

dbgen_dir="$repo_dir/tpch-dbgen"
mysql_bin="mysql -h 127.0.0.1 -P 4000 -u root"
meta_dir="$this_dir/meta"

db_prefix="tpch"
tpch_scale="1"
