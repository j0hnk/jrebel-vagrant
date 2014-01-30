class devtools {

	file { "/etc/yum.repos.d/epel-apache-maven.repo":
		source		=> "puppet:///modules/devtools/epel-apache-maven.repo",
		owner		=> root,
    	group		=> root,
	}
	
	package { "apache-maven":
		require 	=> File["/etc/yum.repos.d/epel-apache-maven.repo"],
		ensure		=> present
	}

	package { "git": 
		ensure		=> present
	}

	package { "subversion": 
		ensure		=> present
	}
	
	package { "wget": 
		ensure		=> present
	}

}

