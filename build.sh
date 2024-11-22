#!/usr/bin/env bash

source ./config.sh
source ./support.sh

build_cmd() {
	docker build --build-arg "METEOR_VERSION=$1" --tag "$IMAGE_NAME:$1" ./src
}

build() {
	build_cmd "$1"
}

building_all_versions=true
if [ -n "${CI_VERSION:-}" ]; then
	meteor_versions=( "${CI_VERSION:-}" )
	building_all_versions=false
elif [[ "${1-x}" != x ]]; then
	meteor_versions=( "$1" )
	building_all_versions=false
fi


for version in "${meteor_versions[@]}"; do
	printf "${GREEN}Building Docker base image for Meteor ${version}...${NC}\n"
	if ! build $version; then
		printf "${RED}Error building Docker base image for Meteor ${version}${NC}\n"
		exit 1
	fi
done

if [[ $building_all_versions ]]; then
	docker tag $IMAGE_NAME:"${version}" $IMAGE_NAME:latest
	printf "${GREEN}Success building Docker base images for all supported Meteor versions\n"
else
	printf "${GREEN}Success building Docker base images for Meteor versions ${meteor_versions}\n"
fi
