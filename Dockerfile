FROM openjdk:latest
RUN apt-get update && apt-get install -y build-essential

ARG version=latest
RUN curl -s 'https://nodejs.org/dist/'${version}'/'$( curl -s 'https://nodejs.org/dist/'${version}'/' | grep '"node-.*-linux-x64.tar.xz"' | awk -F'"' '{ print $2 }' ) | tar xvfJ - --strip-components=1 -C /usr/local && node --version

RUN id -u "nobody" &>/dev/null || useradd "nobody"
RUN mkdir -p /home/nobody && chown nobody /home/nobody
RUN mkdir -p /builds && chown nobody /builds
USER nobody
