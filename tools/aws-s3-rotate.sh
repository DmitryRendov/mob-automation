#! /bin/bash
# Usage: ./aws-s3-rotate.sh s3://my-bucket backup-location
# This script removes files older than 30 days from the specified S3 bucket location.
set -e

BUCKET=$1
LOCATION=$2
DAYS=30

if [ "${BUCKET}" != "" ] && [ "${LOCATION}" != "" ]; then

  echo "Removing the backups older than ${DAYS} days..."
  echo ""

  aws s3 ls ${BUCKET}/${LOCATION}/ --profile sts | while read -r line;
  do
    createDate=`echo $line|awk {'print $1" "$2'}`
    createDate=`date -d"$createDate" +%s`
    olderThan=`date --date "${DAYS} days ago" +%s`

    if [[ $createDate -lt $olderThan ]]; then
      fileName=`echo $line|awk {'print $4'}`
        if [[ $fileName != "" ]]; then
          aws s3 rm ${BUCKET}/${LOCATION}/$fileName --profile sts --dryrun
        fi
     fi

  done

else
  echo "Please provide the S3 location name as the second argument."  
fi
