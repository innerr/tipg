sec="60"
if [ ! -z "$1" ]; then
	sec="$1"
fi

if [ ! -z "$2" ]; then
	echo "$2"
fi

set -eu

source _env.sh

sleep 1

pname="tidb-server"

spid=`ps -ef | grep $pname | grep -v grep | awk '{print $2}'`

if [ ! -z "$spid" ]; then
	if [ "$is_mac" == "yes" ]; then
		top -pid $spid -l $sec | grep $pname | awk '{print $3}' | grep -v '0.0' | awk '{sum+=$1}END{print sum/NR}'
	else
		top -b -n $sec -p $spid -d 1 | grep $pname | awk '{print $9}' | grep -v '0.0' | awk '{sum+=$1}END{print sum/NR}'
	fi
fi
