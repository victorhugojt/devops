# apt-get -y update

# apt-get -y install nginx

# service nginx start

# docker run --env-file ./env.list -p 8080:8080 -d victoremilio/devops_rampup_front:1.0

# docker run -e AUTH_API_PORT='8000' -e USERS_API_ADDRESS='192.168.33.8:8083' -e JWT_SECRET='PRFT' -p 8080:8080 -d victoremilio/devops_rampup_front:1.0

# docker pull victoremilio/devops_rampup_ngnix:1.0

# docker pull victoremilio/devops_rampup_front:1.0

docker compose up -d
