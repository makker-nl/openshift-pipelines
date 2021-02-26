#!/bin/bash
SCRIPTPATH=$(dirname $0)
. $SCRIPTPATH/../bin/oc_env.sh
# Install Nexus as a container service to be used as a mirror.
kubectl apply -n $NS -f nexus.yml
#watch kubectl -n $NS get pods,svc
