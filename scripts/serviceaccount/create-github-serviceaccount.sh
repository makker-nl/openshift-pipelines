#!/bin/bash
SCRIPTPATH=$(dirname $0)
. $SCRIPTPATH/../bin/oc_env.sh
# Create a service account based on gitlab secret 
# https://redhat-scholars.github.io/tekton-tutorial/tekton-tutorial/private_reg_repos.html
YAML=github-service-account.yml
YAML_TPL=$YAML.tpl
echo Delete old service account $SERVICE_ACCOUNT
oc delete sa $SERVICE_ACCOUNT
echo Expand $YAML_TPL to $YAML
envsubst < $YAML_TPL > $YAML
echo Create new service account $SERVICE_ACCOUNT in namespace $NS
oc create -f $YAML
echo Get new service account $SERVICE_ACCOUNT
oc get sa -n $NS $SERVICE_ACCOUNT -o yaml
