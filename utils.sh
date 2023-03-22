docker ps --format '{"ID":"{{ .ID }}", "Image": "{{ .Image }}", "Names":"{{ .Names }}" , "Ports":"{{ .Ports }}"}' --filter status=running

docker tag victorhugojt/devops_rampup_front victoremilio/devops_rampup_front:1.0
docker push victoremilio/devops_rampup_front:1.0

docker tag victorhugojt/devops_rampup_log_processor victoremilio/devops_rampup_log_processor:1.0
docker push victoremilio/devops_rampup_log_processor:1.0

docker tag victorhugojt/devops_rampup_auth victoremilio/devops_rampup_auth:1.0
docker push victoremilio/devops_rampup_auth:1.0

docker tag victorhugojt/devops_rampup_users victoremilio/devops_rampup_users:1.0
docker push victoremilio/devops_rampup_users:1.0

docker tag victorhugojt/devops_rampup_todos victoremilio/devops_rampup_todos:1.0
docker push victoremilio/devops_rampup_todos:1.0

