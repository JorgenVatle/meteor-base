#!/usr/bin/env bash

source ./config.sh
source ./support.sh

for version in "${meteor_versions[@]}"; do
	printf "${GREEN}Pushing Docker base image for Meteor ${version}...${NC}\n"
	if ! docker push "$IMAGE_NAME:${version}"; then
		printf "${RED}Error pushing Docker base image for Meteor ${version}${NC}\n"
		exit 1
	fi
done
if ! docker push "$IMAGE_NAME:latest"; then
	printf "${RED}Error pushing Docker base image for Meteor (latest version)${NC}\n"
	exit 1
fi
printf "${GREEN}Success pushing Docker base images for all supported Meteor versions\n"
