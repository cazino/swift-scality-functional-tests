#!/bin/bash -xue

function common() {
    git clone -b ${DEVSTACK_BRANCH} https://github.com/openstack-dev/devstack.git
    cp devstack/samples/local.conf devstack/local.conf
    cat >> devstack/local.conf <<EOF
disable_all_services
enable_service key mysql s-proxy s-object s-container s-account
EOF
    ./devstack/stack.sh    
}

function get_release_number() {
    release_string=`lsb_release -r`
    sentence="this is a story"
    release_array=($release_string)
    release_number=${release_array[1]:0:2}
    echo $release_number
}


function main() {
    release_number=$(get_release_number)
    if [ "$release_number" -eq "12" ]; then
        wget https://bootstrap.pypa.io/ez_setup.py -O - | sudo python;       
    fi
    common
}

main