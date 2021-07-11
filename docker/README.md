# MOB Docker containers

Below are dockerized games and home services like:
- phpmyadmin
- minidnla
- 7dtd
- starbound

### Docker build info

First clone the repo
```sh
$ git clone git@github.com:DmitryRendov/mob-automation.git mob-automation
$ cd mob-automation/docker
```

Second, (re)build docker images:

```sh
$ docker build -t starbound .
```

Third, run services using docker-compose in detached mode:
```sh
$ docker-compose up -d starbound
$ 
```

### Firewalld

Dont forget to open ports in the firewall:
```sh
$ sudo firewall-cmd --permanent --add-port=25565/tcp
$ sudo firewall-cmd --permanent --add-port=21025/tcp
$ sudo firewall-cmd --permanent --add-port=8123/tcp
$ sudo firewall-cmd --reload
$ sudo firewall-cmd --list-all
```

Also, you might face Centos 8 networking issue -- use masquerade mode
or set docker0 to trusted (this will open all the ports published by docker):
```sh
$ sudo firewall-cmd --zone=public --add-masquerade --permanent
$ sudo firewall-cmd --zone=trusted --add-interface=docker0 --permanent
$ sudo firewall-cmd --reload
$ sudo firewall-cmd --list-all
```


### License
----

MIT

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job.)

   [mob-automation]: <https://github.com/DmitryRendov/mob-automation>
   [mob-server]: <https://github.com/DmitryRendov/mob-server>
   [mob-site]: <https://github.com/DmitryRendov/mob-site>

