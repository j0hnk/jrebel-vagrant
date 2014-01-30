class webserver ( $role = "dev" ) {

	package{ "httpd":
		ensure		=> present,
	}
	
	service { "httpd": 
		ensure		=> running,
		require		=> Package["httpd"]
	}
	 	
    file { "/var/www/html":
   	 	require		=> Package["httpd"],
  		recurse 	=> true,
  		purge		=> true,
		owner		=> root,
		group		=> root,
      	source 		=> "puppet:///modules/webserver/${role}/html"
 	}
	
}