# build stage
FROM node:9.11.1-alpine as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# production stage
FROM node:9.11.1-alpine as production-stage
WORKDIR /app
COPY --from=build-stage /app /app
EXPOSE 4000
CMD ["node", "server.js"]