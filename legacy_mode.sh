#!/bin/sh -e
export PATH=`echo $PATH | sed -e 's/\/opt\/rh\/devtoolset-4\/root\/usr\/bin\/://'`
unset BOOST_ROOT

