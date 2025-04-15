#!/bin/bash

docker volume rm jenkins_home
docker volume create jenkins_home
 
docker pull jenkins/jenkins:lts &&
  docker build -t dop-jenkins . &&
  docker run --rm -p 8080:8080 --name jenkins \
  -v "jenkins_home:/var/jenkins_home" \
  -v "$(pwd)/my_marvin.yml:/var/jenkins_home/my_marvin.yml" \
  -v "$(pwd)/job_dsl.groovy:/var/jenkins_home/job_dsl.groovy" \
  -e 'JAVA_OPTS=-Djenkins.install.runSetupWizard=false' \
  -e 'CASC_JENKINS_CONFIG=/var/jenkins_home/my_marvin.yml' \
  dop-jenkins