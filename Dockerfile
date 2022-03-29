
#FROM node:16
FROM node:lts-alpine@sha256:60ef0bed1dc2ec835cfe3c4226d074fdfaba571fd619c280474cc04e93f0ec5b
# Create app directory
WORKDIR /app


# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# If you are building your code for production
# RUN npm ci --only=production
RUN npm ci --only=production

# Bundle app source
#COPY . .
COPY --chown=node:node . .

EXPOSE 3001
USER node
CMD [ "node", "app.js" ]
