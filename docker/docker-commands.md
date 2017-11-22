# Docker Commands

```
docker –version
docker pull
docker run
docker ps
docker ps -a
docker exec
docker stop
docker kill
docker commit
docker login
docker push
docker images
docker rm
docker rmi
docker build
```

1.** docker –version**

This command is used to get the currently installed version of docker

![Docker_Version - Docker Commands - Edureka][2]

&nbsp;

2.** docker pull**

**Usage: docker pull <img name="">**

This command is used to pull images from the **docker repository**(hub.docker.com)

![Docker_Pull - Docker Commands - Edureka][3]  
  
3\. **docker run**

**Usage: docker run -it -d <img name="">**

This command is used to create a container from an image

![docker_run - Docker Commands - Edureka][4]  
  
4\. **docker ps**

This command is used to list the running containers

![docker_ps - Docker Commands - Edureka][5]  
  
5\. **docker ps -a**

This command is used to show all the running and exited containers

![docker_psa - Docker Commands - Edureka][6]  
  
6\. **docker exec**

**Usage: docker exec -it <container id=""> bash**

This command is used to access the running container

![docker_exec - Docker Commands - Edureka][7]  
  
7\. **docker stop**

**Usage: docker stop <container id="">**

This command stops a running container

![docker_stop - Docker Commands - Edureka][8]  
  
8\. **docker kill**

**Usage: docker kill <container id="">**

This command kills the container by stopping its execution immediately. The difference between 'docker kill' and 'docker stop' is that 'docker stop' gives the container time to shutdown gracefully, in situations when it is taking too much time for getting the container to stop, one can opt to kill it

![docker_kill - Docker Commands - Edureka][9]  
  
9\. **docker commit**

**Usage: docker commit <conatainer id=""> <username imagename="">**

This command creates a new image of an edited container on the local system

![docker_commit - Docker Commands - Edureka][10]  
  
10. **docker login**

This command is used to login to the docker hub repository

![docker_login - Docker Commands - Edureka][11]  
  
11.** docker push**

**Usage: docker push <username image="" name="">**

This command is used to push an image to the docker hub repository

![docker_push - Docker Commands - Edureka][12]  
  
12\. **docker images**

This command lists all the locally stored docker images

![docker_images - Docker Commands - Edureka][13]  
  
13\. **docker rm**

**Usage: docker rm <container id="">**

This command is used to delete a stopped container

![docker_rm - Docker Commands - Edureka][14]  
  
14\. **docker rmi**

**Usage: docker rmi <image-id>**

This command is used to delete an image from local storage

![docker_rmi - Docker Commands - Edureka][15]  
  
15\. **docker build**

**Usage: docker build <path to="" docker="" file="">**

This command is used to build an image from a specified docker file

![docker_build - Docker Commands - Edureka][16]

&nbsp;

Want to learn more about docker commands? Here is a [**Docker Tutorial][17]** to get you started. Alternatively, you can take a top down approach and start with this** [Devops Tutorial.][18]**

[Master Devops Now!][19]

_Now that you have understood what is DevOps, check out our&nbsp;[__**DevOps Certification Training][20]**&nbsp;by Edureka,&nbsp;a trusted online learning company&nbsp;with a network of more than&nbsp;250,000&nbsp;satisfied learners&nbsp;spread across&nbsp;the globe. The Edureka DevOps Certification Training course&nbsp;helps learners gain expertise in various DevOps processes and tools such as Puppet, Jenkins, Nagios, Ansible, Chef, Saltstack and GIT for automating multiple steps in SDLC._


[2]: https://cdn.edureka.co/blog/wp-content/uploads/2017/11/Docker_Version-Docker-Commands-Edureka-3-e1510653973130.png
[3]: https://cdn.edureka.co/blog/wp-content/uploads/2017/11/Docker_Pull-Docker-Commands-Edureka-2-e1510653950923.png
[4]: https://cdn.edureka.co/blog/wp-content/uploads/2017/11/docker_run-Docker-Commands-Edureka-e1510653910376.png
[5]: https://cdn.edureka.co/blog/wp-content/uploads/2017/11/docker_ps-Docker-Commands-Edureka-e1510653881541.png
[6]: https://cdn.edureka.co/blog/wp-content/uploads/2017/11/docker_psa-Docker-Commands-Edureka-e1510653854892.png
[7]: https://cdn.edureka.co/blog/wp-content/uploads/2017/11/docker_exec-Docker-Commands-Edureka-e1510653829237.png
[8]: https://cdn.edureka.co/blog/wp-content/uploads/2017/11/docker_stop-Docker-Commands-Edureka-e1510653793521.png
[9]: https://cdn.edureka.co/blog/wp-content/uploads/2017/11/docker_kill-Docker-Commands-Edureka-e1510653772661.png
[10]: https://cdn.edureka.co/blog/wp-content/uploads/2017/11/docker_commit-Docker-Commands-Edureka-e1510653734760.png
[11]: https://cdn.edureka.co/blog/wp-content/uploads/2017/11/docker_login-Docker-Commands-Edureka-1-e1510653706645.png
[12]: https://cdn.edureka.co/blog/wp-content/uploads/2017/11/docker_push-Docker-Commands-Edureka-e1510653678749.png
[13]: https://cdn.edureka.co/blog/wp-content/uploads/2017/11/docker_images-Docker-Commands-Edureka-e1510653647888.png
[14]: https://cdn.edureka.co/blog/wp-content/uploads/2017/11/docker_rm-Docker-Commands-Edureka-e1510653622699.png
[15]: https://cdn.edureka.co/blog/wp-content/uploads/2017/11/docker_rmi-Docker-Commands-Edureka-e1510653592230.png
[16]: https://cdn.edureka.co/blog/wp-content/uploads/2017/11/docker_built-Docker-Commands-Edureka-e1510653559161.png
[17]: https://www.edureka.co/blog/docker-tutorial
[18]: https://www.edureka.co/blog/devops-tutorial
[19]: https://www.edureka.co/devops
[20]: https://www.edureka.co/devops/

  