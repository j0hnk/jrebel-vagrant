Vagrant.configure("2") do |config|      

	config.vm.provision :puppet do |puppet|
		puppet.manifests_path = "provision/manifests"
		puppet.module_path    = "provision/modules"
		puppet.manifest_file  = "default.pp"
	end
  	
	config.vm.provider "virtualbox" do |vb|
		vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
	end
  
	config.vm.define :dev do |node|
		node.vm.hostname = "dev.slasktratt.se"
		node.vm.box = "CentOS-6.3-x86_64-minimal.box"
		node.vm.box_url = "http://static.uu.se/ark/box/centos-64-x64-vbox4210.box"
		node.vm.network :private_network, ip: "192.168.0.10"
		node.vm.network :forwarded_port, guest: 8080, host: 8080
		node.vm.network :forwarded_port, guest: 80, host: 8000
	end
	
	config.vm.define :prod do |node|
		node.vm.hostname = "prod.slasktratt.se"
		node.vm.box = "CentOS-6.3-x86_64-minimal.box"
		node.vm.box_url = "http://static.uu.se/ark/box/centos-64-x64-vbox4210.box"
		node.vm.network :private_network, ip: "192.168.0.20"
		node.vm.network :forwarded_port, guest: 8080, host: 18080
		node.vm.network :forwarded_port, guest: 80, host: 18000
	end

end
