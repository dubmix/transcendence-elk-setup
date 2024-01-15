#!/bin/bash

cert_dir="/var/lib/kibana"
yaml_file="/etc/kibana/kibana.yml"
tbr="<trusted_certificate_here>"

cert_file=$(find "$cert_dir" -maxdepth 1 -type f -name "*.crt" | head -n 1)

cert_name=$(basename "$cert_file" .crt)

sed -i "s~$tbr~$cert_name.crt~" "$yaml_file"
