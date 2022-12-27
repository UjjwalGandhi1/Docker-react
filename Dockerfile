FROM node:19-alpine as builder
WORKDIR '/app'
RUN apk update
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html