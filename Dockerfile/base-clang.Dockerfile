ARG PARENT_IMAGE_NAME

FROM ${PARENT_IMAGE_NAME}:latest

ARG CLANG_VERSION

# install clang
RUN    apt-get update \
        && DEBIAN_FRONTEND=noninteractive apt-get install -y \
                clang-${CLANG_VERSION} \
                libc++-${CLANG_VERSION}-dev \
                libc++abi-${CLANG_VERSION}-dev 
