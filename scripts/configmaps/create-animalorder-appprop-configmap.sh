#!/bin/bash
SCRIPTPATH=$(dirname $0)
. $SCRIPTPATH/../bin/oc_env.sh
# Create a config map for a properties file with environment settings
export CM_SB=animalorderservice-app-config
export APP_HOME=~/git/VS/redhat-fuse/application-development/animalordersoap
echo Delete old Config Map $CM_SB
oc delete -n $NS cm $CM_SB
echo Create new Config Map $CM_SB
oc create configmap $CM_SB --from-file=$APP_HOME/src/main/resources/application.properties
echo Describe new Config Map $CM_SB
oc describe -n $NS cm $CM_SB