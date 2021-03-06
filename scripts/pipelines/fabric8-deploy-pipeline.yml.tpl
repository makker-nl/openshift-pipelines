# Taken from https://github.com/redhat-scholars/tekton-tutorial/blob/master/private_repos_reg/secretworld-app-clone.yaml
apiVersion: tekton.dev/v1beta1
kind: Pipeline
metadata:
  name: fabric8-deploy-pipeline
spec:
  description: >-
    The pipeline to clone from private GitHub repo and build using mvn fabric8:deploy
  params:
    - name: private-github-repo-url
      description: The private GitHub Repo
    - name: github-repo-revision
      description: The GitHub revision to use
      default: master
  workspaces:
    - name: $WS_SRC
    - name: $WS_MVN
  tasks:
    - name: fetch-repository
      taskRef:
        name: git-clone
        kind: ClusterTask
      params:
        - name: url
          value: $(params.private-github-repo-url)
        - name: revision
          value: $(params.github-repo-revision)
        - name: deleteExisting
          value: 'true'
      workspaces:
        - name: output
          workspace: $WS_SRC
    - name: list-fetched-repo
      taskRef:
        name: list-directory
      runAfter:
        - fetch-repository
      workspaces:
        - name: directory
          workspace: $WS_SRC
    - name: fabric8-deploy
      taskRef:
        name: maven
        kind: ClusterTask
      runAfter:
        - list-fetched-repo
      params:
        - name: GOALS
          value: ["fabric8:deploy"]
      workspaces:
        - name: source
          workspace: $WS_SRC
        - name: maven-settings
          workspace: $WS_MVN
