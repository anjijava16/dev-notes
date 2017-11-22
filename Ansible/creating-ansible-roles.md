[Source](https://www.azavea.com/blog/2014/10/09/creating-ansible-roles-from-scratch-part-1/ "Permalink to Creating Ansible Roles from Scratch: Part 1 - Azavea")

# Creating Ansible Roles from Scratch

Within Ansible there are two techniques for reusing a set of configuration management tasks, [includes][1] and [roles][2]. Although both techniques function in similar ways, roles appear to be the official way forward. 
[Ansible Galaxy][3] was built as a repository for roles, `ansible-galaxy` exists to aid in installing and creating them.

## Creating a New Role

Let's start off by creating a role for [Packer][4].

Packer is a useful tool for producing different machine image types with the same set of configuration management tasks. For example, Packer can be used to take a set of Ansible instructions, funnel them through itself, and produce both an AMI and Docker image.

Enough about Packer though, let's get back to creating an Ansible role for _installing_ Packer.

The first step in creating a role is creating its directory structure. In order to create the base directory structure, we're going to use a tool bundled with Ansible (since 1.4.2) called `ansible-galaxy`:  

```
$ ansible-galaxy init azavea.packer
azavea.packer was created successfully
```
That command will create an `azavea.packer` directory with the following structure:
 
``` 
    ├── README.md
    ├── defaults
    │ └── main.yml
    ├── files
    ├── handlers
    │ └── main.yml
    ├── meta
    │ └── main.yml
    ├── tasks
    │ └── main.yml
    ├── templates
    └── vars
    └── main.yml
```    

## Explaining the Role Directory Structure

A role's directory structure consists of `defaults`, `vars`, `files`, `handlers`, `meta`, `tasks`, and `templates`. Let's take a closer look at each:

### defaults

Within `defaults`, there is a `main.yml` file with the default variables used by a role. For the Packer role, there is only a `packer_version` default variable. As of this post, the most recent version of Packer is `0.7.1`, so we'll set it to that:

```
packer_version: "0.7.1"
```

### vars

`vars` and `defaults` house variables, but **variables in `vars` have a higher priority**, which means that they are more difficult to override. **Variables in `defaults` have the lowest priority of any variables available**, which means they're easy to override. Placing `packer_version` in `defaults` instead of `vars` is desirable because now it is easier to override when you want to install an older or newer version of Packer:
    
```
    ---
    - hosts: all
    sudo: yes
    roles:
    - { role: "azavea.packer", packer_version: "0.7.0" }
```

All of that said, we're set with `packer_version` in `defaults`, so the `vars` directory is not needed either.

### files

`files` is where you put files that need to be added to the machine being provisioned, **without modification**. Most of the time, files in `files` are referenced by `copy` tasks.

The Packer role has no need for `files`, so we'll delete that directory.

### handlers

`handlers` usually contain targets for `notify` directives, and are almost always associated with services. For example, if you were creating a role for NTP, you might have an entry in `handlers/main.yml` for restarting NTP after a task finishes altering the NTP configuration file.

Packer isn't a service, so there is no need for the `handlers` directory.

### meta

`meta/main.yml` houses one of the biggest differences between includes from roles: metadata. The metadata of an Ansible role consists of attributes such as `author`, supported `platforms`, and `dependencies`. Most of this file is commented out by default, so I usually go through and fill in or uncomment relevant attributes, then delete anything else.

For the Packer role, I trimmed things down to:

```    
    ---
    galaxy_info:
    author: Hector Castro
    description: An Ansible role for installing Packer.
    company: Azavea Inc.
    license: Apache
    min_ansible_version: 1.2
    platforms:
    - name: Ubuntu
    versions:
    - trusty
    categories:
    - cloud
    - system
    dependencies:
    - { role: "azavea.unzip" }
```    

Ignore the `dependencies` bit for right now. We'll come back to it later.

### tasks

`tasks` houses a series of Ansible plays to install, configure, and run software. For Packer, we need to download a specific version, and since it's packaged as a compiled binary in a ZIP archive, extract it. Accomplishing that with Ansible's built-in `get_url` and `unarchive` modules looks like this:
    
```    
    ---
    - name: Download Packer
    get_url: >
    url=https://dl.bintray.com/mitchellh/packer/packer_{{ packer_version }}_linux_amd64.zip
    dest=/usr/local/src/packer_{{ packer_version }}_linux_amd64.zip
    
    - name: Extract and install Packer
    unarchive: src=/usr/local/src/packer_{{ packer_version }}_linux_amd64.zip
    dest=/usr/local/bin
    copy=no
```   

### templates

`templates` is similar to `files` except that `templates` support modification as they're added to the machine being provisioned. Modifications are achieved through the [Jinja2][5] templating language. Most software configuration files become `templates`.

Packer takes most of its configuration parameters via command-line arguments, so the `templates` directory is not needed.

## Huraah!

Congratulations! You now have all of the components necessary for an Ansible role. Now we will create a small playbook to apply the role against a local virtual machine and also take a closer look at the `dependencies` listed in the role metadata.


## A Playbook for Applying the Role

After all of the modifications from the previous post, the directory structure for our role should look like:
    
```    
    ├── README.md
    ├── defaults
    │ └── main.yml
    ├── meta
    │ └── main.yml
    └── tasks
    └── main.yml
```   

Now, let's alter the directory structure a bit to make room for a top level playbook and virtual machine definition to test the role. For the virtual machine definition, we'll use [Vagrant][6].

To accommodate the top level playbook, let's move the `azavea.packer` directory into a `roles` directory. At the same level as `roles`, let's also create a `site.yml` playbook and a `Vagrantfile`. After those changes are made, the directory structure should look like:
    
```    
    ├── Vagrantfile
    ├── roles
    │ └── azavea.packer
    │ ├── README.md
    │ ├── defaults
    │ │ └── main.yml
    │ ├── meta
    │ │ └── main.yml
    │ └── tasks
    │ └── main.yml
    └── site.yml
```    

The contents of the `site.yml` should contain something like:
    
```    
    ---
    - hosts: all
    sudo: yes
    roles:
    - { role: "azavea.packer" }
```    

This instructs Ansible to apply the `azavea.packer` role to all hosts using `sudo`.

And the contents of the `Vagrantfile` should look like:
    
```    
    # -*- mode: ruby -*-
    # vi: set ft=ruby :
    
    VAGRANTFILE_API_VERSION = "2"
    
    Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "ubuntu/trusty64"
    
    config.vm.provision "ansible" do |ansible|
    ansible.playbook = "site.yml"
    end
    end
```    

Here we're making use of the `ubuntu/trusty64` box on [Vagrant Cloud][7], along with the [Ansible provisioner][8] for Vagrant.

Running `vagrant up` from the same directory that contains the `Vagrantfile` should bring up a Ubuntu 14.04 virtual machine, and then attempt use `ansible-playbook` to apply `site.yml`. Unfortunately, that attempt will fail, and we'll be met with the follow error:
    
```    
    ERROR: cannot find role in /Users/hector/Projects/blog/roles/azavea.unzip or
    /Users/hector/Projects/blog/azavea.unzip or /etc/ansible/roles/azavea.unzip
    
    Ansible failed to complete successfully. Any error output should be
    visible above. Please fix these errors and try again.
```    

Where is this reference to `azavea.unzip` coming from? Oh, that's right, we had it listed as a dependency in the Packer role metadata…

## Role Dependencies

Role dependencies are references to other Ansible roles needed for a role to function properly. In this case, we need `unzip` installed in order to extract the Packer binaries from `packer_0.7.1_linux_amd64.zip`.

To resolve the dependency, `azavea.unzip` needs to exist in the same `roles` directory that currently houses `azavea.packer`. We could create that role the same way we did `azavea.packer`, but `azavea.unzip` [already exists][9] within Ansible Galaxy (actually, so does `azavea.packer`).

In order to install `azavea.unzip` into the `roles` directory, we can use the `ansible-galaxy` command again:
    
```    
    $ ansible-galaxy install azavea.unzip -p roles
    downloading role 'unzip', owned by azavea
    no version specified, installing 0.1.0
    - downloading role from https://github.com/azavea/ansible-unzip/archive/0.1.0.tar.gz
    - extracting azavea.unzip to roles/azavea.unzip
    azavea.unzip was installed successfully
```    

Now, if we try to reprovision the virtual machine, the Ansible run should complete successfully:
    
```    
    $ vagrant provision
    ==> default: Running provisioner: ansible...
    
    PLAY [all] ********************************************************************
    
    GATHERING FACTS ***************************************************************
    ok: [default]
    
    TASK: [azavea.unzip | Install unzip] ******************************************
    changed: [default]
    
    TASK: [azavea.packer | Download Packer] ***************************************
    changed: [default]
    
    TASK: [azavea.packer | Extract and install Packer] ****************************
    changed: [default]
    
    PLAY RECAP ********************************************************************
    default : ok=4 changed=3 unreachable=0 failed=0
```    

Before we celebrate, let's connect to the virtual machine and ensure that Packer was installed properly:
    
```    
    $ vagrant ssh
    vagrant@vagrant-ubuntu-trusty-64:~$ packer
    usage: packer [--version] [--help]  []
    
    Available commands are:
    build build image(s) from template
    fix fixes templates from old versions of packer
    inspect see components of a template
    validate check that a template is valid
    
    Globally recognized options:
    -machine-readable Machine-readable output format.
```    

Excellent! The Packer role we created has successfully installed Packer! Adding Ansible as a provisioner makes setting up a development environment wonderfully smooth

[1]: http://docs.ansible.com/playbooks_roles.html#task-include-files-and-encouraging-reuse
[2]: http://docs.ansible.com/playbooks_roles.html#roles
[3]: https://galaxy.ansible.com/
[4]: http://www.packer.io/
[5]: http://jinja.pocoo.org/docs/dev/
[5]: http://jinja.pocoo.org/docs/dev/
[6]: http://www.vagrantup.com/
[7]: https://vagrantcloud.com/ubuntu/boxes/trusty64
[8]: https://docs.vagrantup.com/v2/provisioning/ansible.html
[9]: https://galaxy.ansible.com/list#/roles/1830