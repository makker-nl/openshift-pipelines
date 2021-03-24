#!/bin/bash
SCRIPTPATH=$(dirname $0)
. $SCRIPTPATH/../bin/oc_env.sh
# Create a config map voor Maven settings.xml
MVN_SETTINGS=$SCRIPTPATH/maven-settings.xml
echo Delete old Config Map $CM_MVN
oc delete -n $NS cm $CM_MVN
echo Create new Config Map $CM_MVN
oc create -n $NS cm $CM_MVN \
  --from-file=settings.xml=$MVN_SETTINGS
echo Describe new Config Map $CM_MVN
oc describe -n $NS cm $CM_MVN
