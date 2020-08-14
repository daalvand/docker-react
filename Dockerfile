#docker build multi-stage
FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build 

FROM nginx:latest
WORKDIR /usr/share/nginx/html
COPY --from=builder /app/build .
