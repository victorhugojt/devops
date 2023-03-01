docker pull victorhugojt/devops_rampup_users

docker run --env-file ./env.list -p 8083:8083 -d victorhugojt/devops_rampup_users