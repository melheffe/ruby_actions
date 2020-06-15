FROM ruby:2.3.7

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

RUN apt-get update && apt-get install -y \
	streamer1.0-plugins-base \
	gstreamer1.0-tools \
	gstreamer1.0-x \
	xvfb \
  	libpq-dev \
  	imagemagick \
  	nodejs

RUN \
    # install google chrome latest
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' && \
    apt-get update && apt-get install google-chrome-stable --assume-yes
  
RUN \
    # bundler configurations
    bundle config build.nokogiri "--use-system-libraries" && \
    bundle config github.com KipuDevGemsUser:dNsEPTUWMbTumnphFmtjjGb9tKKbtmxT8 && \
    bundle config enterprise.contribsys.com aa8ac900:18a34bbd

ENTRYPOINT ["/entrypoint.sh"]
