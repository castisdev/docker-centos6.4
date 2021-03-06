#!/bin/bash -e
yum -y install bzip2-devel which; yum -y clean all
cd ~
wget --no-check-certificate http://sourceforge.net/projects/boost/files/boost/1.59.0/boost_1_59_0.tar.gz
tar xzf boost_1_59_0.tar.gz
cd boost_1_59_0
./bootstrap.sh
./b2 --prefix=/usr/local/boost159 --without-python install
./b2 boost.locale.icu=off --with-locale --prefix=/usr/local/boost159 install
cd ~
rm -rf boost_*
