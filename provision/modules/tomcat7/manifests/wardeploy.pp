define tomcat7::wardeploy($warfile = "", $context = "") {

	include tomcat7
	
	file { "/opt/tomcat7/webapps/${context}.war":,
		require		=> Package["tomcat7"],
		source		=> $warfile,
		owner		=> tomcat
	}
	
	# Should probably do some cleanup here before deploy
	# Remove temp-stuff, previously unpacked warfile etc etc..
}