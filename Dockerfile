FROM jenkins/jenkins:lts
 
USER jenkins
RUN jenkins-plugin-cli --plugins \
    configuration-as-code \
    job-dsl \
    cloudbees-folder \
    credentials \
    github \
    instance-identity \
    script-security \
    structs \
    role-strategy \
    ws-cleanup \