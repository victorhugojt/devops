docker pull victoremilio/devops_rampup_todos:1.0

docker run -e TODO_API_PORT='8082' -e JWT_SECRET='PRFT' -e REDIS_HOST='192.168.33.3' -e REDIS_PORT='6379' -e REDIS_CHANNEL='log_channel'  -p 8082:8082 -d victoremilio/devops_rampup_todos:1.0

# docker run --env-file ./env.list -p 8082:8082 -d victoremilio/devops_rampup_todos:1.0