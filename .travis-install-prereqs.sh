#!/bin/sh

set -e
set -x

git submodule update --init --recursive
composer self-update
composer install --dev -n --prefer-source
mkdir -p "$HOME/libmaxminddb"
git clone --recursive git://github.com/maxmind/libmaxminddb
cd libmaxminddb
./bootstrap
./configure --prefix="$HOME/libmaxminddb"
make
make install
