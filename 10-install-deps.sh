#!/bin/bash -xue

git clone -b ${DEVSTACK_BRANCH} https://github.com/openstack-dev/devstack.git
cp devstack/samples/local.conf devstack/local.conf
cat >> devstack/local.conf <<EOF
disable_all_services
enable_service key mysql s-proxy s-object s-container s-account
EOF
./devstack/stack.sh
