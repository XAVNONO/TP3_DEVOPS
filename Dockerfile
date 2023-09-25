FROM jenkins/jenkins:lts
USER root
RUN sudo apt update -qq \
RUN sudo apt upgrade -qq \
    && sudo apt install -qqy sudo apt-transport-https ca-certificates curl gnupg2 software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
RUN sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
RUN sudo apt update  -qq \
    && sudo apt -y install docker-ce
RUN sudo usermod -aG docker jenkins