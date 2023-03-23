
docker pull victoremilio/devops_rampup_front:1.0

docker run --env-file ./env.list -p 8080:8080 -d victoremilio/devops_rampup_front:1.0