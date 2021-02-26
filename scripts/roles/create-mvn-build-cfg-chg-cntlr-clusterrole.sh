#!/bin/bash
SCRIPTPATH=$(dirname $0)
. $SCRIPTPATH/../bin/oc_env.sh
# Create a cluster role for buildconfig
ROLE=mvn-build-config-change-controller
echo Delete old clusterrole $ROLE
oc delete clusterrole $ROLE
echo Create new clusterrole $ROLE
oc create  -f mvn-build-cfg-chg-cntlr-clusterrole.yml