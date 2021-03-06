#!/bin/bash
SCRIPTPATH=$(dirname $0)
. $SCRIPTPATH/oc_env.sh

export PVC=$1
echo Delete persistent volumes for  $PVC, namespace $NS
oc get -n $NS pvc |awk -v claim=$PVC '$0 ~ claim {print $3}'| while read -r volume ; do
  echo "Volume:  $volume"
  oc delete persistentvolume $volume
done
