#!/bin/bash -xue

cd /opt/stack/swift
sudo pip install -r test-requirements.txt
cd test/functional
nosetests --exe --with-xunit --xunit-file=nosetests.xml
