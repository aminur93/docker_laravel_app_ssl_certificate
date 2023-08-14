#!/bin/bash

AppVersion="1.0.0"
DockerHubUser="weetekhub"
DockerHubRepoName="laravel-app"
DockerHubRepository="${DockerHubUser}/${DockerHubRepoName}"
#
docker login --password weehub!tech --username ${DockerHubUser}
###

BackendService="laravel-service"

# Build the Docker image
docker image build --no-cache -f Dockerfile -t ${BackendService}:${AppVersion} .

# Tag the Docker image with the specified version or tag
#docker tag $DockerHubUser/$DockerHubRepoName: $DOCKERHUB_USERNAME/$REPO_NAME:$VERSION
docker image tag ${BackendService}:${AppVersion} ${DockerHubRepository}:${BackendService}-${AppVersion}


# Push the Docker image to DockerHub
#docker push $DOCKERHUB_USERNAME/$REPO_NAME:$VERSION
docker push ${DockerHubRepository}:${BackendService}-${AppVersion}


###
# BackendService="wetelly-service"
# echo "Creating ${BackendService} Image"
# docker image build --no-cache Dockerfile ${BackendService}:${AppVersion}
# docker image tag ${BackendService}:${AppVersion} ${DockerHubRepository}:${BackendService}-${AppVersion}
# docker push ${DockerHubRepository}:${BackendService}-${AppVersion}
#

###End-Of-File###