#!/bin/bash
ROOT_DIR=/etc/nginx/sites-enabled
cp $ROOT_DIR/default /tmp/default_backup
sed "s@http://localhost:8888@http://$BACKEND_HOST:8888@g" /tmp/default_backup > $ROOT_DIR/default
cp $ROOT_DIR/default /tmp/default_backup
sed "s@http://localhost:80@http://$APPLIBRARY_HOST:80@g" /tmp/default_backup > $ROOT_DIR/default

# Setup dist file for galaxy URL and galaxy API Key injected
CONFIG_DIR=/ng2-phenomenal-portal/dist/assets/config
cp $CONFIG_DIR/config.development.json /tmp/config.backup
jq ".galaxy_url = \"$PORTAL_GALAXY_URL\" | .galaxy_api_key = \"$PORTAL_GALAXY_API_KEY\" " /tmp/config.backup > $CONFIG_DIR/config.development.json


