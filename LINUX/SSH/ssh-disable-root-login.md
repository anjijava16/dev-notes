# Disable Root Logins, Restrict Access to Specific Users and Groups

### Why should you disable root logins?

If someone is able to log in with a root account then they have complete, unprotected access to the entire system. By disabling root logins you require a hacker to do more work, since they would then have to gain access to another account that can login, and then escalate their privileges using the root account once they are logged in.

Another reason to disable root logins is because pretty much all Unix-based system have a `root` user. If a hacker is trying to bruteforce their way into a machine, having an account name that they know is valid increases the attack vector, making it easier and faster to compromise a system.

### Back Up

Begin by making a backup copy of the `sshd_config` file:

```
sudo cp /etc/ssh/sshd_config{,.bak}
```

### Disable root SSH logins

Next, open the `sshd_config` file:

```
sudo vi /etc/ssh/sshd_config
```

Find the option for `PermitRootLogin`, and change its value to `no`:

```
PermitRootLogin no
```

### Only allow certain users or groups to login

Another way to restrict access is to explicitly declare which users or groups are allowed to SSH in. This is accomplished with the `AllowUsers` and `AllowGroups` directives.

For this example, say that we want to _only_ allow the users Admin, Bob, and Alice to login.

Open the `sshd_config` file if it's not still open:

```
sudo vi /etc/ssh/sshd_config
```

#### AllowUsers directive

One method is to use the `AllowUsers` directive. On a new line in the `sshd_config` add `AllowUsers`, followed by the list of users that you want to have SSH access:

```
AllowUsers admin bob alice
```

#### AllowGroups directive

To make things easier to manage, some prefer to use the `AllowGroups` directive. With this method, you simply add or remove users from a predefined group to control their access to SSH.

Begin by making a new group:

```
sudo groupadd -r sshusers
```

Next, add the desired users to the new group:

```
sudo usermod -a -G sshusers admin

sudo usermod -a -G sshusers alice

sudo usermod -a -G sshusers bob
```

Finally, edit `sshd_config`. On a new line, add the `AllowGroups` directive and the list of group names to allow.

If you need to remove a user from the `sshusers` group (thus, preventing them from logging in through SSH), then use the `deluser` command:

```
sudo deluser alice sshusers
```

### Restart SSH

After all of the above changes are made SSH must be restarted:

```
sudo service sshd restart
```

### Downsides and warnings

Before disabling root access, make sure there is another system user that can login via SSH. If not, you might lock yourself out of your server.

The main downside to this method is that it requires an extra step for you to obtain root access to your server: You first have to login with a non-root user, and then use `sudo`, `su root`, or some other method to obtain root privileges. This is definitely a fair trade-off for the amount of extra security it provides.

### Wrapping Up

By disabling root SSH logins, and limiting SSH access to specific accounts you drastically reduce the possible attack vectors, making bruteforce attempts nearly impossible. These techniques, combined with [disabling SSH password logins][1], are the basis for securing SSH access to your servers.

[1]: http://mikeeverhart.net/2015/11/securing-ssh-disable-password-logins-require-ssh-key-login/