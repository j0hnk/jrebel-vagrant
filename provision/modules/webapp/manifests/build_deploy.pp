define webapp::build_deploy($sourcedir= "", $warfile = "", $context = "") {

	include devtools

  	exec { "build-$context" :
  		require		=> Package["apache-maven"],
 		command		=> "/usr/share/apache-maven/bin/mvn clean package",
 		cwd			=> $sourcedir,
 		user		=> root		 
  	}

	tomcat7::wardeploy { "$context": 
		warfile		=> $warfile,
		context		=> $context,
		require		=> Exec["build-${context}"]
	}
	
}

