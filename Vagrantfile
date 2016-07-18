$puppet_install = <<SCRIPT
echo "Installing Repository"
sudo yum -y install https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
echo "Installing Puppet"
sudo yum -y install puppet-agent
echo "Installing vim"
sudo yum -y install vim
SCRIPT


Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"

  config.vm.define "puppetmaster" do |puppetmaster|
    puppetmaster.vm.host_name = "puppetmaster.example.com"
    puppetmaster.vm.synced_folder "puppet-modules/", "/srv/puppet_code"
    puppetmaster.vm.network "private_network", ip: "10.0.10.2"
    puppetmaster.vm.provider "virtualbox" do |v|
      v.memory = 4096
    end
  end

  config.vm.define "puppetnode1" do |puppetnode1|
    puppetnode1.vm.host_name = "puppetnode1.example.com"
    puppetnode1.vm.synced_folder "puppet-modules/", "/srv/puppet_code"
    puppetnode1.vm.network "private_network", ip: "10.0.10.3"
    puppetnode1.vm.provision "shell", inline: $puppet_install
  end

end
