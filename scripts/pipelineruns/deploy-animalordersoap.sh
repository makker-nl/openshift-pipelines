#!/bin/bash
SCRIPTPATH=$(dirname $0)
. $SCRIPTPATH/../bin/oc_env.sh
# Clone the AnimalOrderSOAP project and list the project contents.
GH_REPO_URL='https://github.com/makker-nl/animalordersoap.git'
GH_REPO_BRANCH=main
PIPELINE=fabric8-deploy-pipeline
echo Start pipeline $PIPELINE with:
echo . github url: $GH_REPO_URL
echo . branch: $GH_REPO_BRANCH
echo . namespace: $NS
echo . serviceaccount: $DFT_SERVICE_ACCOUNT
echo . source workspace: $WS_SRC
echo . maven workspace: $WS_MVN
echo . maven configmap: $CM_MVN
echo . Persistence volume claim: $PVC_SRC
tkn pipeline start $PIPELINE \
  --namespace=$NS \
  --serviceaccount=$DFT_SERVICE_ACCOUNT \
  --workspace name=$WS_MVN,config=$CM_MVN \
  --workspace name=$WS_SRC,claimName=$PVC_SRC \
  --param private-github-repo-url=$GH_REPO_URL \
  --param github-repo-revision=$GH_REPO_BRANCH \
  --use-param-defaults \
  --showlog
