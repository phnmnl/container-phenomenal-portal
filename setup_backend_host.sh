#!/bin/bash
ROOT_DIR=/etc/nginx/sites-available
cp $ROOT_DIR/reverse-proxy.conf $ROOT_DIR/reverse-proxy.conf_backup
sed "s@http://localhost:@http://$BACKEND_HOST:@g" $ROOT_DIR/reverse-proxy.conf_backup > $ROOT_DIR/reverse-proxy.conf
ln -s $ROOT_DIR/reverse-proxy.conf /etc/nginx/sites-enabled/reverse-proxy.conf
service nginx configtest
service nginx restart
