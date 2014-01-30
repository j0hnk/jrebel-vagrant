#!/bin/bash

# Managed by puppet :-)

# This script will be called on tomcat7 startup
# Do not place environment specific settings in this file


if [ -x /opt/tomcat7/bin/jrebel-tomcat.sh ]
then
	. /opt/tomcat7/bin/jrebel-tomcat.sh
fi
