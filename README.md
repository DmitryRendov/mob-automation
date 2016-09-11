# MOB CI/CD repo

This is CI/CD repo for MOB project, which includes main server roles like:
- Ansible master
- MOB game server (screen approach)
- MOB site

Written in yaml code for Ansible 2.0+ Feel free to get more familiar with this pretty automation tool on the official site - [Ansible]

### Version
1.3.0

### Tech

* [Ansible] - continuous delivery tool

And of course MOB provision itself is open source with a [public repository] [pubrep]
 on GitHub.

### MOB server initial provision

First, checkout the automation repo:
```sh
$ git clone git@github.com:DmitryRendov/mob-automation.git mob-automation
$ cd mob-automation/ansible
```

Don’t forget to place a deployment key `id_rsa_mobdeploy.pem` into the mob-server-provision role folder 
`~/mob-automation/ansible/roles/mob-server-provision/files`

Second, you need Ansible installed globally on Ansible node, by the following playbook playing:

```sh
$ ansible-playbook -i ./inventory/dev ansbile-node-configure.yml --extra-vars "env=ansible" -vv
```

Third, you should install common packages and Java 8 on MOB server:
```sh
$ ansible-playbook -i ./inventory/live common.yml --extra-vars "env=mob-server env_type=live" -vv
$ ansible-playbook -i ./inventory/live java.yml --extra-vars "env=mob-server java_version=1.8" -vv
$ ansible-playbook -i ./inventory/live mysql.yml --extra-vars "env=mob-server" -vv
```

Last step - MOB server initial provisioning and configuration:
```sh
$ ansible-playbook -i ./inventory/live mob-server-provision.yml --extra-vars "env=mob-server env_type=live" -vv
```

### MOB server update

In case of new release deploy - you need to merge all the changes to [mob-server] repo and play the provision playbook with the following options:
```sh
ansible-playbook -i ./inventory/live mob-server-provision.yml --extra-vars "env=mob-server password=Secret_DB_Pass cooldown=10 env_type=live" -vv
```
where:
- password - a custom database password passed as a param;
- cooldown - pause before the game servers shout down with a special notification for players regarding planned maintenance;
- env_type - should be `live` to avoid worlds and players data reset (be careful).

### MOB site deployment

MOB site is a part of game server and located in this GitHub repo - [mob-site]
```sh
$ ansible-playbook -i ./inventory/live mob-site-deploy.yml --extra-vars "env=mob-site env_type=live" -vv
```

### License
----

MIT

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job.)

   [pubrep]: <https://github.com/DmitryRendov/mob-automation>
   [Ansible]: <https://www.ansible.com/>
   [dockerlnk]: <https://www.docker.com/>
   [mob-server]: <https://github.com/DmitryRendov/mob-server>
   [mob-site]: <https://github.com/DmitryRendov/mob-site>

