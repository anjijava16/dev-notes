
[Source](https://www.azavea.com/blog/2014/10/30/running-vagrant-with-ansible-provisioning-on-windows/ "Permalink to Running Vagrant with Ansible Provisioning on Windows - Azavea")

# Running Vagrant with Ansible Provisioning on Windows - Azavea

At Azavea we use [Ansible][1] and [custom ansible roles][2] quite [a bit][3].

We've also been using [Vagrant][4] for quite some time to create project-specific development environments.  Adding Ansible as a provisioner makes setting up a development environment wonderfully smooth.

Unfortunately, Ansible is not officially supported with Windows as the [control machine][5].

It is [possible][6] to get Ansible running in a [Cygwin][7] environment.  With a bit of work, you can get it running from Vagrant too!

## Installing Cygwin

The first step to getting Ansible running is installing Cygwin.  You can follow the [normal installation instructions][8] for Cygwin if you'd like to, or if you already have a Cygwin environment set up that's great too!

We're using [babun][9] instead of Cygwin's normal installer for a simpler installation and package installation process.  If you're new to using Cygwin or having trouble with the standard installer I'd recommend this.

## Setting up Ansible

Once you've got Cygwin installed, you'll want to open up a terminal. You'll need to use a Cygwin terminal, and not `cmd.exe`, whenever you want to run `ansible-playbook` or `vagrant`.

You'll need to install `pip`, to be able to install Ansible. You'll also need some packages Ansible needs to run that can't be installed by pip. If you're using the standard Cygwin installer, run it again and make sure `python`, `python-paramiko`, `python-crypto`, `gcc-g++`, `wget`, `openssh python-setuptools` are all installed. We need `gcc-g++` to compile source code when installing `PyYAML` from PyPi.

If you're using babun, this is:
    
    
    pact install python python-paramiko python-crypto gcc-g++ wget openssh python-setuptools
    

You might get the following error if you try to run python: `ImportError: No module named site`.  
If you see that error add the following to your `~/.bashrc` or `~/.zshrc` (in your Cygwin home folder) and source it:
    
    
    export PYTHONHOME=/usr
    export PYTHONPATH=/usr/lib/python2.7
    

Next lets get `pip` installed, and install Ansible itself.
    
    
    python /usr/lib/python2.7/site-packages/easy_install.py pip
    pip install ansible
    

## Making Ansible Run From Vagrant

Once that is done, you should be able to run `ansible-playbook` from bash or zsh.

_However_, that isn't enough to use Ansible as a Vagrant provisioner. Even if you call `vagrant` from bash or zsh, `vagrant` won't be able to find `ansible-playbook`, because it isn't on the Windows PATH. But even if we put `ansible-playbook` on the Windows PATH, it won't run, because it needs to use the Cygwin Python.

To ensure we're using the Python in our Cygwin environment, we need a way to run `ansible-playbook` through `bash`. The solution we came up with was to create a small Windows batch file and place it somewhere on the Windows PATH as `ansible-playbook.bat`:
    
    
    @echo off
    
    REM If you used the stand Cygwin installer this will be C:cygwin
    set CYGWIN=%USERPROFILE%.babuncygwin
    
    REM You can switch this to work with bash with %CYGWIN%binbash.exe
    set SH=%CYGWIN%binzsh.exe
    
    "%SH%" -c "/bin/ansible-playbook %*"
    

This is enough to let Vagrant find `ansible-playbook` and run the Ansible provisioner.

You'll likely run into the following error when you try and provision your first Vagrant VM:
    
    
    GATHERING FACTS ***************************************************************
    fatal: [app] => SSH encountered an unknown error during the connection. We recommend you re-run the command using -vvvv, which will enable SSH debugging output to help diagnose the issue
    

To get around this, we had to create a `~/.ansible.cfg` in our Cygwin home directory (this can also go in your project directory as `ansible.cfg`) changing what the ssh `ControlPath` was set to:
    
    
    [ssh_connection]
    control_path = /tmp
    

And with that you should be ready to provision using Ansible!

If you want to run other Cygwin programs from your Vagrantfile, such as `ansible-galaxy`, you'll have to make another batch file. For an example of how to easily make a bunch of wrapper batch files, checkout [this gist][10].

[1]: https://github.com/ansible/ansible
[2]: http://www.azavea.com/blogs/labs/2014/10/creating-ansible-roles-from-scratch-part-1/
[3]: https://github.com/search?p=2&q=user%3Aazavea+ansible-&ref=searchresults&type=Repositories&utf8=%E2%9C%93
[4]: https://www.vagrantup.com/
[5]: http://docs.ansible.com/intro_installation.html#control-machine-requirements
[6]: https://servercheck.in/blog/running-ansible-within-windows
[7]: https://cygwin.com/
[8]: https://cygwin.com/install.html
[9]: http://babun.github.io/
[10]: https://gist.github.com/maurizi/325387aee9ea94fbf903

  