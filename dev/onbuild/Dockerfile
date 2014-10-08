FROM node:0.10.32

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD ADD package.json /usr/src/app/
ONBUILD RUN npm install

ONBUILD ADD bower.json /usr/src/app/
ONBUILD ADD .bowerrc /usr/src/app/
ONBUILD RUN bower install
RUN npm install -g bower

ONBUILD ADD . /usr/src/app

CMD [ "npm", "start" ]

