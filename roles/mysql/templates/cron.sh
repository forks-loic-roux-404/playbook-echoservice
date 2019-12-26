#############
# variables #
date= $(date '+%F')
script_file="{{cron_workspace}}/{{ projectname }}_$date.sql"
########################################################################
# dump date sorted sql scripts / this script will add all missing rows #
mysqldump -t --insert-ignore --skip-opt -u {{ mysql_user }}  -p{{ mysql_pw }}  -h {{ mysql_bind_address }} {{ mysql_db }} > $script_file
######################################################
# Connect to remote database and execute dump script #
mysql -u {{ backup_user }} -p{{ backup_password }} -h {{ backup_host }} < $script_file &
######################################################