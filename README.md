# Private Automation repo

Automation repo for the MOB project
- Ansible
- MOB game server (screen approach)
- MOB web-site
- Ollama + OpenWebUI

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
$ ansible-playbook -i ./inventory/live common.yml -e "user=minecraft env=mobserver-vps" -kK -v
$ ansible-playbook -i ./inventory/live services.yml -e "user=minecraft env=mobserver-vps wireguard_enabled=true" -e "@local.vars.yml" -v
$ ansible-playbook -i ./inventory/live java-oracle.yml -e "user=minecraft env=mobserver-vps" -v
$ ansible-playbook -i ./inventory/live mariadb.yml -e "user=minecraft env=mobserver-vps"-e "@local.vars.yml" -v
```

Last step - MOB server initial provisioning and configuration:
```sh
$ ansible-playbook -i ./inventory/live mob-server-provision.yml -e "user=minecraft env=mobserver-vps mode=setup" -v
```

where:
```sh
$ cat ansible/local.vars.yml
---

wireguard_enabled: false
wireguard:
  client_public_key: ayr<REDACTRED>nQ=
  server_private_key: 0Ai<REDACTRED>X2w=

aws:
  access_key: <REDACTRED>
  secret_key: <REDACTRED>

git:
  username: "Dmitry Rendov"
  email: "<REDACTRED>"
  ssh_key_name: id_ed25519_mobdeploy
  ssh_key: |
    -----BEGIN OPENSSH PRIVATE KEY-----
    <REDACTRED>
    -----END OPENSSH PRIVATE KEY-----

server_version: 1.21.10
server_env: live

# Default MariaDB root user credentials
mysql_root_password: <YOUR_ROOT_PASSWORD>

# Minecraft database configuration
minecraft_db_name: mob_server
minecraft_db_user: minecraft
minecraft_db_password: <YOUR_DB_PASSWORD>
minecraft_db_host: localhost

discord_bot_token: "NDIz<REDACTRED>9E"
geoip_api_key: "2i<REDACTRED>J"

keep_mysql_dump: true
keep_server_sources: true
keep_dynmap_tiles: true
```

### MOB server update

In case of a new release deployment - you need to merge all the changes to [mob-server] repo and play the provision playbook with the following options:
```sh
ansible-playbook -i ./inventory/live mob-server-provision.yml --key-file ~/.ssh/id_ed25519_mobdeploy -e "user=minecraft env=mobserver-vps" -e "@local.vars.yml" -v
```

You can skip downloading server sources and MySQL dump by adding the following options to the command:
```sh
ansible-playbook -i ./inventory/live mob-server-provision.yml -e "user=minecraft env=mobserver-vps keep_server_sources=false keep_mysql_dump=false" -e "@local.vars.yml" -v
```

Also, you can skip downloading dynmap tiles by adding the following option:
```sh
ansible-playbook -i ./inventory/live mob-server-provision.yml -e "user=minecraft env=mobserver-vps keep_dynmap_tiles=false" -e "@local.vars.yml" -v
```

Using Ansible tags, you can run only specific parts of the provisioning process. For example, to update only the MOB worlds and the database, run:
```sh
ansible-playbook -i ./inventory/live mob-server-provision.yml -e "user=minecraft env=mobserver-vps" -e "@local.vars.yml" --skip-tags "worlds,database" -v
```

### MOB site deployment

Perform initial setup and dependencies
```sh
$ ansible-playbook -i ./inventory/live common.yml -e "user=drendov env=mobsite" -kK -v
$ ansible-playbook -i ./inventory/live services.yml -e "user=drendov env=mobsite" -e "@local.vars.yml" -v
```

Add mob-site specific configs to local.vars.yml
```sh
...

# MOB site
site_db_password: "YOUR_WEBSITE_DB_PASS"
site_db_src: "mob-site/mob_site.01-12-2026.tar.gz"
site_media: "mob-site/mob_site_media.13-06-2026.tar.gz"
```

MOB site is a part of game server and located in this GitHub repo - [mob-site]
```sh
$ ansible-playbook -i ./inventory/live mob-site-deploy.yml --key-file ~/.ssh/id_ed25519_mobsitedeploy -e "user=drendov env=mobsite" -e "@local.vars.yml" -v
```

### Ollama + Open WebUI

Deploy Ollama and Open WebUI on the LLM host (includes Docker and Intel GPU packages via `group_vars/llm.yml`):

```sh
$ ansible-playbook -i ./inventory/live ollama.yml -e "user=minecraft env=ollama" -v
```

See [ansible/roles/ollama/README.md](ansible/roles/ollama/README.md) for models, tuning, and access details.

Open WebUI: `http://<ollama-host>:8080` · Ollama API: `http://<ollama-host>:11434`

### License
----

MIT

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job.)

   [Ansible]: <https://www.ansible.com/>
   [mob-server]: <https://github.com/DmitryRendov/mob-server>
   [mob-site]: <https://github.com/DmitryRendov/mob-site>

