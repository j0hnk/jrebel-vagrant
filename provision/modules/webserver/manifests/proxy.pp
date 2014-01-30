define webserver::proxy ( $context = "" ) {

	include webserver
	
	file { "/etc/httpd/conf.d/${context}.conf":
		require		=> 	Package["httpd"],
		content 	=> 	template("webserver/proxy.erb"),
		notify  	=>	Service[httpd]
	}

}