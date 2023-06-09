FROM ghcr.io/yzhang-23/build_parallelzone:v1
LABEL maintainer="NWChemEx-Project" \
      description="Basic building environment for PluginPlay based on the ubuntu 20.04 image."

RUN    apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
		libboost-all-dev \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

ARG libfort_version=0.4.2

ENV INSTALL_PATH=`pwd`/install

RUN wget --no-check-certificate --content-disposition https://codeload.github.com/seleznevae/libfort/tar.gz/refs/tags/v${libfort_version} \
    && tar -zxf libfort-${libfort_version}.tar.gz \
    && cd libfort-${libfort_version} \
    && cmake -GNinja -H. -Bbuild -DCMAKE_INSTALL_PREFIX=${INSTALL_PATH} \
    && cmake --build build --target install

ENV PATH="`pwd`/install:${PATH}"
