#!/bin/bash

#Database Connection details:

HOST="localhost"
PORT=3306
USERNAME="root"
PASSWORD="root"

FILE_NAME_PREFIX=mysql_backup_
DIR=../backups/
DATABASES=(db1 db2)
KEEP_BACKUPS=5

CURRENT_TIME=$(date "+%Y.%m.%d-%H.%M.%S")
for i in "${DATABASES[@]}"
do
        mysqldump -h $HOST -P $PORT -u $USERNAME -p$PASSWORD -B $i --single-transaction > $DIR$FILE_NAME_PREFIX$i$CURRENT_TIME.sql
done

pushd $DIR

ARRAY_LEN="${#DATABASES[@]}"
NUMBER_OF_FILES=$(ls | wc -l)
REMOVE_FILES_COUNT=$(( $NUMBER_OF_FILES - ($ARRAY_LEN*KEEP_BACKUPS) ))
echo $REMOVE_FILES_COUNT

if [ $REMOVE_FILES_COUNT -gt 0 ]
then
        ls -1tr | head -n $REMOVE_FILES_COUNT | xargs -d '\n' rm -f --
fi
