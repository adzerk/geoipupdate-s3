#!/bin/bash

pid=0
database_dir=/usr/share/GeoIP
original_frequency=$GEOIPUPDATE_FREQUENCY
frequency=$((GEOIPUPDATE_FREQUENCY * 60 * 60))
GEOIPUPDATE_FREQUENCY=0

if ! [ -z "$GEOIPUPDATE_DB_DIR" ]; then
  database_dir=$GEOIPUPDATE_DB_DIR
fi

if [ -z "$GEOIPUPDATE_ACCOUNT_ID" ] || [ -z  "$GEOIPUPDATE_LICENSE_KEY" ] || [ -z "$GEOIPUPDATE_EDITION_IDS" ] || [ -z "$S3_URI" ]; then
    echo "ERROR: You must set the environment variables GEOIPUPDATE_ACCOUNT_ID, GEOIPUPDATE_LICENSE_KEY, GEOIPUPDATE_EDITION_IDS, and S3_URI!"
    exit 1
fi

while true; do
    /usr/bin/entry.sh
    arr=($GEOIPUPDATE_EDITION_IDS)

    for i in "${!arr[@]}"; do
      aws s3 cp $database_dir/${arr[i]}.mmdb $S3_URI
    done

    if [ "$frequency" -eq 0 ]; then
        break
    fi

    echo "# STATE: Sleeping for $original_frequency hours"
    sleep "$frequency" &
    pid=$!
    wait $!
done
