# 55-swift-sproxyd.sh - Devstack extras script to configure s-object with swiftsproxyd driver

if is_service_enabled s-object; then
    if [[ "$1" == "stack" && "$2" == "install" ]]; then
        echo_summary "FANTASTIC"
        exit 1;
    fi
fi
