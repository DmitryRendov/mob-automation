
# mob-server-provision role

Ansible role for provisioning and managing a Minecraft server environment.


## Usage

```bash
ansible-playbook -i ./inventory/live mob-server-provision.yml \ 
-e "user=minecraft env=mobserver-vps" \
-e "@local.vars.yml" -v
```

Using Ansible tags, you can run only specific parts of the provisioning process. For example, to update only the MOB worlds and the database, run:
```sh
ansible-playbook -i ./inventory/live mob-server-provision.yml \
-e "user=minecraft env=mobserver-vps" \
-e "@local.vars.yml" --skip-tags "worlds,database" -v
```


## Backup and Restore

### Full Backup (1st of month):

- Created with _full.tar.gz suffix
- Initializes a .snar metadata file for that month
- Contains all files to restore from

### Incremental Backups (other days):

- Created with _incr.tar.gz suffix
- Uses the .snar file to track only changed files since last backup
- Significantly smaller than full backups
 
### Metadata Management:

- ``.snar`` files stored in $BACKUPPATH/.snar/ directory
- Named by month (e.g., 2026-01.snar, 2026-02.snar)
- Automatically cleaned up when new month starts

### Restore Process

```bash
# Restore full backup
tar -x --incremental -f backup_2026-01-01_full.tar.gz

# Then restore incremental backups in order
tar -x --incremental -f backup_2026-01-05_incr.tar.gz
tar -x --incremental -f backup_2026-01-10_incr.tar.gz
```