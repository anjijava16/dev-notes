### To Check Postgres is running
```
/etc/init.d/postgresql status
```
### To Start, Stop and Restart Postgresql
You need root privileges to play with postgres service
```
sudo -s
service postgresql stop
service postgresql start
service postgresql restart
```

### Create Postgres Database

```
sudo -u postgres createdb db_name -O USER_NAME
postgres=# CREATE DATABASE db_name;
calculate postgreSQL database size in disk
SELECT pg_database_size('db_name');
SELECT pg_size_pretty(pg_database_size('db_name'));
# Table Size
SELECT pg_size_pretty(pg_total_relation_size('auth_user'));
```

### change the owner of PostgreSql database
```
ALTER DATABASE name OWNER TO new_owner;
```

### Login to postgresql

```
sudo -u postgres psql	  # Default Admin Login
psql -h host -p port -U User_Name db_name # Login into specific db with privilages
SELECT version();	# Show Database Version

psql -h host -p port -U user_name passwrod
alias connecttomtaqidb='psql -h host -p port -U user_name  passwrod'
gedit ~/.bashrc
place the alias command at the bottom
Now in Terminal
$ connecttomtaqidb
```

### List all users
```
q\du
```

### List databases
```
\l		          # from within a pg shell
psql -U postgres -l	  # from UNIX command prompt
DROP DATABASE malydb;       # Delete/Drop an existing db
```

### Drop Database Column
```
ALTER TABLE table DROP COLUMN col1, DROP COLUMN col2;
```

### Switch postgres database within admin login shell
```
\dn			# List all Schemas
\connect db_name        # Connect to Database
\dt or \dt+; or \d	        # List all tables
\d tablename		# Describe a table
```

### Commands and Operation
```
\?          # Help on Postgresql
\h create   # shows help about all the commands that starts with CREATE
\timing     # turn on timing to check query execution time
\df          # list available function in postgres
\e           # edit query in editor
```

### Postgres Transaction
```
 BEGIN -- start the transaction.

All the operations performed after the BEGIN command will be committed to the postgreSQL database only you execute the commit command. Use rollback command to undo all the transactions before it is committed.

 ROLLBACK -- rollbacks the transaction.
 COMMIT -- commits the transaction.
```


### Date and Time Function
 ```
select now();            # 2015-04-12 23:55:40.064941+05
select now()::time;        # 23:55:54.759459
select now()::date;        # 2015-04-12
select current_date -1;   # 2015-04-11
select now()-'2002-11-1' as days; # time interval 4545 days 23:59:48.657567
select date_part('days', now() - '2002-11-1') as days; # round the time interval
SELECT AGE(timestamp '2001-04-10', timestamp '1957-06-13');   # 43 years 9 mons 27 days

select age(timestamp '1991-08-08'); # interval in years months and days 23 years 8 mons 5 days
# extract specific attributes from date time
SELECT date_part('day', TIMESTAMP '2001-02-16 20:38:40'); # 16
SELECT date_part('hour', INTERVAL '4 hours 3 minutes'); # 4 
SELECT date_trunc('hour', TIMESTAMP '2001-02-16 20:38:40');               # 2001-02-16 20:00:00
SELECT date_trunc('year', TIMESTAMP '2001-02-16 20:38:40');               # 2001-01-01 00:00:00
SELECT EXTRACT(CENTURY FROM TIMESTAMP '2000-12-16 12:21:13');               # 20
SELECT EXTRACT(DAY FROM TIMESTAMP '2001-02-16 20:38:40');
# 16
SELECT justify_days(interval '35 days');  # 1 mon 5 days
SELECT justify_hours(interval '27 hours');
1 day 03:00:00
SELECT justify_interval(interval '1 mon -1 hour'); 
# 29 days 23:00:00

select to_char(date_of_join,'mm/dd/yy') as output from employee;            # 11/23/02

select to_char(date_of_join, 'FMMonth FMDDth') as output from employee;       # November 23rd

select to_char(startdate, 'Dy (Day), Mon (Month)') as output from employee;  # at (Saturday ), Nov (November )

```

### Use Heroku Postgres Database

```
cd into the heroku repository
$ heroku pg:info
$ heroku pg:psql
```
 
### Backup Heroku Postgres Database to Local Database
```
$ heroku pg:backups capture
$ curl -o latest.dump `heroku pg:backups public-url`
$ pg_restore --verbose --clean --no-acl --no-owner -h 127.0.0.1 -U mtaqi -d mtaqidb latest.dump
```



### Backup and Restore

pg_dump -U pnc_mtaqi -h 127.0.0.1 pnc_nmis -f  nmis.dump


