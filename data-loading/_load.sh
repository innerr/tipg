source _create.sh

load_table_from_file()
{
	local table="$1"
	local file="$2"

	if [ -z "$file" ]; then
		file="$dbgen_result_dir_prefix"1"/$table.tbl"
	fi
	if [ ! -f "$file" ]; then
		echo "$file: not found" >&2
		return 1
	fi

	create_table "$table"

	local sql="LOAD DATA LOCAL INFILE '$file' INTO TABLE $table FIELDS TERMINATED BY '|'"
	$mysql_cmd --local-infile=1 -e "$sql"
}
export -f load_table_from_file

load_table_from_files()
{
	local table="$1"
	local blocks="$2"

	for ((i = 0; i < $blocks; i++)); do
		let "n = $i + 1"
		local file="$dbgen_result_dir_prefix"$blocks"/$table.tbl.$n"
		if [ ! -f "$file" ]; then
			echo "$file: not found" >&2
			return 1
		fi
		load_table_from_file "$table" "$file" &
	done

	wait_sub_procs
}
export -f load_table_from_files
