source _msq.sh

load_table_from_file()
{
	local table="$1"
	local file="$2"
	local sql="LOAD DATA LOCAL INFILE '$file' INTO TABLE $table FIELDS TERMINATED BY '|'"
	$mysql_cmd --local-infile=1 -e "$sql"
}
export -f load_table_from_file
