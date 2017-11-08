
# Useful Linux Commands for Sysadmins

These are some of the Linux command line commands I use, often on a daily basis, in my adventures as a sysadmin.  


#### Find the largest files in a directory

```
du -a /var/www | sort -n -r | head -n 20      # find 20 largest files in /var/www
du -sh /var/www                               # find size of directory /var/www
```

#### Find and replace a string of text in a file

```
sed -i 's/foo/bar/g' /home/user/*.txt         # replace `foo` with `bar` in all text files in a directory
``` 

#### Use brace expansion to tail multiple files

```
tail -f /var/log/apache2/{access,error}.      # tail Apache access and error log
``` 

```
cd ~                                          # Quickly change to your home directory

cd -                                          # Change back to the last directory you were in

!!                                            # Re-run the previous command

sudo !!                                       # Re-run the previous command as sudo
	
dig +short A <hostname>                       # Get the IP of a hostname
```

#### Tunnel Traffic Over SSH
```
ssh -ND 9999 user@server.com
``` 

Once you enter your password, nothing will happen. This is because the `-N` switch  
tells SSH to not open an interactive session

TIPS:  
Use the `-C` switch to enable compression


#### Quickly share files via python's simplehttpserver

```
cd /tmp/foo/ && python -m SimpleHTTPServer 8080           # Start a server on port 8080 to share files in the /tmp/foo/ directory
```


#### NMAP

Nmap is used for exploring networks, perform security scans, network audit and finding open ports on remote machine. It scans for Live hosts, Operating systems, packet filters and open ports running on remote hosts.

**_Scanning Ports_**
```
server_name can be remote server ip, host or localhost/127.0.0.1

nmap -p 80 server_name                                      # scan for specific Port on any server by ip
nmap -p 80,443 server_name                                  # Scan Multiple Ports
nmap -p 80-160 server_name                                  # Scan Ports by Network Range

nmap -p T:8888,80 server_name                               # scan a TCP Port
nmap -sU 53 server_name                                     # Scan a UDP Port
```

**_Scanning Remote Hosts_**

```
nmap -v server_name server_name                             # scanning multiple hosts , -v more details
nmap -v 192.168.0.*                                         # scan whole subnet
nmap 192.168.0.101,102,103                                  # scan multiple Servers using last octet of IP address
nmap -iL nmaptest.txt                                       # scan all listed IP address in the file
nmap 192.168.0.101-110                                      # Scan an IP Address Range
nmap 192.168.0.* --exclude 192.168.0.100                    # Scan Network Excluding specific Hosts

nmap -A -O 192.168.0.101                                    # Scan OS information and Traceroute, -O Enable OS Detection
nmap -sA 192.168.0.101                                      # Scan a Host to Detect Firewall
nmap -PN 192.168.0.101                                      # Scan a Host to check its protected by Firewall

nmap -sP 192.168.0.*                                        # Find out Live hosts in a Network
nmap --iflist                                               # Print Host interfaces and Routes

Enable OS Detection with Nmap
nmap -sV server_name                                        # find out service’s versions which are running on remote hosts 
nmap -PS server_name                                        # when firewalls blocks standard ICMP ping requests, 
                                                            # then use TCP ACK & TCP Syn methods to scan remote hosts.
nmap -PA -p 22,80 server_name                               # scan for specific ports with TCP ACK
nmap -PS -p 22,80 server_name                               # scan for specific ports with TCP Syn
nmap -sS server_name                                        # Perform a stealthy Scan
nmap -sT server_name                                        # Check most commonly used Ports with TCP Syn
nmap -sN server_name                                        # Perform a tcp null scan to fool a firewall
```


#### Rsync

```
rsync -zvh backup.tar /tmp/backups/                         # Copy/Sync a File on a Local Computer
rsync -avzh /home/documents /backups/                       # Copy/Sync all files from one directory to another

rsync -avz rpmpkgs/ root@192.168.0.101:/home/               # Copy a Directory from Local Server to a Remote Server
rsync -avzh root@192.168.0.100:/home/you/docs /tmp/docs     # Copy/Sync a Remote Directory to a Local Machine

rsync -avzhe ssh root@192.168.0.100:/root/install.log /tmp/ # Copy a File from a Remote Server to a Local Server with SSH
rsync -avzhe ssh backup.tar root@192.168.0.100:/backups/    # Copy a File from a Local Server to a Remote Server with SSH

rsync -avzhe ssh --progress .....                           # Show Progress While Transferring Data with rsync
rsync -avze ssh --include 'R*' --exclude '*' .....          # Use of –include and –exclude Options
```

