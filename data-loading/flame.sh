pname="$1"
sec="$2"

set -eu

source _env.sh

if [ -z "$pname" ]; then
	pname="$tidb_name"
fi
if [ -z "$sec" ]; then
	sec="60"
fi

spid=`ps -ef | grep $pname | grep -v grep | awk '{print $2}'`
if [ -z $pname ]; then
	echo "failed to get pid" >&2
	exit 1
fi

dir="$this_dir/flame"
mkdir -p "$dir"
cd "$dir" && bash $this_dir/_flame.sh "$spid" "$sec"
