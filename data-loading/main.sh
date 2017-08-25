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

burn_all()
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

gen_all()
{
	$this_dir/gen.sh  1 lineitem
	$this_dir/gen.sh  2 lineitem
	$this_dir/gen.sh  3 lineitem
	$this_dir/gen.sh  4 lineitem
	$this_dir/gen.sh  6 lineitem
	$this_dir/gen.sh 10 lineitem

	$this_dir/broaden.sh lineitem  1 2
	$this_dir/broaden.sh lineitem  4 2
	$this_dir/broaden.sh lineitem 10 2

	$this_dir/broaden.sh lineitem  1 169 w
	$this_dir/broaden.sh lineitem  4 169 w
	$this_dir/broaden.sh lineitem 10 169 w

	$this_dir/broaden.sh lineitem  1 4
	$this_dir/broaden.sh lineitem  4 4
	$this_dir/broaden.sh lineitem 10 4
}

main()
{
	#gen_all
	burn_all
}

main
