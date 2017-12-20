FROM mhart/alpine-node:6
ADD package.json /tmp/package.json
RUN apk add --no-cache make gcc g++ python && \
  cd /tmp && npm install --production --silent && \
  apk del make gcc g++ python
RUN mkdir -p /opt/app && cp -a /tmp/node_modules /opt/app/
WORKDIR /opt/app
ADD . /opt/app
EXPOSE 31234
CMD ["node", "index.js"]