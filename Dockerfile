FROM ruby:2.3.7-alpine3.8
LABEL Description="Lets test it"

RUN apk --update add \
  linux-headers \
  git \
  build-base \
  nodejs \
  tzdata \
  postgresql-dev \
  postgresql-client \
  libxslt-dev \
  libxml2-dev \
  imagemagick \
  chromium-chromedriver\
  zlib-dev \
  chromium \
  xvfb \
  wait4ports \
  xorg-server \
  dbus \
  ttf-freefont \
  mesa-dri-swrast \
  udev \
  less

RUN \
    # bundler confidurations
    bundle config build.nokogiri "--use-system-libraries" && \
    bundle config github.com KipuDevGemsUser:dNsEPTUWMbTumnphFmtjjGb9tKKbtmxT8 && \
    bundle config enterprise.contribsys.com aa8ac900:18a34bbd && \
    # Ruby and Rails configuration and dependencies
    gem install bundler -v 1.17.3 \ 
    /bin/sh -c QMAKE=/usr/lib/qt5/bin/qmake gem install capybara-webkit

ENTRYPOINT ["entrypoint.sh"]
