# Accumulo v1.5.1 By Vagrant

A three node Accumulo cluster running on Ubuntu Precise (12.04). The 
instance name is 'instance'. The user name is 'root' and the password 
is 'secret'.

1. Install Vagrant
2. vagrant plugin install vagrant-hostmanager
3. Download this project.
4. cat xa? > affy-1-5-1.box
5. vagrant box add -f affy-1-5-1 affy-1-5-1.box
6. Run 'vagrant up'
7. Run './post_spinup.sh'
8. Follow the instructions to start Accumulo.

Now you can visit the following URLs in your browser:

<a target="_blank" href='http://affy-master:50095/'>http://affy-master:50095/</a>
<br/>
<a target="_blank" href='http://affy-master:50070/dfshealth.jsp'>http://affy-master:50070/dfshealth.jsp</a>
<br/>
<a target="_blank" href='http://affy-master:50030/jobtracker.jsp'>http://affy-master:50030/jobtracker.jsp</a>
<br/>

You can SSH to the nodes using the following commands. Notice that the hostnames start with 'affy-' but that 
the vagrant nodes do not have the prefix.

```
vagrant ssh master
vagrant ssh slave1
vagrant ssh slave2
```

## More Software

See https://github.com/medined/Accumulo_1_5_0_By_Vagrant for information about
installing Pig and D4M.

## X-WINDOWS

All nodes have X11 port forwarding is automatic when you use 'vagrant ssh'. 
For  convenience, I manually installed additional software on that node:

```
sudo apt-get install -y x11-apps
sudo apt-get install -y netbeans
```
