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
### list-directory
The [tasks/list-directory-task.yml](scripts/tasks/list-directory-task.yml) describes a Task that lists the contents of a workspace. 
The Script [tasks/create-list-dir-task.sh](scripts/tasks/create-list-dir-task.sh) refers to that template file to create the task. 
### os-maven clustertask
The [tasks/os-maven-clustertask.yml](scripts/tasks/os-maven-clustertask.yml) describes a Task that performs a maven command with  _openshift_  as profile. 
The Script [tasks/create-osmvn-cluster-task.sh](scripts/tasks/create-osmvn-cluster-task.sh) refers to that template file to create the clustertask. 
## Pipelines
### CloneList pipeline
The [pipelines/list-directory-task.yml](scripts/pipelines/clone-list-pipeline.yml.tpl) describes a sample Pipeline that checks out a GitHub/GitLab repository. 
The Script [pipelines/create-clone-list-pipeline.sh](scripts/pipelines/create-clone-list-pipeline.sh) refers to that template file to create the pipeline..
### fabric8-deploy-pipeline pipeline
The [pipelines/fabric8-deploy-pipeline.yml.tpl](scripts/pipelines/fabric8-deploy-pipeline.yml.tpl) describes a  Pipeline that checks out a GitHub/GitLab repository and uses a Fabric8 maven task to deploy a project. 
The Script [pipelines/create-fabric8-deploy-pipeline.sh](scripts/pipelines/create-fabric8-deploy-pipeline.sh) refers to that template file to create the pipeline..
## Pipelineruns
### Clone and List AniamlOrderSoap
The Script [pipelineruns/clonelist-animalordersoap.sh](scripts/pipelineruns/clonelist-animalordersoap.sh) starts the clone-list-pipeline, for the AnimalOrderSOAP project.
### Deploy AnimalOrderSoap
The Script [pipelineruns/deploy-animalordersoap.sh](scripts/pipelineruns/deploy-animalordersoap.sh) starts the fabric8-deploy-pipeline, for the AnimalOrderSOAP project.
## Roles
### mvn-build-config-change-controller
The [roles/mvn-build-cfg-chg-cntlr-clusterrole.yml](scripts/roles/mvn-build-cfg-chg-cntlr-clusterrole.yml) describes a role with grants needed to do a maven build with Fabric8.
The Script [roles/create-mvn-build-cfg-chg-cntlr-clusterrole.sh](scripts/roles/create-mvn-build-cfg-chg-cntlr-clusterrole.sh) refers to that template file to create the role.
The Script [roles/create-sa-mvn-build-cfg-chg-cntlr-clusterrolebinding.sh](scripts/roles/create-sa-mvn-build-cfg-chg-cntlr-clusterrolebinding.sh) grants the mvn-build-config-change-controller role to the serviceaccount.
The Script [roles/create-sa-clstr-img-reg-oper-clusterrolebinding.sh](scripts/roles/create-sa-clstr-img-reg-oper-clusterrolebinding.sh) grants the cluster-image-registry-operator role to the serviceaccount.
Removed rolebindings for 'system:image-builder' and 'system:openshift:controller:build-config-change-controller'.
## Config Maps
### spring-boot-configmaps-demo
The script [configmaps/create-sb-configmap.sh](scripts/configmaps/create-sb-configmap.sh) creates a config map to be used as an environment variable.
### application,properties
The script [configmaps/create-animalorder-appprop-configmap.sh](scripts/configmaps/create-animalorder-appprop-configmap.sh) creates a config map for the application.properties file.
### application,yml
The script [configmaps/create-animalorder-appyml-configmap.sh](scripts/configmaps/create-animalorder-appyml-configmap.sh) creates a config map for the application.yml file.
## Utils
### Nexus
Install Nexus as a mirror/cache with [utils/install_nexus.sh](scripts/utils/install_nexus.sh) 
