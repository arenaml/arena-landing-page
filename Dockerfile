FROM node:18.7.0-alpine as builder
WORKDIR /app
COPY . .
RUN npm i
RUN npm run build

FROM nginx
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/dist /usr/share/nginx/html
EXPOSE 3000