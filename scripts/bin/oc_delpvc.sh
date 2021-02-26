#!/bin/bash
SCRIPTPATH=$(dirname $0)
. $SCRIPTPATH/oc_env.sh

export PVC=$1
echo First delete persistent volume claim
oc delete persistentvolumeclaim $PVC
