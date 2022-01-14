# Label node package as build
FROM node:16.13.1-buster as build

# Set our working directory to /code
WORKDIR /code

# Copy package.json and package-lock.json into working directory /code
COPY package.json package.json
COPY package-lock.json package-lock.json

RUN npm ci --production

# Copy all files from local directory into /code directory
COPY . . 

# Docker runs this command 
RUN npm run build 

# NGINX Web Server
FROM nginx:1.12-alpine as prod

# Only copy files that were in buil (--from=build is the label for the first stage) and place them into nginx container
COPY --from=build /code/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "g", "daemon off;"]




