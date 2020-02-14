FROM openjdk:8-slim-buster

RUN apt-get update && apt-get install -y ca-certificates curl tar && apt-get clean

## Install Node
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs

# Neustes npm & npx
RUN npm install -g npm@latest npx@latest --force
