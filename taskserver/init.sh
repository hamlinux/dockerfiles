#!/bin/bash

taskd init --data /task_data

cd $TASKDDIR/pki
./generate
cp client.cert.pem $KEYS
cp client.key.pem  $KEYS
cp server.cert.pem $KEYS
cp server.key.pem  $KEYS
cp server.crl.pem  $KEYS
cp ca.cert.pem     $KEYS

taskd config --data $TASKDATA --force client.cert $KEYS/client.cert.pem
taskd config --data $TASKDATA --force client.key  $KEYS/client.key.pem
taskd config --data $TASKDATA --force server.cert $KEYS/server.cert.pem
taskd config --data $TASKDATA --force server.key  $KEYS/server.key.pem
taskd config --data $TASKDATA --force server.crl  $KEYS/server.crl.pem
taskd config --data $TASKDATA --force ca.cert     $KEYS/ca.cert.pem


taskd config --data $TASKDATA --force log /dev/stdout
taskd config --data $TASKDATA --force server localhost:53589
taskd config --data $TASKDATA --force client.allow '^task [2-9]'

taskd add --data $TASKDATA org Public
taskd add --data $TASKDATA user 'Public' 'First Last'
./generate.client first_last

cp first_last.cert.pem $KEYS
cp first_last.key.pem  $KEYS
