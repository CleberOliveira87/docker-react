FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx

# for AWS beanstalk use
EXPOSE 80 

COPY --from=0 /app/build /usr/share/nginx/html
# nginx image has the default command to start the server, so no need for us to do it here
