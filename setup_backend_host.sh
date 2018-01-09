#!/bin/bash

echo "==============================================================================" >&2
echo "                          *** Portal Backends ***" >&2
echo "==============================================================================" >&2
echo "Metadata backend: $METADATA_HOST" >&2
echo "AppLib backend: $APPLIBRARY_HOST" >&2
echo "Wiki backend: $WIKI_HOST" >&2
echo "Galaxy backend: $PORTAL_GALAXY_URL" >&2
echo "Galaxy API Key: $PORTAL_GALAXY_API_KEY" >&2
echo "==============================================================================" >&2

ROOT_DIR=/etc/nginx/sites-enabled
cp $ROOT_DIR/default /tmp/default_backup
sed "s@http://localhost:8888@http://$METADATA_HOST:8888@g" /tmp/default_backup > $ROOT_DIR/default
cp $ROOT_DIR/default /tmp/default_backup
sed "s@http://localhost:80@http://$APPLIBRARY_HOST:80@g" /tmp/default_backup > $ROOT_DIR/default
cp $ROOT_DIR/default /tmp/default_backup
sed "s@http://wikihost:80@http://$WIKI_HOST:80@g" /tmp/default_backup > $ROOT_DIR/default


# Setup dist file for galaxy URL and galaxy API Key injected
CONFIG_DIR=/usr/share/nginx/html/assets/config
cp $CONFIG_DIR/config.development.json /tmp/config.backup
jq ".galaxy_url = \"$PORTAL_GALAXY_URL\" | .galaxy_api_key = \"$PORTAL_GALAXY_API_KEY\" | .deployment_repo_url = \"$CLOUD_DEPLOY_GIT_REPO\" | .announcement = \"$PORTAL_ANNOUNCEMENT\" | .tsi_portal_url = \"$TSI_PORTAL_URL\" | .aap_url = \"$AAP_URL\"" /tmp/config.backup > $CONFIG_DIR/config.development.json
