#!/usr/bin/env bash

VERSION=`python src/version.py`
NAME=`python src/name.py`
sudo pip2 install dist/${NAME}-${VERSION}.tar.gz --upgrade
sudo pip3 install dist/${NAME}-${VERSION}.tar.gz --upgrade
