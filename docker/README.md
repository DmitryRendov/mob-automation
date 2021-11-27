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

### Games specific settings

## 7DTD
You should download 7dtd game from the Steam:
- Create a new folder ~/.steam/7dtd
- Comment out one line in the docker-compose config file
```sh
    environment:
      STEAMCMD_APP_ID: "294420"
      #STEAMCMD_SKIP: "true"
      USER_UID: "1000"
      USER_GID: "1000"
```
- Run docker-compose just to download the binaries for the first time
```sh
$ docker-compose up 7dtd
```
- Enable the line in the docker-compose file back
- Create a log folder in the Data volume
```sh
$ mkdir ~/.steam/7dtd/data/Logs
```
- Run 7DTD as a service
```sh
$ docker-compose start 7dtd
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

