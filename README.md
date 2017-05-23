# Image for dotnetcore compilation with Aws cli #

# TL;DR #
* Needed to build a proof-of-concept for CD/CI for [dotnet core web api]
(https://bitbucket.org/vk-smith/dotnetapi/src)
* Experimented with [Bibucket pipelines](https://bitbucket.org/product/features/pipelines)
* For Pipelines a custom docker image was needed to integrate Microsoft dotnet core sdk and Aws Cli.
* Dockerfile custom image was published to [hub.docker.com](https://hub.docker.com/r/vkhazin/dotnetcore-build/)

# To pull Docker Image #
docker pull vkhazin/dotnetcore-build

# How to use #
* See Bitbucket repo for details: https://bitbucket.org/vk-smith/dotnetapi/src/master/README.md
