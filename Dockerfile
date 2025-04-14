FROM jenkins/jenkins:lts
 
USER jenkins
RUN jenkins-plugin-cli --plugins \
    configuration-as-code \
    job-dsl 