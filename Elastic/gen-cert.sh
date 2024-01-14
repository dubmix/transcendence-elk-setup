#!/bin/bash

openssl genpkey -algorithm RSA -out /etc/elasticsearch/ssl/key.pem

openssl req -new -key /etc/elasticsearch/ssl/key.pem -x509 -days 365 -out /etc/elasticsearch/ssl/elastic.crt -subj "/CN=DE"

openssl req -new -key /etc/elasticsearch/ssl/key.pem -x509 -days 365 -out /etc/elasticsearch/ssl/filebeat.crt -subj "/CN=DE"

openssl req -new -key /etc/elasticsearch/ssl/key.pem -x509 -days 365 -out /etc/elasticsearch/ssl/kibana.crt -subj "/CN=DE"

openssl req -new -key /etc/elasticsearch/ssl/key.pem -x509 -days 365 -out /etc/elasticsearch/ssl/logstash.crt -subj "/CN=DE"
