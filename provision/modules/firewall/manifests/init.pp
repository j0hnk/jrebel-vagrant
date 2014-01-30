class firewall ($role = "open") {

	package {"iptables":
		ensure		=> present
	}
	
	service {"iptables":
		ensure		=> running,
		require		=> Package["iptables"],
		subscribe	=> File["/etc/sysconfig/iptables"]
	}
	
	file { "/etc/sysconfig/iptables": 
		require		=> Package["iptables"],
		source		=> "puppet:///modules/firewall/iptables.${role}",
		owner		=> root,
		group		=> root,
		mode		=> 444
	}

}