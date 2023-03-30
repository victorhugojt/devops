docker pull victoremilio/devops_rampup_log_processor:1.0

# docker run -e REDIS_HOST='192.168.33.3' -e REDIS_PORT='6379' -e REDIS_CHANNEL='log_channel'  -d victoremilio/devops_rampup_log_processor:1.0

docker run --env-file ./env.list -d victoremilio/devops_rampup_log_processor:1.0