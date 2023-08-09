#!/bin/sh

# Wraps the process for building the base image with gcc
#
# Usage:
#   base_image_gcc.sh
#
# Other variables:
#   gcc_version: the major version of gcc being used
#

set -e # Exit with error if any command fails

docker build -t base-gcc:latest -f Dockerfile/base-gcc.Dockerfile . --build-arg GCC_VERSION=${gcc_version} --build-arg UBUNTU_VERSION=${ubuntu_version}
