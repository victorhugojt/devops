docker pull victorhugojt/devops_rampup_front

# Docker mapped the 8080 port inside of the container to the port 49160 on your machine
docker run --env-file ./env.list -p 8083:8083 -d victorhugojt/devops_rampup_users


docker build -t victorhugojt/devops_rampup_users .

docker build -t victorhugojt/devops_rampup_log_processor .

docker build -t victorhugojt/devops_rampup_todos .

docker build -t victorhugojt/devops_rampup_front .

docker build -t victorhugojt/devops_rampup_auth .