FROM node:0.12.9
MAINTAINER Anmol Nagpal <ianmolnagpal@gmail.com>

ENV RTAIL_SERVER_PORT_WEB=8181
ENV RTAIL_SERVER_PORT_UDP=9191
ENV RTAIL_LISTEN_IP=0.0.0.0

EXPOSE ${RTAIL_SERVER_PORT_WEB} ${RTAIL_SERVER_PORT_UDP} 8182 9192

RUN npm install -g rtail

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends netcat
RUN apt-get clean && rm -rf /var/cache/apt/* /var/lib/apt/lists/* 

CMD rtail-server --wh ${RTAIL_LISTEN_IP} --wp ${RTAIL_SERVER_PORT_WEB} --uh ${RTAIL_LISTEN_IP} --up ${RTAIL_SERVER_PORT_UDP}
