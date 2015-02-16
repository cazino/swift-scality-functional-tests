#!/bin/bash -xue

git clone -b ${DEVSTACK_BRANCH} https://github.com/openstack-dev/devstack.git
cd devstack
cp ./samples/local.conf local.conf
cat >> local.conf <<EOF
disable_all_services
enable_service key mysql s-proxy s-object s-container s-account
EOF
