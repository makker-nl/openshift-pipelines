#!/bin/bash
SCRIPTPATH=$(dirname $0)
. $SCRIPTPATH/oc_env.sh
#
POD=$1
echo Show logs of pod $POD
oc logs -f $POD -n $NS

