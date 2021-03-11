#!/bin/bash
SCRIPTPATH=$(dirname $0)
. $SCRIPTPATH/../bin/oc_env.sh
# Create a gitlab secret from accompanying yaml file.
YAML=github-secret.yml
YAML_TPL=$YAML.tpl
echo Delete old secret $SECRET_NAME
oc delete secret $SECRET_NAME
echo Expand $YAML_TPL to $YAML
envsubst < $YAML_TPL > $YAML
echo Create new secret $SECRET_NAME
oc create -f $YAML
echo Annotate new secret $SECRET_NAME
oc annotate -n $NS secret $SECRET_NAME \
  "tekton.dev/git-0=${GIT_HOST}"
echo Get new secret $SECRET_NAME
oc get -n $NS secret $SECRET_NAME -o yaml
