set -eu

source _env.sh

bench()
{
	local blocks="$1"
	local table="$2"

	echo "$blocks $table" >> ./result-elapse.log

	./cpu.sh 100 "$blocks $table" 2>&1 >> ./result-cpu.log &
	time ./bench.sh "$blocks" "$table"  2>&1 >> ./result-elapse.log
	./cpu.sh 100 "$blocks $table" 2>&1 >> ./result-cpu.log &
	time ./bench.sh "$blocks" "$table"  2>&1 >> ./result-elapse.log
}

bench  1 lineitemw
bench  4 lineitemw
bench 10 lineitemw

bench  1 lineitem4
bench  4 lineitem4
bench 10 lineitem4

bench  1 lineitem
bench  2 lineitem
bench  3 lineitem
bench  4 lineitem
bench  6 lineitem
bench 10 lineitem

bench  1 lineitem2
bench  4 lineitem2
bench 10 lineitem2

