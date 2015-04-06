FROM phusion/baseimage

RUN apt-get update && apt-get install -y git build-essential libssl-dev &&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN git clone git://github.com/sstephenson/rbenv.git ~/.rbenv                    && \
    git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

ADD rbenv.sh /tmp/rbenv.sh
RUN cd /tmp && sh rbenv.sh

ENV HOME /root

