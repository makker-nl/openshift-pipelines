#!/bin/bash
SCRIPTPATH=$(dirname $0)
#
. $SCRIPTPATH/oc_env.sh
export POD=$1
echo Exec bash for pod $POD
oc exec -n $NS -it $POD -- /bin/bash
