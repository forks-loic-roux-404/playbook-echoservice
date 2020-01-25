# variables #
script_file="{{cron_workspace}}/{{ projectname }}_.sql"
remote_db_file="{{cron_workspace}}/{{ projectname }}_remote_.sql"

rm -rf $script_file || true
rm -rf $remote_db_file || true

# get remote db data as sql script #
mysqldump -t --single-transaction --insert-ignore -u {{ backup_user }} -p{{ backup_pw }} -h {{ backup_host }} {{ backup_db }} > $remote_db_file

# insert remote data in actual db #
mysql -u {{ mysql_user }} -p{{ mysql_pw }} -h {{ mysql_host }} {{ mysql_db }} < $remote_db_file &
##################### Reinsert data in remote db #######################
# dump date sorted sql scripts / this script will add all missing rows #
mysqldump -t --insert-ignore --skip-opt -u {{ mysql_user }}  -p{{ mysql_pw }} -h {{ mysql_host }} {{ mysql_db }} > $script_file

# Connect to remote database and execute dump script # NOT USED (danger)
# mysql -u {{ backup_user }} -p{{ backup_pw }} -h {{ backup_host }} {{ backup_db }} < $script_file &
