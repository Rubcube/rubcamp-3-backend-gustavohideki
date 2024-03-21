FROM --platform=linux/amd64 node:18-slim

# Create app directory
WORKDIR /usr/src/app

# Bundle app source
COPY . .

# COPY .env
# COPY .env.docker.example .env

# Install app dependencies
RUN yarn install

RUN npm install -g
RUN npm install prisma @prisma/client
RUN apt-get update && apt install -y openssl
RUN yarn install

EXPOSE 3344
EXPOSE 5555

CMD [ "yarn", "start" ]
