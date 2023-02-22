# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.provision "shell", inline: "echo Hello"
  config.vm.provision "shell", path:'/Users/victor.jimenezt/study/devops/devops_iac/startup/common.sh'
  
  config.vm.define "ngnix" do |ngnix|
    ngnix.vm.box = "bento/ubuntu-22.04"
    ngnix.vm.hostname = "host-ngnix-processor"
    ngnix.vm.network "private_network", ip: "192.168.33.2"
    ngnix.vm.provision "shell", path: "/Users/victor.jimenezt/study/devops/devops_iac/startup/nginx.sh"
  end

  # config.vm.define "redis" do |redis|
  #   redis.vm.box = "redis"
  #   redis.vm.hostname = "host-redis-processor"
  #   config.vm.box = "ubuntu/trusty64"
  #   redis.vm.network "private_network", ip: "192.168.33.3"
  #   redis.vm.provision "shell", path:'/Users/victor.jimenezt/study/devops/devops_iac/startup/redis/redis.sh'
  # end

  config.vm.define "auth1" do |auth1|
    auth1.vm.box = "bento/ubuntu-22.04"
    auth1.vm.hostname = "host-auth1"
    auth1.vm.network "private_network", ip: "192.168.33.4"
    # auth1.vm.provision "shell", path:'auth.sh'
  end

  config.vm.define "auth2" do |auth2|
    auth2.vm.box = "bento/ubuntu-22.04"
    auth2.vm.hostname = "host-auth1"
    auth2.vm.network "private_network", ip: "192.168.33.5"
    # auth2.vm.provision "shell", path:'auth.sh'
  end

  config.vm.define "backend1" do |backend1|
    backend1.vm.box = "bento/ubuntu-22.04"
    backend1.vm.hostname = "host-backend1"
    backend1.vm.network "private_network", ip: "192.168.33.6"
    # backend1.vm.provision "shell", path:'backend.sh'
  end

  config.vm.define "backend2" do |backend2|
    backend2.vm.box = "bento/ubuntu-22.04"
    backend2.vm.hostname = "host-backend2"
    backend2.vm.network "private_network", ip: "192.168.33.7"
    # backend2.vm.provision "shell", path:'backend.sh'
  end

end