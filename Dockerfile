FROM microsoft/dotnet:1.1.1-sdk
RUN apt-get update \
	&& apt-get install python python-pip -y \
	&&  pip install awscli

