# Restart a linux process/service if not running using crontab on a Linux/Unix

There are many ways to make sure that the essential server process such as HTTPD/Nginx/PHP-FPM/MySQL remains up and running all the time.  

## Step 1 – Create a Bash Shell Script

Here [is a simple shell script to check for httpd pid using][1] the pgrep command. It will restart if httpd is not running on a CentOS/RHEL using the systemctl command. Create a file named `/root/bin/restart-httpd`

`# vi /root/bin/restart-httpd`  

Append the following code:

``` 
#!/bin/bash
# Apache Process Monitor
# Restart Apache Web Server When It Goes Down
#  RHEL / CentOS 7.x httpd restart command
RESTART="/bin/systemctl restart httpd"
 
#Path to pgrep command
PGREP="/usr/bin/pgrep"
 
# Httpd daemon name: Under RHEL/CentOS/Fedora it is httpd
HTTPD="httpd"
 
# Find httpd pid
$PGREP ${HTTPD}
 
if [ $? -ne 0 ] # if apache not running 
then
 # restart apache
 $RESTART
fi
```

Save and close the file. Set permissions:

``` 
# chmod +x /root/bin/restart-httpd
# /root/bin/restart-httpd
```


## Step 2 – Setup the cron job to restart process

`# crontab -e`  

Append the following code to restart httpd  
```
## restart httpd if not running. check for httpd every 5 mins  
*/5 * * * * /root/bin/restart-httpd &gt;/dev/null 2&gt;&amp;1
```

## A note about Linux and systemd based system

Systemd can handle keeping the service alive for you. You need to use the [cp command][2]:  

`# cp /lib/systemd/system/httpd.service /etc/systemd/system/httpd.service`  

Edit the file using vi command:  

`# vi /etc/systemd/system/httpd.service`  

Add `Restart=always` and `RestartSec=5` in the [Service] section as follows:

```
[Unit]
Description=The Apache HTTP Server
After=network.target remote-fs.target nss-lookup.target
Documentation=man:httpd(8)
Documentation=man:apachectl(8)
 
[Service]
##############################################
## Make sure httpd always restart if failed ##
## Configures the time to sleep before      ##    
## restarting a service with 5 seconds too  ##
##############################################
Restart=always
RestartSec=5
##############################################
Type=notify
EnvironmentFile=/etc/sysconfig/httpd
ExecStart=/usr/sbin/httpd $OPTIONS -DFOREGROUND
ExecReload=/usr/sbin/httpd $OPTIONS -k graceful
ExecStop=/bin/kill -WINCH ${MAINPID}
# We want systemd to give httpd some time to finish gracefully, but still want
# it to kill httpd after TimeoutStopSec if something went wrong during the
# graceful stop. Normally, Systemd sends SIGTERM signal right after the
# ExecStop, which would kill httpd. We are sending useless SIGCONT here to give
# httpd time to finish.
KillSignal=SIGCONT
PrivateTmp=true
 
[Install]
WantedBy=multi-user.target
```

Reload configuration:  

```
# systemctl daemon-reload  
# systemctl restart httpd
```

Test it by killing httpd using the [kill command][3]:  
`# kill -9 $(pgrep httpd)`  
After 5 seconds httpd will restart again. Verify with the ps command:  
`# ps aux | grep httpd`  
Sample outputs:

```
root      8052  0.0  0.0 221960  7580 ?        Ss   13:46   0:00 /usr/sbin/httpd -DFOREGROUND
apache    8053  0.0  0.0 221960  6096 ?        S    13:46   0:00 /usr/sbin/httpd -DFOREGROUND
apache    8054  0.0  0.0 221960  6096 ?        S    13:46   0:00 /usr/sbin/httpd -DFOREGROUND
apache    8055  0.0  0.0 221960  6096 ?        S    13:46   0:00 /usr/sbin/httpd -DFOREGROUND
apache    8056  0.0  0.0 221960  6096 ?        S    13:46   0:00 /usr/sbin/httpd -DFOREGROUND
apache    8057  0.0  0.0 221960  6096 ?        S    13:46   0:00 /usr/sbin/httpd -DFOREGROUND
root      8061  0.0  0.0 112644  1720 ?        S+   13:46   0:00 grep --color=auto httpd
```

A better and more reliable solution is [monit monitoring software for restarting services such as mysql, apache and sendmail under a UNIX / Linux][4] operating systems:
    
> Monit is a free and open source software that acts as process supervision. It comes with the ability to restart services which have failed. You can use Systemd, daemontools or any other such tool for the same purpose. 


[1]: https://bash.cyberciti.biz/web-server/restart-apache2-httpd-shell-script/
[2]: https://www.cyberciti.biz/faq/cp-copy-command-in-unix-examples/ "See Linux/Unix cp command examples for more info"
[3]: https://www.cyberciti.biz/faq/unix-kill-command-examples/ "See Linux/Unix kill command examples for more info"
[4]: https://www.cyberciti.biz/faq/how-to-install-and-use-monit-on-ubuntudebian-linux-server/