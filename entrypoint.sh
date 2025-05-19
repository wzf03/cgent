#!/bin/sh
CONFIG_FILE="/root/config.yml"
if [ ! -f "$CONFIG_FILE" ]; then
    UUID=$(uuidgen)
    cat <<EOF > "$CONFIG_FILE"
client_secret: ${SECRET}
server: '${SERVER}'
tls: ${TLS}
uuid: ${UUID}
disable_auto_update: true
disable_command_execute: true
disable_force_update: true
skip_procs_count: true
EOF
fi
exec /cgent -c="$CONFIG_FILE"
