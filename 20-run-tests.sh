#!/bin/bash -xue

cd /opt/stack/swift/test/functional
nosetests --exe --with-xunit --xunit-file=nosetests.xml
