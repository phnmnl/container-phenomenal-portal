#!/bin/bash
ROOT_DIR=/etc/nginx/sites-enabled
cp $ROOT_DIR/default /tmp/default_backup
sed "s@http://localhost:8888@http://$BACKEND_HOST:8888@g" /tmp/default_backup > $ROOT_DIR/default
cp $ROOT_DIR/default /tmp/default_backup
sed "s@http://localhost:80@http://$APPLIBRARY_HOST:80@g" /tmp/default_backup > $ROOT_DIR/default