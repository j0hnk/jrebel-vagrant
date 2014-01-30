class tomcat7 {

	package {"java-1.7.0-openjdk":
    	ensure    => "installed"
  	}

  	file {"/tmp/tomcat7-7.0.42-1.noarch.rpm": 
    	source    => "puppet:///modules/tomcat7/tomcat7-7.0.42-1.noarch.rpm"
  	}

  	package { "tomcat7":
    	require   => [ 
    		Package["java-1.7.0-openjdk"],
    		File["/tmp/tomcat7-7.0.42-1.noarch.rpm"] 
    		],
    	provider  => "rpm",
    	ensure    => "installed", 
    	source    => "/tmp/tomcat7-7.0.42-1.noarch.rpm"
  	}
  	
  	file { "/opt/tomcat7/bin/setenv.sh": 
		source		=> "puppet:///modules/tomcat7/setenv.sh",
		mode		=> 755,
		owner		=> tomcat,
		group		=> tomcat,
		require		=> Package["tomcat7"],
		notify		=> Service["tomcat7"]
	}
  
  	service { "tomcat7":
    	ensure    => running,
    	require   => [
    		Package["tomcat7"],
    		File["/opt/tomcat7/bin/setenv.sh"]
    		]
  	}

}

