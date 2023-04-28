# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.provision "shell", inline: "echo Hello"
  config.vm.provision "shell", path:'devops_iac/startup/common.sh'
  
  config.vm.define "ngnix" do |ngnix|
    ngnix.vm.box = "bento/ubuntu-22.04"
    ngnix.vm.hostname = "host-ngnix"
    ngnix.vm.network "private_network", ip: "192.168.33.2"
    ngnix.vm.provision "file", source: "devops_iac/startup/ngnix/docker-compose.yaml", destination: "./docker-compose.yaml"
    ngnix.vm.provision "shell", path: "devops_iac/startup/ngnix/nginx.sh"
  end

  config.vm.define "redis" do |redis|
    redis.vm.box = "bento/ubuntu-22.04"
    redis.vm.hostname = "host-redis"
    redis.vm.network "private_network", ip: "192.168.33.3"
    redis.vm.provision "shell", path:'devops_iac/startup/redis/redis.sh'
  end

 config.vm.define "auth" do |auth|
   auth.vm.box = "bento/ubuntu-22.04"
   auth.vm.hostname = "host-auth"
   auth.vm.network "private_network", ip: "192.168.33.4"
   auth.vm.provision "file", source: "devops_iac/startup/auth-api/env.list", destination: "./env.list"
   auth.vm.provision "shell", path: "devops_iac/startup/auth-api/auth.sh"
 end

 config.vm.define "todos" do |todos|
   todos.vm.box = "bento/ubuntu-22.04"
   todos.vm.hostname = "host-todos"
   todos.vm.network "private_network", ip: "192.168.33.6"
   todos.vm.provision "file", source: "devops_iac/startup/todos-api/env.list", destination: "./env.list"
   todos.vm.provision "shell", path: "devops_iac/startup/todos-api/todos.sh"
 end

 config.vm.define "users" do |users|
   users.vm.box = "bento/ubuntu-22.04"
   users.vm.hostname = "host-users"
   users.vm.network "private_network", ip: "192.168.33.8"
   users.vm.provision "file", source: "devops_iac/startup/users-api/env.list", destination: "./env.list"
   users.vm.provision "shell", path: "devops_iac/startup/users-api/users.sh"
 end

end