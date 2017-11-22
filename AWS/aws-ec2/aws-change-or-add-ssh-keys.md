
[Source](https://mikeeverhart.net/2015/04/aws-change-or-add-ssh-keys/ "Permalink to AWS - Change or Add SSH keys")

# AWS - Change or Add SSH keys

Learn how to easily generate and add a new public and private key pair to an AWS EC2 instance. This is useful if you ever need to replace a compromised key or provide ssh access to multiple users without sharing private keys.

#### 1\. Generate a New Private Key

1. Login to the AWS EC2 console and select `Key Pairs` in the left sidebar
2. On the next page, click the `Create Key Pair` button
3. Give the new key a name, then click the `create` button
4. Download the new key, and then `chmod` it to 0666

For this tutorial we'll call this new private key `NewKey.pem`

#### 2\. Generate a New Public Key

Next, use `NewKey.pem` that was created in step 1 to create a new public key. The new public key will be `NewKey.pub`.

When prompted, enter the path to the `NewKey.pem` that was created in step 1.

#### 3\. Add the new public key to your instance

cat NewKey.pub | ssh -i OriginalKey.pem user@amazon-instance "cat &gt;&gt; .ssh/authorized_keys"

| -----        |  
| ------------ | -----------------------------------------------------------------------  

cat NewKey.pub | ssh -i OriginalKey.pem user@amazon-instance "cat &gt;&gt; .ssh/authorized_keys"  

               |  

#### 4\. Test the New Key

Use the new key to ssh into the server. If needed, the original key can be removed during this step

ssh -i NewKey.pem user@amazon-instance 

| ----- |
|  | 

ssh -i NewKey.pem user@amazon-instance

 | 

To remove the original key use:

nano ~/.ssh/authorized_keys 

| ----- |
|  | 

nano ~/.ssh/authorized_keys

 | 

Find the line containing the original/old key and remove it.

  