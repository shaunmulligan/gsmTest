FROM resin/intel-nuc-debian:latest

ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND noninteractive

RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends \
  gtk2-engines \
  libswt-gtk-3-java \
  libxtst6 libxxf86vm1  \
  freeglut3 libxslt1.1 libcanberra-gtk-module  \
  apt-utils  \
  clang \
  xserver-xorg-core xserver-xorg-input-all xserver-xorg-video-fbdev \
  xorg \
  libdbus-1-dev \
  libgtk2.0-dev \
  libnotify-dev \
  libgnome-keyring-dev \
  libgconf2-dev \
  libasound2-dev \
  libcap-dev \
  libcups2-dev \
  libxtst-dev \
  libxss1 \
  libnss3-dev \
  fluxbox \
  libsmbclient \
  libssh-4 \
  fbset \
  libexpat-dev && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

# /app - this is default resin app
WORKDIR /app
ENV INITSYSTEM on
COPY entry.sh /usr/bin/entry.sh  
COPY run.sh .

CMD ["bash", "/app/run.sh"]