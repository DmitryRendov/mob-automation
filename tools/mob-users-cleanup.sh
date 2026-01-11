#!/bin/bash

DAYS=$1
if [ -z "${DAYS}" ]; then
  DAYS=90
fi
SERVER="/home/minecraft/mob-servers/"

echo "Removing all outdated profilies and userdata within ${DAYS} days..."
echo ""

if [ "${DAYS}" -gt "89" ]; then
  echo "Cleaning up lobby playerdata"
  find ${SERVER}/lobby/lobby/{playerdata/*.dat,stats/*.json,advancements/*.json} -mtime +${DAYS} -exec rm {} \;
  echo "Cleaning up lobby Essentials"
  find ${SERVER}/lobby/plugins/Essentials/userdata/*.yml -mtime +${DAYS} -exec rm {} \;

  echo "Cleaning up surivial playerdata"
  find ${SERVER}/survival/survival/{playerdata/*.dat,stats/*.json,advancements/*.json} -mtime +${DAYS} -exec rm {} \;
  echo "Cleaning up survival Essentials/GraviTree/GriefPreventionData"
  find ${SERVER}/survival/plugins/{Essentials/userdata/*.yml,GraviTree/PlayerData/*,GriefPreventionData/PlayerData/*} -mtime +${DAYS} -exec rm {} \;

  echo "Cleaning up vanilla playerdata"
  find ${SERVER}/vanilla/vanilla/{playerdata/*.dat,stats/*.json,advancements/*.json} -mtime +${DAYS} -exec rm {} \;

  echo "Restarting all affected services"
  /opt/minecraft/survival command "ess reload"
  /opt/minecraft/survival command "gpreload"

else
  echo "Period should be 90+ to run clean-up! Curretly is set ${DAYS}, aborting..."
fi

exit 0