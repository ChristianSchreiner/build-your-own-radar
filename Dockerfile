<<<<<<< HEAD
FROM node:8.1.0

ENV APPDIR /usr/src/app

RUN mkdir -p $APPDIR
WORKDIR $APPDIR

COPY package.json $APPDIR
RUN npm -q install

COPY . $APPDIR

EXPOSE 8080
CMD ["npm", "run", "dev"]
=======
FROM node:7.10.1 as source
WORKDIR /src/build-your-own-radar
COPY package.json ./
RUN npm install
COPY . ./
RUN npm run build

FROM nginx:1.13.5
WORKDIR /opt/build-your-own-radar
COPY --from=source /src/build-your-own-radar/dist .
COPY default.template /etc/nginx/conf.d/default.template
CMD /bin/bash -c "envsubst < /etc/nginx/conf.d/default.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"
>>>>>>> upstream/master
