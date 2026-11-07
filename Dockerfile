FROM ubuntu:resolute

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    wget \
    tar \
    sudo \
    git \
    python3 \
    python3-pip \
    python3-venv \
    x11-apps \
    gv \
    libxkbcommon-x11-0 \
    mesa-utils

RUN echo "ubuntu ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers

WORKDIR /app

RUN chown -R ubuntu:ubuntu /app

USER ubuntu

RUN wget https://github.com/YosysHQ/oss-cad-suite-build/releases/download/2026-11-07/oss-cad-suite-linux-x64-20261107.tgz
RUN tar -zxvf oss-cad-suite-linux-x64-*.tgz

ENV PATH="/app/oss-cad-suite/bin:$PATH"
