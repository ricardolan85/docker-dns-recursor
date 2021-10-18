FROM ubuntu:20.04

RUN apt-get update \ 
  && apt-get install -y pdns-recursor \
  && rm -rf /var/lib/apt/lists/* 
  
ARG CONFIG=/etc/powerdns/recursor.conf

RUN sed -i -E "s,(^local-address=)(.*),\10.0.0.0,g" $CONFIG
RUN sed -i -E "s,(^# allow-from=)(.*),allow-from=,g" $CONFIG
RUN sed -i -E "s,(^allow-from=)(.*),\1127.0.0.0/8\,138.94.52.0/22\,170.231.184.0/22,g" $CONFIG

EXPOSE 53/udp

ENTRYPOINT ["/usr/sbin/pdns_recursor"]
