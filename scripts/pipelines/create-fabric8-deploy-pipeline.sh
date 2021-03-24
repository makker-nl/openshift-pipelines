#!/bin/bash
SCRIPTPATH=$(dirname $0)
. $SCRIPTPATH/../bin/oc_env.sh
# Create a pipeline with clone and listdirectory tasks.
PIPELINE=fabric8-deploy-pipeline
YAML=$SCRIPTPATH/fabric8-deploy-pipeline.yml
YAML_TPL=$YAML.tpl
echo Expand $YAML_TPL to $YAML
envsubst < $YAML_TPL > $YAML
echo Delete old pipeline $PIPELINE
kubectl delete pipeline -n $NS $PIPELINE
echo Create/apply new pipeline $PIPELINE
kubectl apply -n $NS -f $YAML
echo Describe new/changed pipeline $PIPELINE
tkn pipeline describe $PIPELINE
