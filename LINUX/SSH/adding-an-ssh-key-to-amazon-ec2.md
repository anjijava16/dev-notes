# Adding an SSH Key to Amazon EC2

[Using git to deploy code][1] across multiple servers is a handy technique that works in pretty much any situation. That is, until you're trying to deploy to an environment such as [Amazon's EC2 servers][2], which uses .pem files to login. In these situations, the simplest solution I've found is a rather ancient technique: SSH keys.

### Step 1: Generate an SSH Key

Note: If you already have an ssh key then you can skip this step
```
$ ssh-keygen -t rsa
```

After you hit enter, you’ll get some messages similar to these:

```
Enter file in which to save the key (/you/.ssh/id_rsa):<br />
Enter passphrase (empty for no passphrase):<br />
Enter same passphrase again:<br />
Your identification has been saved in /you/.ssh/id_rsa.<br />
Your public key has been saved in /you/.ssh/id_rsa.pub.
```

### Step 2: Add Your Key to Your Amazon EC2 Instance

Use the following command to copy your key to your Amazon EC2 instance. `/you/.ssh/id_rsa.pub` is the location to your ssh key, `pem_file.pem` is the .pem file you normally use to login, and `user@ec2-instance.com` is the user and hostname to your EC2 instance:

```
$ cat /you/.ssh/id_rsa.pub | ssh -i pem_file.pem user@ec2-instance.com "cat >> .ssh/authorized_keys"
```  

[1]: http://mikeeverhart.net/2013/01/using-git-to-deploy-code/ "Using Git to Deploy Code"
[2]: http://aws.amazon.com/ec2/

  