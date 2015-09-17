From ubuntu:trusty
MAINTAINER bjasko@bring.out.ba


ENV DEBIAN_FRONTEND noninteractive
ENV OPENFIRE_VERSION=3.10.2 \
    OPENFIRE_USER=openfire \
    OPENFIRE_DATA_DIR=/var/lib/openfire \
    OPENFIRE_LOG_DIR=/var/log/openfire



RUN sed -e 's/archive./ba.archive./' /etc/apt/sources.list -i \
 && apt-get update -y \
 && apt-get install -y openjdk-7-jre wget \
 && wget "http://download.igniterealtime.org/openfire/openfire_${OPENFIRE_VERSION}_all.deb" -O /tmp/openfire_${OPENFIRE_VERSION}_all.deb  \
 && dpkg -i /tmp/openfire_${OPENFIRE_VERSION}_all.deb \
 && mv /var/lib/openfire/plugins/admin /usr/share/openfire/plugin-admin  \
 && rm -rf /tmp/openfire_${OPENFIRE_VERSION}_all.deb \
 && rm -rf /var/lib/apt/lists/*


ADD start.sh /start.sh

RUN chmod +x /start.sh

CMD /start.sh
