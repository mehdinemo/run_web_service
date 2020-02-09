#!/usr/bin/env bash

APP=run_web_service_on_ubuntu
GIT=https://github.com
USR=mehdinemo
APP_SRC=${GIT}/{USR}/${APP}/-/archive/master/${APP}-master.tar
INS_SRC=${GIT}/mehdinemo/installer/-/archive/master/installer-master.tar

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

cd /tmp || exit
curl -sO ${APP_SRC}
curl -sO ${INS_SRC}
tar xf ${APP}-master.tar
tar xf installer-master.tar
cp -r installer-master/installer/ ${APP}-master/
cd ${APP}-master || exit
python3 install.py
