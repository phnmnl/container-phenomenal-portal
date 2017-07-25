#!/bin/bash
ROOT_DIR=/etc/nginx/sites-enabled
cp $ROOT_DIR/default /tmp/default_backup
sed "s@http://localhost:@http://$BACKEND_HOST:@g" /tmp/default_backup > $ROOT_DIR/default