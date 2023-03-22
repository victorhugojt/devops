docker pull victoremilio/devops_rampup_todos:1.0

docker run --env-file ./env.list -p 8082:8082 -d victoremilio/devops_rampup_todos:1.0
