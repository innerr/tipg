sec="60"
if [ ! -z "$1" ]; then
	sec="$1"
fi

if [ ! -z "$2" ]; then
	echo "$2"
fi

sleep 2
spid=`ps -ef | grep tidb-server | grep -v grep | awk '{print $2}'`
top -pid $spid -l $sec | grep tidb-server | awk '{print $3}' | grep -v '0.0' | awk '{sum+=$1}END{print sum/NR}'

