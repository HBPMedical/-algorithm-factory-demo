FROM ubuntu:xenial-20170619
MAINTAINER Arnaud Jutzeler <arnaud.jutzeler@chuv.ch>

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y httpie

#COPY test.sh /root/test.sh

ENTRYPOINT ["http"]