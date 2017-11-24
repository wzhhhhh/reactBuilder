# buildReact
FROM ubuntu:14.04
MAINTAINER scientihark

# Commands
ADD sources.list.trusty /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y python2.7 git wget build-essential
RUN \
  wget -O '/tmp/node-v6.11.0-linux-x64.tar.gz' "https://npm.taobao.org/mirrors/node/v6.11.0/node-v6.11.0-linux-x64.tar.gz" && \
  tar --strip-components=1 -xvf '/tmp/node-v6.11.0-linux-x64.tar.gz' -C /usr/local && \
  apt-get autoremove -y && \
  apt-get clean all

RUN ln -s /usr/bin/python2.7 /usr/bin/python
RUN mkdir -p /srv/var
RUN cd /srv/var/ &&/usr/local/bin/npm install -g webpack gulp -d --registry=https://registry.npm.taobao.org
ADD package.json /srv/var
RUN cd /srv/var/ &&/usr/local/bin/npm install -d --registry=https://registry.npm.taobao.org
RUN rm /srv/var/package.json
#RUN cd /srv/var/ &&/usr/local/bin/npm install react-router-dom jsonp es5-shim console-polyfill marked gulp-template uglifyjs-webpack-plugin html-loader markdown babel-polyfill flux jquery react react-dom react-redux react-router redux babel-core babel-loader babel-preset-es2015 babel-preset-react babel-preset-stage-0 browser-sync css-loader express extract-text-webpack-plugin gulp-connect gulp-webserver html-webpack-plugin http-proxy-middleware node-sass prop-types react-hot-loader@next sass-loader style-loader webpack gulp-uglify gulp-minify-css pump gulp-git gulp-version-number gulp url-loader file-loader html-withimg-loader uglifyjs-webpack-plugin babel-jest eslint eslint-plugin-react jest jest-css-modules react-test-renderer regenerator-runtime  copy-webpack-plugin webpack-dev-server  babel-plugin-transform-decorators-legacy -d --save --registry=https://registry.npm.taobao.org

ADD buildRelease.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/buildRelease.sh
RUN ln -s /usr/local/bin/buildRelease.sh /usr/bin/buildRelease

ADD buildDebug.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/buildDebug.sh
RUN ln -s /usr/local/bin/buildDebug.sh /usr/bin/buildDebug

ADD buildDev.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/buildDev.sh
RUN ln -s /usr/local/bin/buildDev.sh /usr/bin/buildDev
