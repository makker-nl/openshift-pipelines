#!/bin/bash
SCRIPTPATH=$(dirname $0)
. $SCRIPTPATH/../bin/oc_env.sh
# Create a task  to list a directory from a persistent volume.
TASK=list-directory
echo Delete old task $TASK
oc delete task $TASK
echo Create new task $TASK
oc apply -n $NS -f list-directory-task.yml
