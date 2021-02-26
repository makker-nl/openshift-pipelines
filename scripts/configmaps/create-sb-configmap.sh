#!/bin/bash
SCRIPTPATH=$(dirname $0)
. $SCRIPTPATH/../bin/oc_env.sh
# Create a config map for a property.
export CM_SB=spring-boot-configmaps-demo
echo Delete old Config Map $CM_SB
oc delete -n $NS cm $CM_SB
echo Create new Config Map $CM_SB
oc create configmap $CM_SB --from-literal=aOSvc.endpoint.prefix="AnimalOrderServiceEndpoint: "
echo Describe new Config Map $CM_SB
oc describe -n $NS cm $CM_SB