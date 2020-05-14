FROM ruby:2.3.7

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

RUN apt-get update && apt-get install -y \
	qt5-default \
	libqt5webkit5-dev \
	streamer1.0-plugins-base \
	gstreamer1.0-tools \
	gstreamer1.0-x \
	xvfb \
  libpq-dev \
  imagemagick \
  nodejs

RUN \
    # bundler configurations
    bundle config build.nokogiri "--use-system-libraries" && \
    bundle config github.com KipuDevGemsUser:dNsEPTUWMbTumnphFmtjjGb9tKKbtmxT8 && \
    bundle config enterprise.contribsys.com aa8ac900:18a34bbd

ENTRYPOINT ["/entrypoint.sh"]
