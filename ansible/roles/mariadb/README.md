# MariaDB Ansible Role

This Ansible role installs and configures MariaDB on Ubuntu systems.

## Requirements

- Ubuntu 22.04 or compatible
- Ansible 2.9+

## THe module is not Idempotent

This role is not idempotent due to the plugin default_authentication_plugin. You can remove the server manually from the server, including any databases and the server configs:

```bash
sudo apt purge mariadb-* mysql-common
```

## Role Variables

Some must-have variables are listed below, along with default values (see `defaults/main.yml`):

```yaml
# Root user credentials
mysql_root_password: ""

# Minecraft database configuration
minecraft_db_password: ""
```

Additionally this module has a set of fine-tuning variables:

```yaml
# Character set configuration
mariadb_character_set: utf8mb4
mariadb_collation: utf8mb4_unicode_ci

# Fine tuning parameters
mariadb_max_connections: 200
mariadb_connect_timeout: 5
mariadb_wait_timeout: 600
mariadb_max_allowed_packet: 16M
mariadb_thread_cache_size: 128
mariadb_sort_buffer_size: 4M
mariadb_bulk_insert_buffer_size: 16M
mariadb_tmp_table_size: 32M
mariadb_max_heap_table_size: 32M
mariadb_skip_name_resolve: true

# Authentication
mysql_disable_unix_socket_auth: true

# Allowed networks for MariaDB access
allowed_networks:
  - localhost
  - 127.0.0.1
  - ::1
  - 10.10.10.0/24
  - 192.168.56.0/24
```

## Dependencies

Run MySQL or MariaDB queries

```bash
ansible-galaxy collection install community.mysql
```

## Usage

```bash
ansible-playbook -i ./inventory/dev mariadb.yml \
-e "user=minecraft env=mobserver" \
-e "@local.vars.yml" -v
```
