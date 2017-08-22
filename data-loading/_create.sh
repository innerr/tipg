source _msq.sh

ensure_database()
{
	$mysql_bin -e "CREATE DATABASE IF NOT EXISTS $database"
}
export -f ensure_database

create_table()
{
	local table="$1"
	ensure_database
	$mysql_cmd --local-infile < $meta_dir/schema/$table.sql
}
export -f create_table
