# Private Automation repo

Automation repo for the MOB project
- Ansible
- MOB game server (screen approach)
- MOB web-site

Written in yaml code for [Ansible]

### Version
2.0.0

### MOB server initial provision

Checkout the repo:
```sh
$ git clone git@github.com:DmitryRendov/mob-automation.git mob-automation
$ cd mob-automation/ansible
```

Install common packages, MySQL, and Java:

```sh
$ ansible-playbook -i ./inventory/live common.yml -e "user=minecraft env=mobserver-vps" -v
$ ansible-playbook -i ./inventory/live services.yml -e "user=minecraft env=mobserver-vps wireguard_enabled=true" \
-e "@local.vars.yml" -v
$ ansible-playbook -i ./inventory/live java-oracle.yml -e "user=minecraft env=mobserver-vps" -v
$ ansible-playbook -i ./inventory/live mysql.yml -e "user=minecraft env=mobserver-vps password=Secret_DB_Pass" -v
```

Last step - MOB server initial provisioning and configuration:
```sh
$ ansible-playbook -i ./inventory/live mob-server-provision.yml -e "user=minecraft env=mobserver-vps mode=setup" -v
```

### MOB server update

In case of a new release deployment - you need to merge all the changes to [mob-server] repo and play the provision playbook with the following options:
```sh
ansible-playbook -i ./inventory/live mob-server-provision.yml -e "user=minecraft env=mobserver-vps mode=update" -v
```
where:
- mode=setup - means brand new server setup, using original backups from S3
- mode=update - just update the server as part of the major upgrade

### MOB site deployment

MOB site is a part of game server and located in this GitHub repo - [mob-site]
```sh
$ ansible-playbook -i ./inventory/live mob-site-deploy.yml -e "user=minecraft env=mobsite-server" -v
```

### License
----

MIT

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job.)

   [Ansible]: <https://www.ansible.com/>
   [mob-server]: <https://github.com/DmitryRendov/mob-server>
   [mob-site]: <https://github.com/DmitryRendov/mob-site>

