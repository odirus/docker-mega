FROM ubuntu:14.04
MAINTAINER odirus "odirus@163.com"
RUN apt-get update
RUN apt-get install git -y
RUN apt-get install libtool libglib2.0-dev gobject-introspection libgmp3-dev nettle-dev asciidoc glib-networking
ADD megatools-1.9.94.tar.gz /root/megatools-1.9.94.tar.gz
RUN cd /root && tar -xzvf  megatools-1.9.94.tar.gz
RUN cd /root/megatools-1.9.94 && ./configure --disable-shared && make && make install


