#!/bin/bash

docker pull redis:latest

docker run --name redis -d redis

docker pull victoremilio/devops_rampup_log_processor:1.0

docker run --env-file ./env.list -d victoremilio/devops_rampup_log_processor:1.0
