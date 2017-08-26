spid="$1"
sec="$2"

sudo perf record -p "$spid" -F 99 -a -g -- sleep "$sec"
sudo chmod a+rw perf.data
perf script > out.perf

$flamegraph_dir/stackcollapse-perf.pl out.perf > perf.folded
$flamegraph_dir/flamegraph.pl perf.folded > perf.svg
