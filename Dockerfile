FROM openjdk:8-slim-buster

RUN apt-get update && \
    apt-get install -y --no-install-recommends apt-utils && \
    apt-get install -y build-essential apt-transport-https ca-certificates curl gnupg2 software-properties-common tar && \
    apt-get clean && \
    apt-get autoremove

## Install Node
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs

# Neustes npm & npx
RUN npm install -g npm@latest npx@latest node-gyp --force --verbose

## emundo User
RUN addgroup --gid 999 aws && \
    # Für die AWS brauchen wir diese Gruppe
    useradd -ms /bin/bash emundo && \
    adduser emundo sudo && \
    # Das ist notwendig, damit das Image in RancherOS funktioniert
    usermod -aG 999 emundo && \
    # Das ist notwendig, damit das Image lokal funktioniert
    usermod -aG root emundo

USER emundo
WORKDIR /home/emundo
