apiVersion: v1
kind: Secret
metadata:
  name: $SECRET_NAME
  namespace: $NS
type: kubernetes.io/basic-auth
stringData: 
  username: myuser
  password: mypassword
  hostname: $GIT_HOST
