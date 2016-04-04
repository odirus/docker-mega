FROM ubuntu:14.04
MAINTAINER odirus "odirus@163.com"
RUN apt-get update
RUN apt-get install git -y
RUN apt-get install libtool libglib2.0-dev gobject-introspection libgmp3-dev nettle-dev asciidoc glib-networking libssl-dev libcurl4-openssl-dev  -y
ADD megatools-1.9.97.tar.gz /root
#RUN cd /root && tar -xzvf  megatools-1.9.97.tar.gz
RUN cd /root/megatools-1.9.97 && ./configure --disable-shared --enable-static && make && make install
RUN mkdir -p /root/mega-downloads
ADD start.sh /root/start.sh
ENTRYPOINT ["/bin/bash", "/root/start.sh"]


