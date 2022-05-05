#!/bin/bash

NAMESPACE=$1

if [ -z "$NAMESPACE" ]; then
  echo "Missing Docker registry namespace. Usage: $0 [NAMESPACE]"
  echo -e "Examples:"
  echo -e "\t$0 mynamespace"
  echo -e "\t$0 docker.io/mynamespace"
  echo -e "\t$0 mynamespace/mysubspace"
  echo -e "\t$0 docker.io/mynamespace/mysubspace"
  exit 1
fi

VERSION="v1.0.1-SNAPSHOT"

docker build -t $NAMESPACE/geoipupdate-s3:$VERSION . && docker push $NAMESPACE/geoipupdate-s3:$VERSION
