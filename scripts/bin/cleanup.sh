#!/bin/bash
SCRIPTPATH=$(dirname $0)
. $SCRIPTPATH/oc_env.sh

export SVC=$1 
echo Cleanup for $SVC, namespace $NS
echo Get builds:
oc get -n $NS builds |awk -v service=$SVC 'NR > 1 $0 ~ service {print $1}'| while read -r build ; do
  echo "oc delete -n $NS build  $build"
  oc delete -n $NS build $build
done

echo Get buildconfigs:
oc get -n $NS buildconfigs |awk -v service=$SVC 'NR > 1 $0 ~ service {print $1}'| while read -r bc ; do
  echo "oc delete -n $NS buildconfig  $bc"
  oc delete -n $NS buildconfig $bc
done

echo Get deploymentconfigs:
oc get -n $NS deploymentconfigs |awk -v service=$SVC 'NR > 1 $0 ~ service {print $1}'| while read -r dc ; do
  echo "oc delete -n $NS deploymentconfig  $dc"
  oc delete -n $NS deploymentconfig $dc
done

echo Get replicationcontrollers:
oc get -n $NS replicationcontrollers |awk -v service=$SVC 'NR > 1 $0 ~ service {print $1}'| while read -r rc ; do
  echo "oc delete -n $NS replicationcontroller  $rc"
  oc delete -n $NS replicationcontroller $rc
done

echo Get services:
oc get -n $NS services |awk -v service=$SVC 'NR > 1 $0 ~ service {print $1}'| while read -r service ; do
  echo "oc delete -n $NS service  $service"
  oc delete -n $NS service $service
done

echo Get routes:
oc get -n $NS routes |awk -v service=$SVC 'NR > 1 $0 ~ service {print $1}'| while read -r route ; do
  echo "oc delete -n $NS route  $route"
  oc delete -n $NS route $route
done

echo Delete Succeeded and Failed pods:
oc delete -n $NS pods --field-selector=status.phase=Succeeded
oc delete -n $NS pods --field-selector=status.phase=Failed

echo Delete Pipelineruns:
oc delete -n $NS -n $NS pr --all

echo Delete Taskruns:
oc delete -n $NS -n $NS tr --all
