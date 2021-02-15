# openshift-pipelines
This project contains scripts and snippets to work with and implement OpenShift Pipelines.

## oc environment
The Script [bin/oc_env.sh](scripts/bin/oc_env.sh) sets several environment variables used in the particular scripts.

## Service Accounts
### Secret
Check the template file [serviceaccount/github-makker-secret.yml.tpl](scripts/serviceaccount/github-makker-secret.yml.tpl) to update the GitHub/GitLab credentials. Use a Personal Access Token for the password.
The Script [serviceaccount/create-github-secret.sh](scripts/serviceaccount/create-github-secret.sh) refers to that template file to create the secret. 
### ServiceAccount
The template file [serviceaccount/github-makker-service-account.yml.tpl](scripts/serviceaccount/github-makker-service-account.yml.tpl) is used to create a service account, with a reference to the above mentioned secret.
The Script [serviceaccount/create-github-serviceaccount.sh](scripts/serviceaccount/create-github-serviceaccount.sh) refers to that template file to create the serviceaccount. 
## Persistent Volume Claims
The template file [workspaces/sources-pvc.yaml.tpl](scripts/workspaces/sources-pvc.yaml.tpl) is used to create a Persistent Volume Claim.
The Script [workspaces/create-pvc.sh](scripts/workspaces/create-pvc.sh) refers to that template file to create the PVC. 
## Tasks
###
The [tasks/list-directory-task.yml](scripts/tasks/list-directory-task.yml) describes a Task that lists the contents of a workspace. 
The Script [tasks/create-list-dir-task.sh](scripts/tasks/create-list-dir-task.sh) refers to that template file to create the task. 

