#!/bin/bash

#Settings
USERNAME="dmitry"
RESTOREPATH="/home/${USERNAME}/toRestore"
BACKUPPATH="/home/${USERNAME}/backups/dev"
NOW=`date "+%Y-%m-%d_%Hh%M"`

# Mysql bases to backup
MSB2BACKUP[0]='mob_site'
MSB2BACKUP[1]='mob_server'
MSB2BACKUP[2]='dymkiby'

ME=`whoami`
as_user() {
  if [ $ME == $USERNAME ] ; then
    bash -c "$1"
  else
    su - $USERNAME -c "$1"
  fi
}

backup_dev_db()
{

    for object in ${MSB2BACKUP[*]}
    do
      echo ""
      echo -n "Backuping ${object}"
      mysqldump -u django -p'111' -h localhost ${object} | gzip -9 > "$BACKUPPATH/${object}_$NOW.dump.gz"
    done

    echo ""
    echo "Done." 
    echo "Successful created Dev DBs backup... "

}

restore_dev_db()
{

    if [ -e "/home/dmitry/toRestore" ]; then
        for object in ${MSB2BACKUP[*]}
        do
          echo ""
          echo -n "Restoring ${object}"
          gunzip < ${RESTOREPATH}/${object}.dump.gz | mysql -u django -p111 -h localhost ${object}
        done

    fi

    echo ""
    echo "Done." 
    echo "Successful restored Dev DBs backup... "

}


case "$1" in
backupdb)
        echo ""
        backup_dev_db
        echo ""
        ;;
restoredb)
        echo ""
        echo "!!! WARNING !!!"
        echo ""
        echo ""
        restore_dev_db
        echo ""
        ;;
*)      echo "Usage: /home/$USERNAME/manage.sh backupdb|restoredb"
        exit 1
        ;;
esac
exit 0 
