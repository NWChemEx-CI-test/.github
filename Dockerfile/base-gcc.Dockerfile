ARG UBUNTU_VERSION

FROM ubuntu:${UBUNTU_VERSION}

ARG GCC_VERSION

# Install basic tools
RUN    apt-get update \
        && DEBIAN_FRONTEND=noninteractive apt-get install -y \
                git \
                wget \
                pip \
                gcc-${GCC_VERSION} \
                g++-${GCC_VERSION} \
                ninja-build \
                libxml2-dev \
                libxslt-dev \
                python3-dev \
                docker.io \
        && apt-get clean \
        && pip install gcovr \
        && pip install cppyy \
        && rm -rf /var/lib/apt/lists/*

LABEL maintainer="NWChemEx-Project" \
      description="Basic building environment for ParallelZone based on the ubuntu 20.04 image." \
      gcc_version=${GCC_VERSION}
