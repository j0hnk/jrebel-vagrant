jrebel-vagrant
==============

This is a simple test I did to see if you can run JRebel in combination with vagrant.

*GOAL* - Setup a development environment where I can code in a familiar 
environment (Eclipse, MacOS X) while running my code in a controlled, 
server like environment, in this case CentOS. All this while still enjoying 
the benefints of JRebel - Zero downtime, code-save-reload etc. 

Since I can't redistribute JRebel you will have to do some changes here. 

Replace the empty file *jrebel.jar* with your real copy of jrebel.jar. You 
can find the file under *provision/modules/tomcat7/files/jrebel/jrebel-dist/jrebel.jar*.

You will also need to edit the file *provision/modules/tomcat7/files/jrebel/jrebel-dist/jrebel.properties* 
to suit your environment. 

Once these two changes are done you should be able to import the project into 
eclipse (or any other IDE) and start coding away. There's not much code to be 
seen though. So when you're done looking at it you can boot up a machine. 

``
$ vagrant up dev
``

Once the machine is up you can try to access http://127.0.0.1:8080/jrebel-vagrant. 
You should see some rather boring output there. Try changing the servlet class 
SillyServlet.java and reload the page. Changes should be immediate. No redeploy.

Puppet stuff
============

I'm not *master of puppet*. The puppet manifests and modules included in ths 
repo are probably considered rather crufty. What I have attempted to do is to 
show that it is possible to keep development and production stuff in the same 
code repository.
