# AWS Route 53

- Configure and manage web domains for websites or applications you host on AWS.
- performs 3 main functions
    - Domain registration - register domain names
    - Domain name service (DNS) service - translates domains names to IP. Amazon route 53 responds to DNS queries using global network or authoritative DNS servers, which reduces latency.
    - Health Checking - sends automated request over the internet to your application to verify that it's reachable, avaliable adn functional.
- you can use any combination of above 3 functions, S3 register domain + DNS or health check.


- Route 53 is the AWS service for managing domain names and DNS record sets.
- DNS servers are used to translate common language web domains into IP addresses.
- For a web browsers to request data from a web server, it must know the IP address of the web server. If given a domain name (instead of an IP address), the browser "asks" a DNS server to translate the web domain into it's IP address.
- Route 53 automatically sends your DNS record information to DNS servers AND it is also where you decide where traffic request for that domain/IP address are routed. 



## Configuring Route 53

**_Domain Registration_**

1. search for domain, fill out necessary info and payment details and purchase.
    Note: route 53 creates a hosted zone automatically for new domain, hosted zones is a container where you store info and manage routing of your domain.
    
**_Hosted Zones & Record Sets_**

1. navigate to hosted zones and select domain 
2. create two type A records sets for you dmaon that route to the ELB.
    - one record set for your domain with 'www' and the other without 'www'.
    - for 'Alias' select YES.
    - For 'Alias Target' select the ELB.
    - Leave 'Routing Policy' as 'Simple'
    - For this example you can leave 'Evaluate Target Health' as No.
    
3. Create record set - Done!
    - takes 1-5 mnts
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    