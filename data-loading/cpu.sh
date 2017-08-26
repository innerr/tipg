sec="60"
if [ ! -z "$1" ]; then
	sec="$1"
fi

if [ ! -z "$2" ]; then
	echo "$2"
fi

set -eu

source _env.sh

pname="$tidb_name"

spid=`ps -ef | grep $pname | grep -v grep | awk '{print $2}'`

if [ -z "$spid" ]; then
	echo "$pname process not found" >&2
	exit 1
fi

data=""
if [ "$is_mac" == "yes" ]; then
	data=`top -pid $spid -l $sec | grep $pname | awk '{print $3}'`
else
	data=`top -b -n $sec -p $spid -d 1 | grep $pname | awk '{print $9}'`
fi
echo "$data" | grep -v '0.0' | awk '{sum+=$1}END{print sum/NR}'
