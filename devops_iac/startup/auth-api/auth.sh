docker pull victoremilio/devops_rampup_auth:1.0

docker run --env-file ./env.list -p 8000:8000 -d victoremilio/devops_rampup_users