---
layout: index
---

Playing with JRebel and Vagrant
===============================

At the office for systems development at [Uppsala university](http://www.uu.se) we've been using JRebel for a bit more than one year. We have about 25 or so java developers working on a wide variety of platforms. From JBoss portal via Liferay portal to Spring MVC to older legacy systems based purely on servlets on JSPs. We are constantly trying to improve our methods and tools. [JRebel](http://zeroturnaround.com/software/jrebel/) has been a welcome addition to our toolbox and it has boosted developer productivity. 

We have more systems than we have developers. So devs are quite frequently faced with the challenge of settings up new environments and we have introduced a metric called TTFC - Time to First Commit - that we use when we employ new devs or hire consultants. Our goal is to minimize this TTFC and get our devs productive as quickly as possibly. Enter virtual environments and [Vagrant](http://vagrantup.com). 

By using virtual environments and Vagrant we are able to version control our runtime environments together with our code. This is good stuff since it is now possible for a developer to get a working environment simply by checking out some code and then issuing the command *vagrant up*. 

Another bonus with this setup is that we can keep our development environment in sync with our production servers. By utilizing vagrant and puppet we can let our devs develop against a Redhat platform without leaving the comfort or their Windows or Mac laptops. And the same puppet provisioning that is used on the developers virtual machine can be used to boot up testing instances for nightly regression tests etc. 

By provisioning a virtual machine with vagrant and making sure that the necessary Jrebel tools are included inside this virtual machine we have achieved a setup where our developers can

* Develop in a familiar environment - Mac/Windows
	* Any IDE will work too. As long as the IDE places auto compiled classes in the expected directory, JRebel inside the vagrant machine will be able to pick them up and hot deploy them. You don't even need to worry about installing JRebel or any of the plugins in your Mac/Windows environment. Everything is in the svn repo.  
* Hot deploy auto compiled code inside the virtual environment - in our case, Redhat Linux
* View logs etc in the virtual machine through the directory shared by the VM and the host
* Utilize port forwarding to keep those old 127.0.0.1-bookmarks working as expected
* Work together with ops to keep code and configuration in sync in a single repository
* Easily spin up new instances for different systems and configurations
* Keep a clean laptop. It's usually common to install MySQL, JBoss, Tomcat, Apache possibly even DB2 and a LDAP server to get a functional development environment. Now we keep those things inside the vagrant machines. Delete the image files and it's all gone. No old jars or DLLs laying around and waiting to cause confusion. 

Now that ZeroTurnaround have released [JRebel Remoting](http://zeroturnaround.com/software/jrebel/learn/remoting/) we can actually look at moving the Virtual Machines off from the dev laptops and into our VMWare cluster instead. That will probably give us some new benefits but sometimes it's good to be able to go offline completely and know that everything you need is on you laptop. 

If you head over to [github](https://github.com/j0hnk/jrebel-vagrant/) you can find a small PoC for this setup. You will need a copy of JRebel and license to get it working. 
