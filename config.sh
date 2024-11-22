#!/usr/bin/env bash

export IMAGE_NAME=geoffreybooth/meteor-base

# Versions to build this Docker image for
export meteor_versions=(
	'1.9'
	'1.9.1'
	'1.9.2'
	'1.9.3'
	# '1.10' \ # Not hosted
	'1.10.1'
	'1.10.2'
	'1.11'
	'1.11.1'
	'1.12'
	'1.12.1'
	'2.0'
	'2.1'
	'2.1.1'
	'2.2'
	'2.2.1'
	'2.2.2'
	'2.2.3'
	'2.2.4'
	'2.3'
	'2.3.1'
	'2.3.2'
	'2.3.3'
	'2.3.4'
	'2.3.5'
	'2.3.6'
	'2.3.7'
	'2.4'
	'2.5'
	# '2.5.1' \ # Fibers is missing binaries
	# '2.5.2' \ # Fibers is missing binaries
	# '2.5.3' \ # Fibers is missing binaries
	# '2.5.4' \ # Fibers is missing binaries
	# '2.5.5' \ # Fibers is missing binaries
	'2.5.6'
	'2.5.7'
	'2.5.8'
	'2.6'
	'2.6.1'
	'2.7'
	'2.7.1'
	'2.7.2'
	'2.7.3'
	'2.8.0'
	'2.8.1'
	'2.9.0'
	'2.9.1'
	'2.10.0'
	'2.11.0'
	'2.12'
	'2.13'
	'2.13.1'
	'2.13.3'
	'2.14'
	'2.15'
	'2.16'
	'3.0.1'
	'3.0.2'
	'3.0.3'
	'3.0.4'
	'3.1'
)

# Allow override through environment variable
if [ -n "$METEOR_VERSION" ]; then
  meteor_versions=("$METEOR_VERSION")
fi