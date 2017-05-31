FROM microsoft/dotnet:1.1.1-sdk

# Update apt
RUN apt-get update

# Install aws-cli
RUN apt-get install python python-pip -y \
    && pip install awscli

# Enable Docker-in-Docker
RUN apt-get -y install \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
    && add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/debian \
    $(lsb_release -cs) \
    stable" \
    && apt-get update \
    && apt-get -y install docker-ce

