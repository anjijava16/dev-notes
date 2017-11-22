**To create a key pair**

Command::

  aws ec2 create-key-pair --key-name MyKeyPair

**To describe an Amazon EC2 instance**

Command::

  aws ec2 describe-instances --instance-ids i-1234567890abcdef0

  aws ec2 describe-instances --filters "Name=instance-type,Values=m3.medium"
  
**To Create Amazon EC2 instance**

Command::
  
  aws ec2 run-instances --image-id ami-49118629 --count 1 --instance-type m3.medium --key-name MyKeyPair
  

**To stop Amazon EC2 instance**
  
Command::  
  
  aws ec2 stop-instances --instance-ids  i-068c626a7ab362033
  
  

**To terminate Amazon EC2 instance**
   
Command::   

  aws ec2 terminate-instances --instance-ids  i-068c626a7ab362033




