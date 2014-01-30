define webapp::download_deploy($warurl = "", $context = "") {

	$dldir = "/opt/download"

	package { "wget": 
		ensure		=> present
	}
	
	
	
	Exec { 
   		path		=> "/bin:/usr/bin:/sbin:/usr/sbin" 
  	}
  	
  	file { "${dldir}" :
  		ensure		=> directory,
  		owner		=> root,
  		group		=> root,
  		mode		=> 755
  	}

  	exec { "download-${context}" :
		command		=> "rm -f ${context}.war && wget ${warurl} -O ${context}.war",
		cwd			=> $dldir,
 		user		=> root,
 		require		=> [File["${dldir}"],Package["wget"]]
  	}

	tomcat7::wardeploy { "${context}": 
		warfile		=> "${dldir}/${context}.war",
		context		=> $context,
		require		=> Exec["download-${context}"]
	}

}

