FROM jenkins/jenkins:lts
USER root
RUN apt update -qq \
RUN apt upgrade -qq \
    && apt install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
RUN apt update  -qq \
    && apt -y install docker-ce
RUN usermod -aG docker jenkins