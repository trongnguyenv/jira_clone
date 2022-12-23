# Build
FROM node:10.17.0 as builder
RUN mkdir -p /source
WORKDIR /source
COPY . .
RUN npm install
# RUN NODE_ENV=production $(npm bin)/webpack --config webpack.config.production.js
RUN NODE_ENV=development $(npm bin)/webpack --config webpack.config.production.js

# Run
FROM node:alpine3.12
ENV HOST 0.0.0.0

RUN mkdir -p /app
WORKDIR /app

COPY --from=builder /source /app
RUN cd /app
RUN npm install

EXPOSE 3000
CMD ["npm","start"]

