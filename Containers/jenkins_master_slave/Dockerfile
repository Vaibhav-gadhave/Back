FROM jenkins/jenkins:2.289.3-jdk11

USER root

RUN apt-get update && \
    apt-get -y install apt-transport-https \
      ca-certificates \
      curl \
      gnupg2 \
      software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/debian \
      bullseye \
      stable" && \
    apt-get update && \
    apt-get -y install docker-ce-cli && \
    rm -rf /var/lib/apt/lists/* && \
    usermod -aG docker jenkins

USER jenkins
