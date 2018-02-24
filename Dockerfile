FROM openjdk:latest
RUN apt-get update && apt-get install -y build-essential

ARG version=latest
RUN curl -s 'https://nodejs.org/dist/'${version}'/'$( curl -s 'https://nodejs.org/dist/'${version}'/' | grep '"node-.*-linux-x64.tar.xz"' | awk -F'"' '{ print $2 }' ) | tar xvfJ - --strip-components=1 -C /usr/local && node --version

## CI User
RUN useradd -ms /bin/bash ci && adduser ci sudo
USER ci
WORKDIR /home/ci
