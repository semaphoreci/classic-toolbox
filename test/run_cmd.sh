#!/bin/bash

echo $1

OLDIFS=$IFS
IFS=$'\n'
for line in $(cat $1);
do
  echo "$line"
  #ssh -p29920 -i ~/.ssh/id_dsa -oStrictHostKeyChecking=false -oUserKnownHostsFile=/dev/null -oLogLevel=ERROR runner@$IP  "source .bash_profile ; source ~/.toolbox/sem-version ; $line"
  eval $line
  #scp  -i ~/.ssh/id_dsa -oStrictHostKeyChecking=false -oUserKnownHostsFile=/dev/null -P29920 runner@$IP  /tmp/cmd.log ./
  #cat cmd.log
done
IFS=$OLDIFS

