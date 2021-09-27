FROM ubuntu:18.04
 
RUN apt-get update -y &&  apt-get install -y build-essential libglib2.0-dev ncurses-dev curl

WORKDIR /tmp

RUN curl -L https://downloads.sourceforge.net/project/silc/silc/client/sources/silc-client-1.1.11.tar.gz | tar xzf -

RUN cd silc-client-1.1.11 && ./configure && make -j && make install

RUN adduser --system -q silc
RUN mkdir /home/silc/.silc && chown silc: /home/silc/.silc

VOLUME /home/silc/.silc

USER "silc"
ENTRYPOINT [ "silc" ]
