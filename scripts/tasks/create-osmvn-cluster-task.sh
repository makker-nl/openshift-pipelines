#!/bin/bash
SCRIPTPATH=$(dirname $0)
. $SCRIPTPATH/../bin/oc_env.sh
# Create a clone of maven cluster task for openshift profile.
TASK=os-maven
echo Delete old clustertask $TASK
oc delete clustertask $TASK
echo Create new clustertask $TASK
oc -f os-maven-clustertask.yml
