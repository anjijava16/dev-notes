# Linux Server records statistics of System With uptime Utility

**uptime :** Tell how long the server has been running.
**uptimed :** 



## uptimed

```
sudo apt-get install uptimed
sudo dnf install uptimed
```

**_Configuration_**

```
$ sudo vim /etc/uptimed.conf
// set an email address to mail milestones/records to. Assumes sendmail compatible MTA installed as /usr/lib/sendmail.
EMAIL=taqi.official@gmail.com
```