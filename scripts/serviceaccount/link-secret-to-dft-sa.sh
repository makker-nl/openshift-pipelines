#!/bin/bash
SCRIPTPATH=$(dirname $0)
. $SCRIPTPATH/../bin/oc_env.sh
# Link  a gitlab secret to default pipeline sa.
echo Link  secret $SECRET_NAME to $DFT_SERVICE_ACCOUNT
oc secrets link --for=mount $DFT_SERVICE_ACCOUNT $SECRET_NAME
echo Get changed service account  $DFT_SERVICE_ACCOUNT
oc describe sa $DFT_SERVICE_ACCOUNT
