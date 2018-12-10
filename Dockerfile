FROM node:8-alpine
MAINTAINER Simon Ball<simon.ball@aencoin.com>
EXPOSE 3000

COPY server /var/www/html

WORKDIR /var/www/html

RUN apk --update add \
  cmake \
  g++ \
  make \
  python \
  zeromq-dev \
  && npm i -g yarn \
  && yarn install \
  && yarn rebuild

CMD ["/usr/local/bin/npm", "start"]
