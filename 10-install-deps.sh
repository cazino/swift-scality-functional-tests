#!/bin/bash -xue

function common() {
    git clone -b ${DEVSTACK_BRANCH} https://github.com/openstack-dev/devstack.git
    cp devstack/samples/local.conf devstack/local.conf
    cat >> devstack/local.conf <<EOF
disable_all_services
enable_service key mysql s-proxy s-object s-container s-account
EOF
    cp extras.d/55-swift-sporxyd.sh /devstack/extras.d/55-swift-sproxyd.sh
    ./devstack/stack.sh    
}

function get_release_number() {
    local release_string=`lsb_release -r -s`
    local release_number=${release_string:0:2}
    echo $release_number
}


function main() {
    # Workaround on Ubuntu 12 where some reason, devstack does not install
    # setuptools properly.
    # Installing it trough os package is not an option since devstack will uninstall it
    # if this is not a very recent version.
    release_number=$(get_release_number)
    if [ "$release_number" -eq "12" ]; then
        wget https://bootstrap.pypa.io/ez_setup.py -O - | sudo python;       
    fi
    common
}

main