# Taken from https://github.com/redhat-scholars/tekton-tutorial/blob/master/private_repos_reg/secretworld-app-clone.yaml
apiVersion: tekton.dev/v1beta1
kind: Pipeline
metadata:
  name: clone-list-pipeline
spec:
  description: >-
    The pipeline to clone from private GitHub repo and list the directory
  params:
    - name: private-github-repo-url
      description: The private GitHub Repo
    - name: github-repo-revision
      description: The GitHub revision to use
      default: master
  workspaces:
    - name: $WS_SRC
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
