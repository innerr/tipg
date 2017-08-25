set -u

source _env.sh

result="$this_dir/result"
mkdir -p "$result"

ts=`date +%D-+%T`
echo "$ts" >> "$result/cpu.log"
echo "$ts" >> "$result/elapse.log"

burn()
{
	local blocks="$1"
	local table="$2"
	bash $this_dir/_bench.sh "$blocks" "$table" 100 "$result/cpu.log" 2>&1 >> "$result/elapse.log"
}

main()
{
	burn  1 lineitemw
	burn  4 lineitemw
	burn 10 lineitemw

	burn  1 lineitem4
	burn  4 lineitem4
	burn 10 lineitem4

	burn  1 lineitem
	burn  2 lineitem
	burn  3 lineitem
	burn  4 lineitem
	burn  6 lineitem
	burn 10 lineitem

	burn  1 lineitem2
	burn  4 lineitem2
	burn 10 lineitem2
}

main
