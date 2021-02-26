#!/bin/bash
SCRIPTPATH=$(dirname $0)
. $SCRIPTPATH/../bin/oc_env.sh
# Create a cluster role binding 
ROLE=mvn-build-config-change-controller
ROLEBINDING=$SERVICE_ACCOUNT-$ROLE
echo Create cluster role binding for $SERVICE_ACCOUNT and role $ROLE, named: $ROLEBINDING
oc adm policy add-cluster-role-to-user $ROLE -z $SERVICE_ACCOUNT --rolebinding-name=$ROLEBINDING
echo Desribe rolebinding $ROLEBINDING 
oc describe clusterrolebinding.rbac $ROLEBINDING
# To remove the binding:
#oc adm policy remove-cluster-role-from-user $ROLE -z $SERVICE_ACCOUNT --rolebinding-name=$ROLEBINDING