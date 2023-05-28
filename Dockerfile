
FROM node:18.12.1
RUN apt-get update && apt-get install libvips-dev -y
ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}
WORKDIR /opt/
COPY ./package.json ./yarn.lock ./
ENV PATH /opt/node_modules/ .bin:$PATH
RUN npm config set network-timeout 600000 -g && npm install

WORKDIR /opt/app
COPY . .
RUN chown -R node:node /opt/app/public/uploads
RUN chown -R node:node /opt/app
USER node
RUN ["npm", "run", "build"]
EXPOSE 1337
CMD ["npm", "run", "develop"]
