#!/bin/bash -xue

SWIFT_DIR=/opt/stack/swift
sudo pip install -r $SWIFT_DIR/test-requirements.txt
nosetests -w $SWIFT_DIR/test/functional --exe --with-xunit --xunit-file=${WORKSPACE}/nosetests.xml
