# Order : redis, users, auth, todo, front, log

docker run --name rampup-redis -p 6379:6379 -d redis 

docker run --name users-api --env-file ./users-api/env.list -p 8083:8083 -d victorhugojt/devops_rampup_users

docker run --name auth-api --env-file ./auth-api/env.list -p 8000:8000 -d victorhugojt/devops_rampup_auth

docker run --name todos-api --env-file ./todos-api/env.list -p 8082:8082 -d victorhugojt/devops_rampup_todos

docker run --name front --env-file ./frontend/env.list -p 8080:8080 -d victorhugojt/devops_rampup_front

docker run --name log-processor --env-file ./log-message-processor/env.list -d victorhugojt/devops_rampup_log_processor

docker ps --format '{"ID":"{{ .ID }}", "Image": "{{ .Image }}", "Names":"{{ .Names }}", "Ports":"{{ .Ports }}"}' --filter status=running