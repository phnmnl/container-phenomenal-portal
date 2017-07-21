#!/bin/bash
ROOT_DIR=/usr/share/nginx/html/assets/config
cp $ROOT_DIR/config.development.json $ROOT_DIR/config_backup
sed "s@\"host\": \"http://localhost\"@\"host\": \"http://$BACKEND_HOST\"@g" $ROOT_DIR/config_backup > $ROOT_DIR/config.development.json
