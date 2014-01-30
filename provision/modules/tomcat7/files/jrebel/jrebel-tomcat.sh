#!/bin/bash

# Managed by puppet :-)

# Inject JRebel-stuff only if jrebel.jar is not empty.
if [ -s /opt/tomcat7/jrebel/jrebel.jar ]
then
	export JAVA_OPTS="-javaagent:/opt/tomcat7/jrebel/jrebel.jar $JAVA_OPTS"
fi