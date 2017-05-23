# Image for dotnetcore compilation with Aws cli #

# Docker Image #
docker pull vkhazin/dotnetcore-build

# Sample Bitbucket Pipelines #
```
image: vkhazin/dotnetcore-build:1.1.1

options:
  docker: true

pipelines:
  default:
    - step:
        script:
          - chmod +x ./ci-build.sh
          - ./ci-build.sh
```

# Sample build file #
```
PROJECT_FOLDER="./dotnetapi"

DOCKER_PUBLISH_FOLDER="./obj/Docker/publish"
VERSION=$(date +"%y%m.%d.%H.%M")
DOCKER_IMAGE_ID=vkhazin/dotnetapi:$VERSION

# Aws Credentials are stored in pipeline environment variables
S3_BUCKET_NAME="poc-deploy"
S3_BUCKET_KEY="dotnetapi"

# Restore nuget packages
dotnet restore $PROJECT_FOLDER

# Build project
dotnet publish $PROJECT_FOLDER -c Release -o $DOCKER_PUBLISH_FOLDER

# Build Docker image
docker build $PROJECT_FOLDER --tag $DOCKER_IMAGE_ID

# Extract Docker image
FILE_NAME="${DOCKER_IMAGE_ID/:/-}"
FILE_NAME="${FILE_NAME/\//-}".tar
docker save -o $FILE_NAME $DOCKER_IMAGE_ID

# Upload docker image to S3 bucket
aws s3api put-object --bucket $S3_BUCKET_NAME --key $S3_BUCKET_KEY/$FILE_NAME --body $FILE_NAME
```


