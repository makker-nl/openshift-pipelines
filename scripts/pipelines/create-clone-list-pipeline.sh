#!/bin/bash
SCRIPTPATH=$(dirname $0)
. $SCRIPTPATH/../bin/oc_env.sh
# Create a pipeline with clone and listdirectory tasks.
PIPELINE=clone-list-pipeline
YAML=clone-list-pipeline.yml
YAML_TPL=$YAML.tpl
echo Expand $YAML_TPL to $YAML
envsubst < $YAML_TPL > $YAML
echo Delete old pipeline $PIPELINE
oc delete pipeline -n $NS $PIPELINE
echo Create/apply new pipeline $PIPELINE
oc apply -n $NS -f $YAML
