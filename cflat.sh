#!/bin/bash

BASEDIR=$(dirname $0)
cd $BASEDIR

ACTION=$1

if [ -z "$ACTION" ];
  then
    echo "usage: $0 <init|up|up-dev|down|logs>";
    exit 1;
fi

_init() {
  # (Temp) init
  mkdir -p homebridge
  mkdir -p node-red
  mkdir -p mqtt/{config,data,log}
  chmod -R 777 mqtt
}

_up() {
  docker-compose -f docker-compose.yml up -d
}
_up-dev() {
  docker-compose -f docker-compose.dev.yml -f docker-compose.yml up -d
}
_down() {
  docker-compose down
}
_logs() {
  docker-compose logs -f
}

eval _$ACTION