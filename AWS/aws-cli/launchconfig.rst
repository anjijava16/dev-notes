**To create a launch configuration**

This example creates a launch configuration::

    aws autoscaling create-launch-configuration --launch-configuration-name my-launch-config --image-id ami-c6169af6 --instance-type m1.medium


This example creates a launch configuration based on an existing instance. In addition, it also specifies launch configuration attributes such as a security group, tenancy, Amazon EBS optimization, and a bootstrapping script::

    aws autoscaling create-launch-configuration --launch-configuration-name my-launch-config --key-name my-key-pair --instance-id i-7e13c876 --security-groups sg-eb2af88e --instance-type m1.small --user-data file://myuserdata.txt --instance-monitoring Enabled=true --no-ebs-optimized --no-associate-public-ip-address --placement-tenancy dedicated --iam-instance-profile my-autoscaling-role
    
 
 
This example creates a launch configuration with a key pair and a bootstrapping script::

    aws autoscaling create-launch-configuration --launch-configuration-name my-launch-config --key-name my-key-pair --image-id ami-c6169af6 --instance-type m1.small --user-data file://myuserdata.txt


