define webapp::download_deploy($warurl = "", $context = "") {

	include devtools
	
	$tempdir = "/tmp"
	
	Exec { 
   		path		=> "/bin:/usr/bin:/sbin:/usr/sbin" 
  	}

  	exec { "download-${context}" :
		#command	=> "rm -f ${context}.war && wget ${warurl} -O ${context}.war",
		command		=> "rm -f ${context}.war && cp -v ${warurl} ${context}.war",
		cwd			=> $tempdir,
 		user		=> root 
  	}

	tomcat7::wardeploy { "${context}": 
		warfile		=> "${tempdir}/${context}.war",
		context		=> $context,
		require		=> Exec["download-${context}"]
	}

}

