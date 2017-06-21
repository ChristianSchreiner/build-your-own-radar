FROM node:8.1.0

ENV APPDIR /usr/src/app

RUN mkdir -p $APPDIR
WORKDIR $APPDIR

COPY package.json $APPDIR
RUN npm -q install

COPY . $APPDIR

EXPOSE 8080
CMD ["npm", "run", "dev"]
