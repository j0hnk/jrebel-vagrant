node "dev.slasktratt.se" {
	
	class { "firewall":
		role		=> open
	}
	
	class { "webserver": 
		role		=> dev
	}
	
	include tomcat7::jrebel
	
	webserver::proxy { "jrebel-vagrant":
		context		=> "jrebel-vagrant"
	}
	
	webapp::build_deploy { "jrebel-vagrant": 
		sourcedir	=> "/vagrant/",
		warfile 	=> "/vagrant/target/jrebel-vagrant-1.0.0.war",
		context		=> "jrebel-vagrant"
	}
	
}

node "prod.slasktratt.se" {	

	class { "firewall":
		role		=> web
	}
	
	class { "webserver": 
		role		=> prod
	}
	
	webserver::proxy { "jrebel-vagrant":
		context		=> "jrebel-vagrant"
	}
	
	webapp::download_deploy { "jrebel-vagrant" :
		#warurl 	=>	"http://www.uu.se/files/dist/vagrant-demo-1.0.0.war",
		warurl 		=>	"/vagrant/target/jrebel-vagrant-1.0.0.war",
		context		=>	"vagrant-demo"
	}
	
}




