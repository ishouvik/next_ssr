FROM node:8.11.3-alpine
LABEL maintainer="Shouvik Mukherjee <contact@ishouvik.com>"

# Setup system packages
RUN apk update
# RUN apk add mysql-dev nodejs tzdata bash build-base

# Setup workdir
RUN mkdir /app
WORKDIR /app

# Install gems
ADD package.json /app/package.json
ADD yarn.lock /app/yarn.lock
RUN yarn

# Add all application files to workdir
ADD . /app

# Expose server port
EXPOSE 3000
