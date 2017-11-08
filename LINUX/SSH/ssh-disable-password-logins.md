# Securing SSH: Disable Password Logins
  

### Why disable password logins?

- Using passwords increases risk of bruteforce attacks since the average user doesn't use strong enough passwords to sufficiently stop all attacks.

- To disable password logins for SSH is _convenience_, When managing dozens, hundreds, or even thousands of servers.


### 0. Generate an SSH keypair

start creating your SSH key:

```
ssh-keygen -t rsa -b 4096
```

Save your SSH key to the default location is `/home/you/.ssh/id_rsa`.

Your identification will be saved in `home/you/.ssh/id_rsa` and public key in `/home/you/.ssh/id_rsa.pub.` These two files together are what's known as a keypair. The one with **.pub** extension is the _public_ part of the keypair.

And the key fingerprint is:

```
01:a9:b2:44:a4:5b:16:0b:10:9b:63:a7:39:67:bd:ef ubuntu@dev
```

### 1. Add your SSH key to other servers

Now you have to add the **public** key to all of the servers you'll be logging into. On most Linux distros you can use the `ssh-copy-id` command to do this. Note that a [different method may be required for AWS EC2][1] instances, where a .pem key is required.

```
ssh-copy-id -i /home/you/.ssh/id_rsa.pub user@host
```  

Now try logging into the machine, with "ssh 'remote-host'", and check in:

```
.ssh/authorized_keys
```

to make sure we haven't added extra keys that you weren't expecting.
 To test, try logging into the remote server. If you are able to login without entering a password then it worked:

### 3. Disable password logins

Begin by making a backup copy of the `sshd_config` file:

```
sudo cp /etc/ssh/sshd_config{,.bak}
```

Open `/etc/ssh/sshd_config` for editing:

```
sudo vi /etc/ssh/sshd_config
``` 

There are three directives that must be edited to disable passwords: `ChallengeResponseAuthentication`, `PasswordAuthentication`, and `UsePAM`. All three of these should be set to `no`.

```
ChallengeResponseAuthentication no 
PasswordAuthentication no 
UsePAM no
``` 

After saving your changes SSH must be restarted:


[1]: http://mikeeverhart.net/2013/05/adding-an-ssh-key-to-amazon-ec2/

  