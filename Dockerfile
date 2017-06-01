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
     gnupg2 \
     software-properties-common \
     curl \
     lxc \
     iptables


RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
    && add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/debian \
    $(lsb_release -cs) \
    stable" \
    && apt-get update \
    && apt-get -y install docker-ce

# Install the magic wrapper.
ADD ./wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

# Define additional metadata for our image.
VOLUME /var/lib/docker
CMD ["wrapdocker"]
