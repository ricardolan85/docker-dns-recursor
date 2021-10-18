FROM ubuntu:20.04

RUN apt-get update \ 
  && apt-get install -y pdns-recursor \
  && rm -rf /var/lib/apt/lists/* 

EXPOSE 53/udp

ENTRYPOINT ["/usr/sbin/pdns_recursor"]
