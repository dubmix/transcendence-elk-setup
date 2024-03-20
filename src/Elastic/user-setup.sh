#!/bin/bash

echo "root:$ROOT_PW" | chpasswd
./elasticsearch-users useradd "$ELASTICSEARCH_USER" -p "$ELASTICSEARCH_PW" -r superuser,kibana_system

chown -R elasticsearch:elasticsearch /usr/share/elasticsearch
usermod -d /usr/share/elasticsearch elasticsearch
usermod -s /bin/bash elasticsearch
su -s /bin/bash -c 'elasticsearch' elasticsearch