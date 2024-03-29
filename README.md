# rTail Server Docker Container (view log events in real time from a web browser)


rTail is a realtime debugging and monitoring tool, which can display multiple aggregate streams via a modern web interface. 
rTail is a command line utility that send every line in stdin and broadcasts it over UDP. 
UDP is stateless and is used instead of TCP because has better performance.

There is no persistent layer, nor does the tool store any data.

This Docker Container exposes a Web Server in the 8181 port and listen on 9191 port for UDP traffic.
For further information, check out the [project webpage](https://github.com/anmolnagpal/docker-rtail).

Both 8181 and 9191 ports are open without authentication. The recomendation is to apply some filter rule in the Firewall.

![rTail Server - Tailing log events from a web browser](https://www.dropbox.com/s/c0527ggtvndrh20/chilcano-logs-rtail-microservices-2-ping-tail.png?raw=1 "rTail Server - Tailing log events from a web browser")

__rTail Server__
* HTTP Port (view logs): 8181
* UDP Port (receive logs): 9191
* URL: [http://localhost:8181](http://localhost:8181)


## 1. Getting started

```bash
$ git clone https://github.com/anmolnagpal/docker-rtail.git

$ cd docker-rtail

// Build image
$ docker build --rm -t anmolnagpal/rtail .

// Run container
$ docker run -d -t --name=rtail -p 8181:8181 -p 9191:9191/udp anmolnagpal/rtail
```

__Check the rTail Server__

Just open the rTail Server Web Console from a browser with this URL `http://<IP_ADDRESS_RTAIL_CONTAINER>/8181`.
But if you want check if rTail Server Container is reacheable remotely (from other VM), just execute this:

```bash
// Use NetCat instead of Telnet because Telnet doesn't use UDP
$ nc -v -u -z -w 3 <IP_ADDRESS_RTAIL_CONTAINER> 9191
Connection to 192.168.99.100 9191 port [udp/*] succeeded!
```

To stop, start or restart rTail Server just stop, start or restart the Docker container

__Get Shell access to rTail Server Container__

```bash
$ docker exec -i -t rtail bash
```

## 2. Send log events to rTail Server Docker Container

You can send any type of log events, from a syslog event, an echo message or a log by tailing. Before, you have to install rTail application again in the You can send any type of log events, from a syslog event, an echo message or a log by tailing. Before, you have to install rTail application again in the box/VM from where you want send log events.


For example, to send the `ping` traces, execute the next:

```bash
// Send Ping events to IP addres
$ ping 192.168.99.100 | rtail --id pinging --host 192.168.99.100 --port 9191 --mute
```

```bash
// Tailing a log file
$ tail -f /opt/wiremock/wiremock.log | rtail --id wiremock --host 192.168.99.100 --port 9191 --mute
```

