source _env.sh

blocks="$1"
table="$2"
cpu_sample="$3"
cpu_log="$4"

echo "$blocks $table"

for ((i=0; i<2; i++)); do
	$this_dir/cpu.sh $cpu_sample "$blocks $table" 2>&1 >> $cpu_log &
	{ time $this_dir/bench.sh "$blocks" "$table"; }  2>&1 | grep real
done
