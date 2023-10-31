FROM node:20-alpine AS node
WORKDIR /usr/src/app
RUN apk --no-cache --virtual build-dependencies add \
  git \
  python3 \
  make \
  g++

FROM node AS base
COPY package*.json tsconfig.build.json ./

FROM base AS build
RUN npm ci
COPY . .
RUN npm run build

FROM base AS dependencies
RUN npm ci --omit=dev --ignore-scripts

FROM node AS release
COPY --from=build /usr/src/app/dist .
COPY --from=dependencies /usr/src/app/node_modules ./node_modules
COPY --from=dependencies /usr/src/app/package.json .
CMD node main.js
