**In file ~/.aws/credentials**

**Windows :- C:\\\Users\\\USERNAME\\\.aws\\\credentials** 

[default]

aws_access_key_id=DEFAULT_VALUE

aws_secret_access_key=DEFAULT_VALUE


**In file ~/.aws/config**


**Windows :- C:\\\Users\\\USERNAME\\\.aws\\\config**

[default]


region = us-west-2


output = json


#Setting up Mutiple Profiles

**In file ~/.aws/credentials**

**Windows :- C:\\\Users\\\USERNAME\\\.aws\\\credentials** 

[my_profile]

aws_access_key_id=MY_PROFILE_VALUE

aws_secret_access_key=MY_PROFILE_VALUE


**In file ~/.aws/config**

**Windows :- C:\\\Users\\\USERNAME\\\.aws\\\config**

[profile my_profile]

region=MY_PROFILE_VALUE

# On the command line

# Set AWS_PROFILE

export AWS_PROFILE=my_profile
