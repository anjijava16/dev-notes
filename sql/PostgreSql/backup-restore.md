### PostgreSQL Database Backup and Restore

PostgreSQL database server provides pg_dump utility for backup databases. 

| Task 			| Command
| :---      | :---
| `-d` 			| --dbname=DBNAME database name
| `-h` 		  | --host=HOSTNAME database server hostname or ip
| `-p` 		  | --port=PORT database server port number (default: 5432)
| `-U` 	    | --username=NAME connect as specified database user
| `-W` 	    | --password force password prompt


#### Backup and Restore Single Database

```
Backup
$ pg_dump -U postgres -d mydb > mydb.pgsql

Restore
$ psql -U postgres -d mydb < mydb.pgsql
```
#### Backup and Restore All Databases
```
Backup
$ pg_dumpall -U postgres > alldbs.pgsql
Restore: 
$ psql -U postgres < alldbs.pgsql
```

#### Backup and Restore Single Table
```
Backup
$ pg_dump -U postgres -d mydb -t mytable > mydb-mytable.pgsql
Restore
$ psql -U postgres -d mydb < mydb-mytable.pgsql
```

#### Compressed Backup and Restore Database
```
Backup
$ pg_dump -U postgres -d stackDB | gzip > stackDB.pgsql.gz
Restore
$ gunzip -c stackDB.pgsql.gz | psql -U postgres -d stackDB
```

#### Split Backup in Multiple Files and Restore
```
Backup: PostgreSQL database and split backup in multiple files of specified size. It helps us to backup a large database and transfer to other host easily. As per below example it will split backup files of 100mb in size.

$ pg_dump -U postgres -d stackDB | split -b 100m – stackDB.pgsql
Restore: database backup from multiple splited backup files.

$ cat stackDB.pgsql* | psql -U postgres -d stackDB
Backup: database in compressed splited files of specified size.

$ pg_dump -U postgres -d stackDB | gzip | split -b 100m – stackDB.pgsql.gz
Restore: database from multiple files of compressed files.

$ cat stackDB.pgsql.gz* | gunzip | psql -U postgres -d stackDB
```
