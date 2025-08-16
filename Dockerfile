# syntax=docker/dockerfile:1.4

# hadolint ignore=DL3006
FROM ghcr.io/games-on-whales/base-app:edge

ARG DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    kdialog

# Cleanup
RUN apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* &&

COPY --chmod=777 ./startup.sh /opt/gow/startup-app.sh

WORKDIR /home/retro
RUN chown -R 1000:1000 /home/retro

USER root
RUN mkdir /tmp/.X11-unix
RUN chmod 1777 /tmp/.X11-unix
ENV XDG_RUNTIME_DIR=/tmp/.X11-unix

ARG IMAGE_SOURCE
LABEL org.opencontainers.image.source=$IMAGE_SOURCE