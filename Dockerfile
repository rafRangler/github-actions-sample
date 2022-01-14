
# Get package from docker-hub
FROM node:16.13.1-buster

# Set our working directory to /code
WORKDIR /code

# Copy package.json and package-lock.json into working directory /code
COPY my-app/package.json package.json
COPY my-app/package-lock.json package-lock.json

# Install packages 
RUN npm install

# Copy all files from local directory into /code directory
COPY /src /code

# Docker runs this command 
CMD ["npm", "run", "start"]

