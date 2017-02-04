#!/bin/bash
export PACKAGE_VERSION=1.0.3
export BUILD_NUM=1
export PACKAGE_NAME=paho
export DEBFULLNAME="Sean Winn"
export DEBEMAIL="sean.winn@renovomotors.com"

git clone https://github.com/eclipse/paho.mqtt.c /tmp/paho.mqtt.c

cd /tmp/paho.mqtt.c
cmake -GNinja -DPAHO_WITH_SSL=TRUE .
ninja package

mkdir /tmp/${PACKAGE_NAME}-${PACKAGE_VERSION}
mv ${PACKAGE_NAME}-${PACKAGE_VERSION}-Linux.tar.gz /tmp/${PACKAGE_NAME}_${PACKAGE_VERSION}/${PACKAGE_NAME}_${PACKAGE_VERSION}-${BUILD_NUM}.orig.tar.gz
cd /tmp/${PACKAGE_NAME}-${PACKAGE_VERSION}
dh_make
