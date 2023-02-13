
docker pull victorhugojt/devops_rampup_front

# Docker mapped the 8080 port inside of the container to the port 49160 on your machine
docker run --env-file ./env.list -p 49160:8082 -d victorhugojt/devops_rampup_back