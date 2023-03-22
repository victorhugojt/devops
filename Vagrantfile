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

  config.vm.define "redis" do |redis|
     redis.vm.box = "redis"
     redis.vm.hostname = "host-redis-processor"
     redis.vm.network "private_network", ip: "192.168.33.3"
     redis.vm.provision "shell", path:'/Users/victor.jimenezt/study/devops/devops_iac/startup/redis/redis.sh'
   end

  config.vm.define "auth1" do |auth1|
    auth1.vm.box = "bento/ubuntu-22.04"
    auth1.vm.hostname = "host-auth1"
    auth1.vm.network "private_network", ip: "192.168.33.4"
    auth1.vm.provision "shell", path: "/Users/victor.jimenezt/study/devops/devops_iac/startup/auth-api/auth.sh"
  end

  config.vm.define "auth2" do |auth2|
    auth2.vm.box = "bento/ubuntu-22.04"
    auth2.vm.hostname = "host-auth1"
    auth2.vm.network "private_network", ip: "192.168.33.5"
    auth2.vm.provision "shell", path: "/Users/victor.jimenezt/study/devops/devops_iac/startup/auth-api/auth.sh"
  end

  config.vm.define "todos1" do |todos1|
    todos1.vm.box = "bento/ubuntu-22.04"
    todos1.vm.hostname = "host-todos-1"
    todos1.vm.network "private_network", ip: "192.168.33.6"
    todos1.vm.provision "shell", path: "/Users/victor.jimenezt/study/devops/devops_iac/startup/todos-api/todos.sh"
  end

  config.vm.define "todos2" do |todos2|
    todos1.vm.box = "bento/ubuntu-22.04"
    todos1.vm.hostname = "host-todos-2"
    todos1.vm.network "private_network", ip: "192.168.33.7"
    todos1.vm.provision "shell", path: "/Users/victor.jimenezt/study/devops/devops_iac/startup/todos-api/todos.sh"
  end

end