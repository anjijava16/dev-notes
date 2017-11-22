# AWS Lambda

- Lambda is a serverless compute platform. EC2 would be an example of a server-specific platform.
- The two primary ways you are charged for using Lambda are the number of time your code is executed (execution request), and how long it takes for your code to execute (execution duration).
- You are only charged (by the millisecond) for how long it takes you code to run each time it is executed.
- The code that you want Lambda to run is known as a **Lambda function**, a function runs only when it is called, right? Here, Event Source is the entity which triggers a Lambda Function, and then the task is executed. 
    - i.e Suppose you have an app for image uploading. Now when you upload an image, there are a lot of tasks involved before storing it, such as resizing, applying filters, compression etc. So, this task of uploading of an image can be defined as an Event Source or the ‘trigger’ that will call the Lambda Function, and then all these tasks can be executed via the Lambda function.

## Case Study

we will be uploading images in the form of objects to an S3 bucket. This uploading an image to the S3 bucket, will become an event source or the ‘trigger’.

[AWS Lambda use case with S3](assets/aws-lambda-case.png)

The whole process, as you can see in the diagram, is divided into 5 steps, let’s understand each one of them.

1. User uploads an image (object) to a source bucket in S3 which has notification attached to it, for Lambda.
2. The notification is read by S3 and it decides where to send that notification.
3. S3 sends the notification to Lambda, this notification acts as an invoke call of the lambda function.
4. Execution role in Lambda can be defined by using IAM (Identity and Access Management) to give access permission for the AWS resources, for this example here it would be S3.
5. Finally, it invokes the desired lambda function which works on the object which has been uploaded to the S3 bucket.


AWS Lambda is compatible with Node.JS, Python and Java, so you can upload your file in a zip, define an event source and you are set!


## Limitations of AWS Lambda

Some limitations are hardware specific and some are bound by the architecture, 

- **_Hardware limitations_** disk size limited to 512 MB, the memory between 128 MB and 1536 MB. max execution timeout 5 minutes, request body payload can be not more than 6 MB and your request body is 128 KB.
