docker pull victoremilio/devops_rampup_users:1.0

docker run --env-file ./env.list -p 8083:8083 -d victoremilio/devops_rampup_users:1.0