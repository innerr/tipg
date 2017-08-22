_get_is_mac() {
	local mac="no"
	if [ "`uname`" == "Darwin" ]; then
		mac="yes"
	fi
	echo "$mac"
}
export is_mac=`_get_is_mac`

_get_this_dir() {
	if [ "$0" == "bash" ] || [ "$0" == "sh" ]; then
		return
	fi
	if [ is_mac == "no" ]; then
		readlink -f "$0"
	else
		local dir=$(echo "${0%/*}")
		if [ -d "$dir" ]; then
			(cd "$dir" && pwd -P)
		fi
	fi
}
export this_dir=`_get_this_dir`

if [ -z "$this_dir" ]; then
	echo "helper: get base dir failed" >&2
	exit 1
fi

export repo_dir=`dirname $this_dir`

exit_test()
{
	return 1
}
export -f exit_test

wait_sub_procs()
{
	if [ "$is_mac" == "yes" ]; then
		wait
	else
		local failed=0
		jobs -p | while read job; do
			wait $job || let "$failed+=1"
		done
		if [ "$failed" != 0 ]; then
			echo "$failed jobs failed"
			return 1
		fi
	fi
}
export -f wait_sub_procs
