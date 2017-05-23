# Image for Microsoft .Net Core CD/CI #

# TL;DR #
* Needed to build a proof-of-concept for CD/CI using [dotnet core web api](https://www.microsoft.com/net/core)
* Output of the build required - docker image uploaded to [S3 bucket](https://aws.amazon.com/documentation/s3/)
* Experimented with [Bibucket pipelines](https://bitbucket.org/product/features/pipelines)
* For Pipelines a custom docker image was needed to integrate Microsoft dotnet core sdk with Aws Cli.
* Dockerfile custom image was published to [hub.docker.com](https://hub.docker.com/r/vkhazin/dotnetcore-build/)

# To pull Docker Image #
docker pull vkhazin/dotnetcore-build

# How to use #
* See [Bitbucket repo](https://bitbucket.org/vk-smith/dotnetapi/src/master/README.md) for details
