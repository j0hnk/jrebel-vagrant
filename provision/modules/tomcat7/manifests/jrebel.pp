class tomcat7::jrebel {

	include tomcat7
	
	file { "/opt/tomcat7/bin/jrebel-tomcat.sh": 
		source		=> "puppet:///modules/tomcat7/jrebel/jrebel-tomcat.sh",
		mode		=> 755,
		owner		=> tomcat,
		require		=> Package["tomcat7"],
		notify		=> Service["tomcat7"]
	}
	
	file { "/opt/tomcat7/jrebel": 
	  	source 		=> "puppet:///modules/tomcat7/jrebel/jrebel-dist",
  		recurse 	=> true,
  		purge		=> true,
		owner		=> tomcat,
		group		=> tomcat,
		mode		=> 755,
		require		=> Package["tomcat7"]
	}	

}