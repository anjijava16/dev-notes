# AWS CloudWatch

- An aws service that allows you to monitor various elements of your AWS account in real time.
- Helps us to collect and track metrics of our aws services, and based on these metrics we can set alarms, notification or take some action automatically based on rules we defined. i.e set alarm if my billing month exceeding 100$ then send email me, then I can go to aws and shutdown some resource to reduce cost.
i.e we can set threshold to trigger alarms
- for EC2 - CPU utilization ( > 80% ), Disk health check, Data in/out
- S3 - number of objects (no of obj > 100), bucket size
- billing - send billing notifications (alarm to trigger if monthly bill is more than 100$)

- Pricing and Cost
    - Per dashboard  + (regular or detail monitoring) + Api request + logs + events + region
    

## CloudWatch Metrics and Alarms

**_Create Dashboard_**

1. Dashboard -> Create Dashboard -> Add Widget -> select avaliable metrics

**_Create CloudWatch Alarm_**

Set alarm if CUP utilization of EC2 goes up 80%, send notification.

1. Alarm -> Create Alarm
2. Select Category
3. 

## Takeaways

- CloudWatch is a service that allows you to monitor various metrics inside your AWS account.
- CPU utilization is a great metric to measure how much of your EC2 instances' compute capacity is being used.
- CloudWatch alarms can trigger SNS topics.
- At any given time, a CloudWatch Alarm can be in one of three states. 
    - "Alarm" if the threshold you set has been triggered, 
    - "Ok" if the threshold you set has not been triggered, and 
    - "insufficient data" if an alarm hasn't yet (or can't) retrieve the required data to determine if the threshold has been triggered (or not).
- CloudWatch alarms are based on thresholds you create for specific CloudWatch metrics.