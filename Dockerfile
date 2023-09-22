FROM jenkins/jenkins:lts
USER root
RUN sudo apt-get update -qq \
    && sudo apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
RUN sudo apt-get update  -qq \
    && sudo apt-get -y install docker-ce
RUN usermod -aG docker jenkins