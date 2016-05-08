FROM devchef/delivery_web_base
MAINTAINER Chef Software, Inc. <docker@chef.io>

ENV DISPLAY :99
ENV CHROME_BIN /usr/bin/google-chrome

COPY xvfb-chromium /usr/bin/xvfb-chromium
RUN ln -s /usr/bin/xvfb-chromium /usr/bin/google-chrome
RUN ln -s /usr/bin/xvfb-chromium /usr/bin/chromium-browser

RUN \
  apt-get install -y chromium xvfb default-jdk && \
  npm install -g jshint
