rm -rf {{ web_dir }}/migrations/*
mysql -u {{ mysql_user }} -p{{ mysql_pw }} -NBe 'TRUNCATE TABLE {{ mysql_db }}.`migration_versions`'
mysql -u {{ backup_user }} -p{{ backup_pw }} -NBe 'TRUNCATE TABLE {{ backup_db }}.`migration_versions`'