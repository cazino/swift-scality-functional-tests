# 55-swift-sproxyd.sh - Devstack extras script to configure s-object with swiftsproxyd driver

# Shamless ripoff of devstack/lib/swift
function enable_sproxyd_driver() {
    for node_number in ${SWIFT_REPLICAS_SEQ}; do
        local swift_node_config=${SWIFT_CONF_DIR}/object-server/${node_number}.conf
        iniset ${swift_node_config} app:object-server use egg:swift_scality_backend#sproxyd_object
        # Host and port need to be confiurable
        iniset ${swift_node_config} app:object-server sproxyd_host localhost:81
        # /proxy_path need to be configurable
        iniset ${swift_node_config} app:object-server sproxyd_path /proxy/chord_path
        # splice need to be configurable
        iniset ${swift_node_config} app:object-server splice yes
}

if is_service_enabled s-object; then
    if [[ "$1" == "stack" && "$2" == "install" ]]; then
        enable_sproxyd_driver
    fi
fi
