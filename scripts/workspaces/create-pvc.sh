#!/bin/bash
SCRIPTPATH=$(dirname $0)
. $SCRIPTPATH/../bin/oc_env.sh
# Create a pipeline with clone and listdirectory tasks.
YAML=sources-pvc.yaml
YAML_TPL=$YAML.tpl
echo Check Default Storage Class\(es\)
oc get sc
echo Expand $YAML_TPL to $YAML
envsubst < $YAML_TPL > $YAML
echo Create new Persistence Volume Claim $PVC_SRC
oc apply -n $NS -f $YAML
echo Get  new Persistence Volume Claim $PVC_SRC
oc get pvc $PVC_SRC -o yaml
