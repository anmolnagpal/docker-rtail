FROM node:7.10.0
MAINTAINER Anmol Nagpal <ianmolnagpal@gmail.com>

ENV RTAIL_SERVER_PORT_WEB=8181
ENV RTAIL_SERVER_PORT_UDP=9191
ENV RTAIL_LISTEN_IP=0.0.0.0



RUN npm install -g rtail

RUN apt-get update
RUN  apt-get install -yq --no-install-recommends netcat
RUN apt-get clean && rm -rf /var/cache/apt/* /var/lib/apt/lists/* 
EXPOSE ${RTAIL_SERVER_PORT_WEB} ${RTAIL_SERVER_PORT_UDP} 8182 9192

CMD rtail-server --wh ${RTAIL_LISTEN_IP} --wp ${RTAIL_SERVER_PORT_WEB} --uh ${RTAIL_LISTEN_IP} --up ${RTAIL_SERVER_PORT_UDP}
