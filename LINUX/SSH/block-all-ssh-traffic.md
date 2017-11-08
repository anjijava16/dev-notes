# Use IPTables to block all SSH traffic (port 22) except for your IP

Blocking traffic to port 22 (SSH) is one of the first steps you should take when hardening a server. Locking down port 22 not only keeps unwanted people from gaining access to your server, it also helps prevent a certain type of DDoS attacks called [SYN floods][1]. Using IPTables and a whitelist approach is the quickest and easiest ways to accomplish this.  

1. Add the following rule for each IP address that you want to whitelist:

	`sudo iptables -A INPUT -p tcp -s YOUR.IP.HERE --dport 22 -j ACCEPT`

2. Next, add a rule to block all other IPs:

	`sudo iptables -A INPUT -p tcp --dport 22 -j DROP`

3. Save your new rules so they persist after reboot:

	`sudo iptables-save`

If you need to remove an IP (thus blocking that IP from being able to access port 22) just change the `-A` option to -D:

	`sudo iptables -D INPUT -p tcp --dport 22 -j DROP`


[1]: https://en.wikipedia.org/wiki/SYN_flood "SYN Flood"

  