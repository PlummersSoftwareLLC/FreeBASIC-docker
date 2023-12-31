FROM ubuntu:22.04

SHELL ["/bin/bash", "-c"]

RUN apt-get update -qq \
    && apt-get install -y gcc libncurses5-dev libffi-dev libgl1-mesa-dev libx11-dev libxext-dev libxrender-dev libxrandr-dev libxpm-dev

ENV FREEBASIC_VERSION=FreeBASIC-1.10.1-ubuntu-22.04

ADD ${FREEBASIC_VERSION}-x86_64.tar.xz /fbc-install
ADD ${FREEBASIC_VERSION}-aarch64.tar.xz /fbc-install

RUN ARCH=$(uname -m) && mv /fbc-install/${FREEBASIC_VERSION}-${ARCH} /fbc-install/selected-arch

WORKDIR /fbc-install/selected-arch
RUN ./install.sh -i

WORKDIR /
RUN rm -rf /fbc-install
