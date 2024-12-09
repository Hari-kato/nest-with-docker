FROM node:alpine AS deps

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install
